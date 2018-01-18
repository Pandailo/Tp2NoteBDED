/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 1999-2004 Bull S.A.
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
 * Initial developer(s):
 * --------------------------------------------------------------------------
 * $Id: OpBean.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.earsample.beans.secusb;

import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.ejb.SessionSynchronization;

/**
 * This is an example of Session Bean, statefull, and synchronized.
 * @author JOnAS team
 */
public class OpBean implements SessionBean, SessionSynchronization {

    /**
     * Actual state of the bean
     */
    private int total = 0;

    /**
     * value inside Tx, not yet committed.
     */
    private int newtotal = 0;

    /**
     * User client
     */
    private String clientUser = null;

    /**
     * Session context that the container provides for a session enterprise Bean
     * instance.
     */
    private SessionContext sessionContext = null;

    /* ========================= ejbCreate methods ============================ */

    /**
     * There must be one ejbCreate() method per create() method on the Home
     * interface, and with the same signature.
     * @param user the user name
     */
    public void ejbCreate(String user) {
        total = 0;
        // in case we are outside transactions
        newtotal = total;
        clientUser = user;
    }

    /* =============== javax.ejb.SessionBean 2.0 implementation ============== */

    /**
     * The activate method is called when the instance is activated from its
     * "passive" state. The instance should acquire any resource that it has
     * released earlier in the ejbPassivate() method. This method is called with
     * no transaction context.
     * @throws EJBException Thrown by the method to indicate a failure caused by
     *         a system-level error.
     * @throws java.rmi.RemoteException This exception is defined in the method
     *         signature to provide backward compatibility for enterprise beans
     *         written for the EJB 1.0 specification. Enterprise beans written
     *         for the EJB 1.1 specification should throw the
     *         javax.ejb.EJBException instead of this exception. Enterprise
     *         beans written for the EJB2.0 and higher specifications must throw
     *         the javax.ejb.EJBException instead of this exception.
     */
    public void ejbActivate() throws EJBException, java.rmi.RemoteException {
        // Nothing to do for this simple example
    }

    /**
     * The passivate method is called before the instance enters the "passive"
     * state. The instance should release any resources that it can re-acquire
     * later in the ejbActivate() method. After the passivate method completes,
     * the instance must be in a state that allows the container to use the Java
     * Serialization protocol to externalize and store away the instance's
     * state. This method is called with no transaction context.
     * @throws EJBException Thrown by the method to indicate a failure caused by
     *         a system-level error.
     * @throws java.rmi.RemoteException This exception is defined in the method
     *         signature to provide backward compatibility for enterprise beans
     *         written for the EJB 1.0 specification. Enterprise beans written
     *         for the EJB 1.1 specification should throw the
     *         javax.ejb.EJBException instead of this exception. Enterprise
     *         beans written for the EJB2.0 and higher specifications must throw
     *         the javax.ejb.EJBException instead of this exception.
     */
    public void ejbPassivate() throws EJBException, java.rmi.RemoteException {
        // Nothing to do for this simple example
    }

    /**
     * A container invokes this method before it ends the life of the session
     * object. This happens as a result of a client's invoking a remove
     * operation, or when a container decides to terminate the session object
     * after a timeout. This method is called with no transaction context.
     * @throws EJBException Thrown by the method to indicate a failure caused by
     *         a system-level error.
     * @throws java.rmi.RemoteException This exception is defined in the method
     *         signature to provide backward compatibility for enterprise beans
     *         written for the EJB 1.0 specification. Enterprise beans written
     *         for the EJB 1.1 specification should throw the
     *         javax.ejb.EJBException instead of this exception. Enterprise
     *         beans written for the EJB2.0 and higher specifications must throw
     *         the javax.ejb.EJBException instead of this exception.
     */
    public void ejbRemove() throws EJBException, java.rmi.RemoteException {
        // Nothing to do for this simple example
    }

    /**
     * Set the associated session context. The container calls this method after
     * the instance creation. The enterprise Bean instance should store the
     * reference to the context object in an instance variable. This method is
     * called with no transaction context.
     * @param sessionContext A SessionContext interface for the instance.
     * @throws EJBException Thrown by the method to indicate a failure caused by
     *         a system-level error.
     * @throws java.rmi.RemoteException This exception is defined in the method
     *         signature to provide backward compatibility for applications
     *         written for the EJB 1.0 specification. Enterprise beans written
     *         for the EJB 1.1 specification should throw the
     *         javax.ejb.EJBException instead of this exception. Enterprise
     *         beans written for the EJB2.0 and higher specifications must throw
     *         the javax.ejb.EJBException instead of this exception.
     */
    public void setSessionContext(SessionContext sessionContext) throws EJBException, java.rmi.RemoteException {
        this.sessionContext = sessionContext;
    }

    /*
     * ============== javax.ejb.SessionSynchronization implementation
     * =============
     */

    /**
     * The afterBegin method notifies a session Bean instance that a new
     * transaction has started, and that the subsequent business methods on the
     * instance will be invoked in the context of the transaction. The instance
     * can use this method, for example, to read data from a database and cache
     * the data in the instance fields. This method executes in the proper
     * transaction context.
     * @throws EJBException Thrown by the method to indicate a failure caused by
     *         a system-level error.
     * @throws java.rmi.RemoteException - This exception is defined in the
     *         method signature to provide backward compatibility for enterprise
     *         beans written for the EJB 1.0 specification. Enterprise beans
     *         written for the EJB 1.1 and higher specifications should throw
     *         the javax.ejb.EJBException instead of this exception. Enterprise
     *         beans written for the EJB 2.0 and higher specifications must not
     *         throw the java.rmi.RemoteException.
     */
    public void afterBegin() throws EJBException, java.rmi.RemoteException {
        newtotal = total;
    }

    /**
     * The beforeCompletion method notifies a session Bean instance that a
     * transaction is about to be committed. The instance can use this method,
     * for example, to write any cached data to a database. This method executes
     * in the proper transaction context. <b>Note: </b> The instance may still
     * cause the container to rollback the transaction by invoking the
     * setRollbackOnly() method on the instance context, or by throwing an
     * exception.
     * @throws EJBException Thrown by the method to indicate a failure caused by
     *         a system-level error.
     * @throws java.rmi.RemoteException - This exception is defined in the
     *         method signature to provide backward compatibility for enterprise
     *         beans written for the EJB 1.0 specification. Enterprise beans
     *         written for the EJB 1.1 and higher specifications should throw
     *         the javax.ejb.EJBException instead of this exception. Enterprise
     *         beans written for the EJB 2.0 and higher specifications must not
     *         throw the java.rmi.RemoteException.
     */
    public void beforeCompletion() throws EJBException, java.rmi.RemoteException {
    }

    /**
     * The afterCompletion method notifies a session Bean instance that a
     * transaction commit protocol has completed, and tells the instance whether
     * the transaction has been committed or rolled back. This method executes
     * with no transaction context.
     * @param committed - True if the transaction has been committed, false if
     *        is has been rolled back.
     * @throws EJBException Thrown by the method to indicate a failure caused by
     *         a system-level error.
     * @throws java.rmi.RemoteException - This exception is defined in the
     *         method signature to provide backward compatibility for enterprise
     *         beans written for the EJB 1.0 specification. Enterprise beans
     *         written for the EJB 1.1 and higher specifications should throw
     *         the javax.ejb.EJBException instead of this exception. Enterprise
     *         beans written for the EJB 2.0 and higher specifications must not
     *         throw the java.rmi.RemoteException.
     */
    public void afterCompletion(boolean committed) throws EJBException, java.rmi.RemoteException {

        if (committed) {
            total = newtotal;
        } else {
            newtotal = total;
        }
    }

    /* ========================= Op implementation ============================ */

    /**
     * Business method implementation.
     * @param s nb of shares to be bought
     */
    public void buy(int s) {
        newtotal = newtotal + s;
        return;
    }

    /**
     * Business method implementation.
     * @return the nb of shares bought
     */
    public int read() {
        return newtotal;
    }
}