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
 * $Id: MyStatefulBean.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3;


import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.Handle;
import javax.ejb.Remote;
import javax.ejb.Remove;
import javax.ejb.SessionContext;
import javax.ejb.SessionSynchronization;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ow2.cmi.annotation.Cluster;
import org.ow2.cmi.annotation.Policy;
import org.ow2.cmi.annotation.Strategy;
import org.ow2.cmi.lb.policy.RoundRobin;
import org.ow2.cmi.lb.strategy.LocalPreference;
import org.ow2.jonas.lib.bootstrap.JProp;
import org.ow2.util.log.Log;
import org.ow2.util.log.LogFactory;

/**
 *
 */
@Stateful
@Remote(MyStateful.class)
@Cluster(name="cluster-javaee5", isReplicated=false)
@Policy(RoundRobin.class)
@Strategy(LocalPreference.class)
public class MyStatefulBean implements SessionSynchronization,MyStateful {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Entity manager used by this bean.
     */
    @PersistenceContext
    private EntityManager entityManager = null;

    /**
     * Session context
     */
    @Resource
    private SessionContext sessionContext = null;
    /**
     * The logger.
     */
    private Log logger = LogFactory.getLog(MyStatefulBean.class);

    /**
     * The JOnAS node name where the bean is executed
     * the field is transient because we don't want to passivate or replicate it
     */
    private transient String creatorJonasInstanceName = "unknown";

    /**
     * The maximum number of values to conserve
     */
    private static final int MAXSIZE = 20;

    /**
     * The log output
     */
    private ArrayList<String> log = null;

    /**
     * caller http session id
     */
    private String callerHTTPSessionId = null;

    @EJB
    private MyStatefulInner localStateful = null;

    private Node localEntity = null;

    private transient boolean isModified = true;

    /**
     * After the transaction begun
     */
    public void afterBegin() {
        logger.debug("");
    }

    /**
     * before the commit is executed
     */
    public void beforeCompletion() {
        logger.debug("");
    }

    /**
     * after the commit or rollback
     * @param committed true -> commit, false -> rollback
     */
    public void afterCompletion(final boolean committed) {
        logger.debug("");
    }

    /**
     * Init
     */
    @PostConstruct
    public void init() {
        creatorJonasInstanceName = "unknown";
        try {
            JProp jp = JProp.getInstance();
            creatorJonasInstanceName = jp.getValue("jonas.name");
        } catch (Exception e) {
            logger.fatal(e.getMessage(), e);
        }

        log = new ArrayList<String>(MAXSIZE);
        logger.debug("->" + this.toString());
        isModified = true;
    }

    /**
     * Initializes the inner beans
     */
    public void initialize() {
        logger.debug("");
        Date date = new Date();
        isModified = true;
    }

    /**
     * Keep the parameter in a list. Note : the parameter represents a line in
     * the "session servlet output" screen
     * @param s The string to keep.
     */
    public void log(final java.lang.String s) {
        logger.debug("");

        if (log.size() == MAXSIZE) {
            Iterator<String> iter = log.iterator();
            iter.next();
            iter.remove();
        }

        log.add(s);

        // Call local stateful
        getLocalStateful().increment();

        isModified = true;
    }

    /**
     * Keep the parameter in a list with the source node
     * @param s The string to keep.
     * @throws RemoteException
     */
    public void logWithJOnASInstance(final java.lang.String s) {
        logger.debug("");

        if (log.size() == MAXSIZE) {
            Iterator<String> iter = log.iterator();
            iter.next();
            iter.remove();
        }

        log.add("JOnAS instance=" + creatorJonasInstanceName + " - " + s);

        // Call local stateful
        getLocalStateful().increment();

        isModified = true;
    }
    /**
     * Retreive all the data in the log table Note : The return value is the
     * data shown in the "session servlet output" screen
     * @return All the logged data
     */
    public java.lang.StringBuffer getLogDump() {
        logger.debug("");

        StringBuffer sb = new StringBuffer();
        sb.append("JOnAS instance=");
        sb.append(creatorJonasInstanceName);
        sb.append(" ; EJB=");
        sb.append(this.toString());
        sb.append("\n");
        sb.append("Owner: ");
        sb.append(callerHTTPSessionId);
        sb.append("\n");

        sb.append("Inner count: ");
        sb.append(getLocalStateful().getCount());
        sb.append("\n");

        sb.append("Local entity: ");
        sb.append(getLocalEntity().getName());
        sb.append("\n");

        Iterator<String> iter = log.iterator();

        sb.append("<table border=1><tr><td>servlet running on</td><td>stateless bean created on</td><td>stateless bean total calls</td></tr>");
        while (iter.hasNext()) {
            sb.append(iter.next());
        }
        sb.append("</table>");

        logger.info(sb.toString());
        return sb;
    }

    /**
     * Retreive all the data in the log table Note : The return value is the
     * text format (calls from the java client)
     * @return All the logged data
     */
    public java.lang.StringBuffer getLogTextDump() {
        logger.debug("");

        StringBuffer sb = new StringBuffer();
        sb.append("JOnAS instance=");
        sb.append(creatorJonasInstanceName);
        sb.append(" ; EJB=");
        sb.append(this.toString());
        sb.append("\n");

        sb.append("Inner count: ");
        sb.append(getLocalStateful().getCount());
        sb.append("\n");

        sb.append("Local entity: ");
        sb.append(getLocalEntity().getName());
        sb.append("\n");

        Iterator<String> iter = log.iterator();
        int i = 1;
        sb.append("Log entries -> \n");
        while (iter.hasNext()) {
            sb.append("   " + i + " : ");
            sb.append(iter.next());
            sb.append("\n");
            i++;
        }
        sb.append("End\n");

        logger.info(sb.toString());
        return sb;
    }

    /**
     * Set the http sessionid of the caller.
     * @param s The sessionid of the caller.
     * @throws RemoteException
     */
    public void setHTTPSessionId(final java.lang.String s) {
        logger.debug("");
        callerHTTPSessionId = s;
        isModified = true;
    }

    /**
     * Get the stored http sessionid of the caller.
     * @return The stored sessionid.
     * @throws RemoteException
     */
    public java.lang.String getHTTPSessionId() {
        logger.debug("");
        return callerHTTPSessionId;
    }

    /**
     *
     * @return the local stateful bean
     */
    private MyStatefulInner getLocalStateful() {
        return localStateful;
    }

    /**
     * Creates a new Entity bean with the time as parameter
     * @param valeur The current time as string
     * @return A new Entity Bean
     */
    private Node createEntity(final String valeur) {

        Node node = new Node() ;
        node.setName(valeur);
        node.setInvocationNumber(1);

        entityManager.persist(node);

        logger.info("node.name=", valeur );

        return node;
    }

    /**
     * Returns the local entity bean
     * @return the local entity bean
     */
    private Node getLocalEntity() {
        if (localEntity == null) {
            Date date = new Date();
            localEntity = createEntity("SFSB_" + creatorJonasInstanceName + "_" + Long.toString(date.getTime()));
            isModified = true;
        }
        return localEntity;
    }

    public boolean isModified() {
        boolean result = isModified;
        isModified = false;
        return result;
    }

    /**
     * @return handle on the stateful
     */
    public Handle getMyHandle() {
        Handle handle = null;
        try {
            handle = sessionContext.getEJBObject().getHandle();
        } catch (RemoteException e) {
            logger.error("Unable to get SFSB handle", e);
        } catch (IllegalStateException e) {
            logger.error("Unable to get SFSB handle", e);
        }
        return handle;
    }


    /**
     * cleanup all fields
     */
    @Remove
    public void cleanup() {
        logger.debug("cleanup all fields");
        this.localEntity = null;
        this.log = null;
        this.callerHTTPSessionId = null;
    }
}

