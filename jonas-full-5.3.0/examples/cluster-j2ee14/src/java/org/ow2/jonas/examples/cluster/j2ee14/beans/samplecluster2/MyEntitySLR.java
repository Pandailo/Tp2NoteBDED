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
 * $Id: MyEntitySLR.java 17406 2009-05-18 16:28:03Z eyindanga $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EntityContext;

import org.ow2.jonas.lib.bootstrap.JProp;

/**
 * Implementation of the entity bean
 * @author goebelg
 */
public abstract class MyEntitySLR implements javax.ejb.EntityBean {

    /**
     * The JOnAS instance name where the bean is executed
     */
    private String jonasInstanceName = "unknown";

    /**
     * Creation of the entity bean
     * @param number the primary key -> date.getTime() as string of creation
     * @return the entity bean
     * @throws CreateException CreateException
     */
    public Object ejbCreate(final String number) throws CreateException {

        jonasInstanceName = "unknown";

        try {
            JProp jp = JProp.getInstance();
            jonasInstanceName = jp.getValue("jonas.name");
            setNumber(number);
            setJOnASName(jonasInstanceName);
        } catch (Exception e) {
            System.out.println("Error while creating ejb : " + e.getMessage());
            throw new CreateException(e.toString());
        }
        return null;
    }

    /**
     * Post create methode invoked after create methode
     * @param number the pk of the entity bean
     */
    public void ejbPostCreate(final String number) {
    }

    /**
     * ejbLoad
     */
    public void ejbLoad() {
    }

    /**
     * ejbStore
     */
    public void ejbStore() {
    }

    /**
     * Activation of the ejb
     */
    public void ejbActivate() {
    }

    /**
     * Passivate the ejb
     */
    public void ejbPassivate() {
    }

    /**
     * Removes the ejb
     */
    public void ejbRemove() {
    }

    /**
     * Set the EntityContext
     * @param ec entity context
     */
    public void setEntityContext(final EntityContext ec) {
    }

    /**
     * Unsets the EntityContext
     */
    public void unsetEntityContext() {
    }

    /**
     * Returns the time when the bean was created
     * @return The time when the bean was created
     */
    public abstract String getNumber() throws RemoteException;

    /**
     * Sets the time when the bean was created
     * @param number The time when the bean was created
     */
    public abstract void setNumber(String number)throws RemoteException;

    /**
     * Returns the name of the JOnAS instance
     * @return Name of the JOnAS instance where the entity bean was created
     */
    public abstract String getJOnASName()throws RemoteException;

    /**
     * sets the name of the JOnAS instance
     * @param name Name of the JOnAS instance where the entity bean was created
     */
    public abstract void setJOnASName(String name)throws RemoteException;
}