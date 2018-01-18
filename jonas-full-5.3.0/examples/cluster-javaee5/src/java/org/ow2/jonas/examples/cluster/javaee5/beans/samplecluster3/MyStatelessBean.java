/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2008 Bull S.A.S.
 * Contact: jonas-team@ow2.org
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
 * USA
 *
 * --------------------------------------------------------------------------
 * $Id: MyStatelessBean.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3;

import static org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.Node.QN.FIND_NODE;

import java.util.List;
import java.util.Properties;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.ow2.cmi.annotation.Cluster;
import org.ow2.cmi.annotation.Policy;
import org.ow2.cmi.annotation.Strategy;
import org.ow2.cmi.lb.policy.RoundRobin;
import org.ow2.cmi.lb.strategy.LocalPreference;
import org.ow2.jonas.lib.bootstrap.JProp;
import org.ow2.util.log.Log;
import org.ow2.util.log.LogFactory;

/**
 * This is an example of Session Bean, stateless
 * @author pelletib
 */
@Stateless
@Remote(MyStateless.class)
@Cluster(name="cluster-javaee5")
@Policy(RoundRobin.class)
@Strategy(LocalPreference.class)
public class MyStatelessBean implements MyStateless {

    /**
     * Entity manager used by this bean.
     */
    @PersistenceContext
    private EntityManager entityManager = null;

    /**
     * The logger.
     */
    private Log logger = LogFactory.getLog(MyStatelessBean.class);


    /**
     * Find a given {@link Node} using it's name as a key.
     * @param name {@link Node}'s name.
     * @return the first {@link Node} that matches the given name.
     */
    @SuppressWarnings("unchecked")
    private Node findNode(final String name) {
        Query query = entityManager.createNamedQuery(FIND_NODE);
        query.setParameter("name", name);
        List<Node> nodes = query.getResultList();
        if (nodes != null && nodes.size() > 0) {
            return nodes.get(0);
        }
        return null;
    }

    /**
     *
     * @return the JOnAS instance name
     * @throws Exception if the property is not present
     */
    private String getName() throws Exception {

        try {
            JProp jp = JProp.getInstance();
            return jp.getValue("jonas.name");
        } catch (Exception e) {
            logger.error("Error while getting 'jonas.name' property", e);
            throw e;
        }
    }

    /**
     * Updates the properties described above
     * @param name JOnAS instance name
     */
    private int updateStatistics(final String name) {

        Node node = findNode(name);
        if (node == null) {
            node = new Node() ;
            node.setName(name);
            node.setInvocationNumber(1);
        } else {
            node.setInvocationNumber(node.getInvocationNumber() + 1);
        }
        entityManager.persist(node);

        logger.info("JOnAS={0} ; ejb={1} ; total calls={2}", name, this.toString(), node.getInvocationNumber() );
        return node.getInvocationNumber();
    }


    /**
     * @return get properties about processing node
     */
    public Properties getInfoProps() {
        String name;
        try {
            name = getName();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        int in = updateStatistics(name);
        Properties p = new Properties();
        p.setProperty("EJB server", name);
        p.setProperty("EJB id", this.toString());
        p.setProperty("EJB total calls", (new Integer(in)).toString());
        return p;
    }

    /**
     * @return get a property value
     */
    public String getProperty(final String prop) {
        String s = "unknown";
        try {
            JProp jp = JProp.getInstance();
            s = jp.getValue(prop);
        } catch (Exception e) {
            logger.fatal("Error while getProperty)(", e);
            return null;
        }
        return s;

    }

    /**
     * @throws MyException generates an exception
     */
    public void throwMyException() throws MyException {
        String name = "";
        try {
            name = getName();
        } catch (Exception e) {
            e.printStackTrace();
        }
        throw new MyException("From MyStateless(" + name + ")");

    }

}
