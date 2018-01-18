/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2005-2006 Bull S.A.S
 * Contact: jonas-team@objectweb.org
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
 * $Id: MyEjb1SLR.java 17406 2009-05-18 16:28:03Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2;

import java.rmi.RemoteException;
import java.util.Date;
import java.util.Properties;

import javax.ejb.CreateException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.objectweb.util.monolog.api.BasicLevel;
import org.objectweb.util.monolog.api.Logger;
import org.ow2.jonas.lib.bootstrap.JProp;
import org.ow2.jonas.lib.util.Log;

/**
 * @author goebelg
 * Implementation of a stateless session bean
 */
public class MyEjb1SLR implements SessionBean {

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    /**
     * After how many invokes an entity bean is created
     */
    private static final int DIV = 10;
    /**
     * Sets the session Context.
     * @param ctx the session context
     */
    public void setSessionContext(final SessionContext ctx) {
        if (logger == null) {
            logger = Log.getLogger("org.ow2.jonas_tests");
        }
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * Removes the ejb.
     */
    public void ejbRemove() {
        logger.log(BasicLevel.DEBUG, "Remove the Bean");
    }

    /**
     * Creates the ejb.
     * @throws Exception any.
     */
    public void ejbCreate() throws RemoteException {

        logger.log(BasicLevel.DEBUG, "");
        jonasInstanceName = "unknown";

        try {
            JProp jp = JProp.getInstance();
            jonasInstanceName = jp.getValue("jonas.name");
        } catch (Exception e) {
            logger.log(BasicLevel.FATAL, "Error while creating MyEjb1SLR : " + e.getMessage());
            throw new RemoteException("Error while creating MyEjb1SLR", e);
        }
        logger.log(BasicLevel.DEBUG, "ejbCreate()->" + this.toString());
    }

    /**
     * Passivate of the ejb.
     */
    public void ejbPassivate() {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * Activation of the ejb.
     */
    public void ejbActivate() {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * Access a property stored in the JOnAS instance executing the EJB
     * container.
     * @param prop Name of the property
     * @return The value of the property
     * @throws Exception any.
     */
    public String getProperty(final String prop) throws RemoteException {
        String s = "unknown";
        try {
            JProp jp = JProp.getInstance();
            s = jp.getValue(prop);
        } catch (Exception e) {
            logger.log(BasicLevel.FATAL, "Error while getProperty : " + e.getMessage());
            throw new RemoteException("Error in getProperty ", e);
        }
        return s;
    }

    /**
     * Throw a MyException.
     * @throws MyException application exception
     */
    public void throwMyException() throws MyException {
        throw new MyException("From EjbSLR1(" + jonasInstanceName + ")");
    }

    /**
     * Retreive some information of the JOnAS instance executing the EJB
     * container The names of the properties are : EJB server, EJB id, EJB
     * instance calls, EJB total calls - EJB server : name of the JOnAS instance -
     * EJB id : toString() of the MyEjb1 - EJB instance calls : number of calls
     * to this EJB instance - EJB total calls : number of calls to this EJB for
     * all instance of class MyEjb1
     * @return The Properties
     * @throws RemoteException any.
     */
    public Properties getInfoProps() throws RemoteException {
        updateStatistics();
        Properties p = new Properties();
        p.setProperty("EJB server", jonasInstanceName);
        p.setProperty("EJB id", this.toString());
        p.setProperty("EJB total calls", (new Integer(allInstancesTotalCallsCount)).toString());
        p.setProperty("EJB server entity created", entityJonasInstanceName);
        return p;
    }

    /**
     * Updates the properties described above
     * @throws RemoteException any.
     */
    private void updateStatistics() throws RemoteException {
        allInstancesTotalCallsCount++;

        // create an entity bean every 10 times
        if ((allInstancesTotalCallsCount % DIV) == 0) {
            // creating a new entity bean
            logger.log(BasicLevel.INFO, "Trying to create the entity");
            Date date = new Date();
            MyEntityLocal entity = createEntity(Long.toString(date.getTime()));
            logger.log(BasicLevel.INFO, "Finished to create the entity");
            entityJonasInstanceName = entity.getJOnASName();
        } else {
            entityJonasInstanceName = "No entity Bean created";
        }

        logger.log(BasicLevel.INFO, "JOnAS=" + jonasInstanceName + " ; ejb=" + this.toString() + " ; total calls="
                + allInstancesTotalCallsCount + " ; entity created on=" + entityJonasInstanceName);
    }

    /**
     * Creates a new Entity bean with the time as parameter
     * @param valeur The current time as string
     * @return A new Entity Bean
     * @throws RemoteException any.
     */
    private MyEntityLocal createEntity(final String valeur) throws RemoteException {
        InitialContext cntx;
        MyEntityLocal result = null;
        try {
            cntx = new InitialContext();
            MyEntityLocalHome entityHome = (MyEntityLocalHome) cntx.lookup("MyEntityHome_L");
            result = entityHome.create(valeur);
        } catch (NamingException e) {
            logger.log(BasicLevel.FATAL, "Naming exception : " + e.getMessage());
            throw new RemoteException("Naming exception : ", e);
        } catch (CreateException e) {
            logger.log(BasicLevel.FATAL, "Create exception : " + e.getMessage());
            throw new RemoteException( "Create exception : ", e);
        }
        return result;
    }

    /**
     * The logger
     */
    private static Logger logger = null;


    /**
     * the node name of the jonas instance where an
     * entity bean has bean created
     */
    private String entityJonasInstanceName = "unknown";

    /**
     * the node name of the jonas instance where the
     * session bean is executed
     */
    private String jonasInstanceName = "unknown";

    /**
     * counts all the instances created of this class in
     * that JVM
     */
    private static int allInstancesTotalCallsCount = 0;
}

