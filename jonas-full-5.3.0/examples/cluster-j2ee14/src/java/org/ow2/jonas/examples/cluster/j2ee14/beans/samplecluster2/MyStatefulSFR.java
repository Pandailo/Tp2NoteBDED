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
 * Initial developer(s):
 * --------------------------------------------------------------------------
 * $Id: MyStatefulSFR.java 17406 2009-05-18 16:28:03Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2;


import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.ejb.CreateException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.ejb.SessionSynchronization;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.objectweb.util.monolog.api.BasicLevel;
import org.objectweb.util.monolog.api.Logger;
import org.ow2.jonas.lib.bootstrap.JProp;
import org.ow2.jonas.lib.util.Log;

/**
 *
 */
public class MyStatefulSFR implements SessionBean, SessionSynchronization {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * After the transaction begun
     */
    public void afterBegin() {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * before the commit is executed
     */
    public void beforeCompletion() {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * after the commit or rollback
     * @param committed true -> commit, false -> rollback
     */
    public void afterCompletion(final boolean committed) {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * Set the session context
     * @param ctx the session context
     */
    public void setSessionContext(final SessionContext ctx) {
        if (logger == null) {
            logger = Log.getLogger("org.ow2.jonas_tests");
        }
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * removes the ejb
     */
    public void ejbRemove() {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * creation of the ejb
     * @throws RemoteException
     */
    public void ejbCreate() throws RemoteException {
        logger.log(BasicLevel.DEBUG, "");
        creatorJonasInstanceName = "unknown";

        try {
            JProp jp = JProp.getInstance();
            creatorJonasInstanceName = jp.getValue("jonas.name");
            log = new ArrayList(MAXSIZE);
            logger.log(BasicLevel.DEBUG, "ejbCreate()->" + this.toString());
            isModified = true;
        } catch (Exception e) {
            logger.log(BasicLevel.FATAL, "Ejb create Exception: " + e.getMessage());
            throw new RemoteException("Ejb create Exception: " , e);
        }
    }

    /**
     * Passivate of the ejb
     */
    public void ejbPassivate() {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * activation of the ejb
     */
    public void ejbActivate() {
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * Initializes the inner beans
     * @throws RemoteException
     */
    public void initialize() throws RemoteException {
        logger.log(BasicLevel.DEBUG, "");

        localStateful = createLocalStateful();
        Date date = new Date();
        localEntity = createEntity(Long.toString(date.getTime()));
        isModified = true;
    }

    /**
     * Keep the parameter in a list. Note : the parameter represents a line in
     * the "session servlet output" screen
     * @param s The string to keep.
     * @throws RemoteException
     * @throws RemoteException
     */
    public void log(final java.lang.String s) throws RemoteException {
        logger.log(BasicLevel.DEBUG, "");

        if (log.size() == MAXSIZE) {
            Iterator iter = log.iterator();
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
     * @throws RemoteException
     */
    public void logWithJOnASInstance(final java.lang.String s) throws RemoteException {
        logger.log(BasicLevel.DEBUG, "");

        if (log.size() == MAXSIZE) {
            Iterator iter = log.iterator();
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
     * @throws RemoteException
     */
    public java.lang.StringBuffer getLogDump() throws RemoteException {
        logger.log(BasicLevel.DEBUG, "");

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
        sb.append(getLocalEntity().getNumber());
        sb.append("\n");

        Iterator iter = log.iterator();

        sb.append("<table border=1><tr><td>servlet running on</td><td>stateless bean created on</td><td>stateless bean total calls</td><td>entity bean created on</td></tr>");
        while (iter.hasNext()) {
            sb.append(iter.next());
        }
        sb.append("</table>");

        logger.log(BasicLevel.INFO, sb.toString());
        return sb;
    }

    /**
     * Retreive all the data in the log table Note : The return value is the
     * text format (calls from the java client)
     * @return All the logged data
     * @throws RemoteException
     */
    public java.lang.StringBuffer getLogTextDump() throws RemoteException {
        logger.log(BasicLevel.DEBUG, "");

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
        sb.append(getLocalEntity().getNumber());
        sb.append("\n");

        Iterator iter = log.iterator();
        int i = 1;
        sb.append("Log entries -> \n");
        while (iter.hasNext()) {
            sb.append("   " + i + " : ");
            sb.append((String) iter.next());
            sb.append("\n");
            i++;
        }
        sb.append("End\n");

        logger.log(BasicLevel.INFO, sb.toString());
        return sb;
    }

    /**
     * Set the http sessionid of the caller.
     * @param s The sessionid of the caller.
     * @throws RemoteException
     */
    public void setHTTPSessionId(final java.lang.String s) {
        logger.log(BasicLevel.DEBUG, "");
        callerHTTPSessionId = s;

        isModified = true;
    }

    /**
     * Get the stored http sessionid of the caller.
     * @return The stored sessionid.
     * @throws RemoteException
     */
    public java.lang.String getHTTPSessionId() {
        logger.log(BasicLevel.DEBUG, "");
        return callerHTTPSessionId;
    }

    /**
     * The JOnAS node name where the bean is executed
     * the field is transient because we don't want to passivate or replicate it
     */
    private transient String creatorJonasInstanceName = "unknown";

    /**
     * The logger
     */
    private static Logger logger = null;


    /**
     * The maximum number of values to conserve
     */
    private static final int MAXSIZE = 20;

    /**
     * The log output
     */
    private ArrayList log = null;

    /**
     * caller http session id
     */
    private String callerHTTPSessionId = null;

    private MyStatefulInnerLocal localStateful = null;

    private MyEntityLocal localEntity = null;

    private transient boolean isModified = true;

    /**
     * Creates a new Entity bean with the time as parameter
     * @param valeur The current time as string
     * @return A new Entity Bean
     */
    private MyStatefulInnerLocal createLocalStateful() throws RemoteException {
        InitialContext cntx;
        MyStatefulInnerLocal result = null;
        try {
            cntx = new InitialContext();
            MyStatefulInnerLocalHome statefulHome = (MyStatefulInnerLocalHome) cntx.lookup("MyStatefulInnerHome_L");
            result = statefulHome.create();
        } catch (NamingException e) {
            logger.log(BasicLevel.FATAL, "Naming exception : " + e.getMessage());
            throw new RemoteException("Naming exception : " + e.getMessage());
        } catch (CreateException e) {
            logger.log(BasicLevel.FATAL, "Create exception : " + e.getMessage());
            throw new RemoteException("Create exception : " + e.getMessage());
        }
        return result;
    }

    /**
     * Returns the local stateful bean
     * @return the local stateful bean
     */
    private MyStatefulInnerLocal getLocalStateful() throws RemoteException {
        if (localStateful == null) {
            localStateful = createLocalStateful();
            isModified = true;
        }
        return localStateful;
    }
    /**
     * Creates a new Entity bean with the time as parameter
     * @param valeur The current time as string
     * @return A new Entity Bean
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
            throw new RemoteException("Naming exception : " + e.getMessage());
        } catch (CreateException e) {
            logger.log(BasicLevel.FATAL, "Create exception : " + e.getMessage());
            throw new RemoteException("Create exception : " + e.getMessage());
        }
        return result;
    }

    /**
     * Returns the local entity bean
     * @return the local entity bean
     */
    private MyEntityLocal getLocalEntity() throws RemoteException {
        if (localEntity == null) {
            Date date = new Date();
            localEntity = createEntity(Long.toString(date.getTime()));
            isModified = true;
        }
        return localEntity;
    }

    public boolean isModified() {
        boolean result = isModified;
        isModified = false;
        return result;
    }
}

