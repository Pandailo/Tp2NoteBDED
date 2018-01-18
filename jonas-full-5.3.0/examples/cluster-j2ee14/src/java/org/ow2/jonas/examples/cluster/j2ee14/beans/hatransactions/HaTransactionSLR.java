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
 * $Id: HaTransactionSLR.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.j2ee14.beans.hatransactions;

import javax.ejb.CreateException;
import javax.ejb.EntityContext;

/**
 * Implementation of the entity bean
 * @author goebelg
 */
public abstract class HaTransactionSLR implements javax.ejb.EntityBean {

    /**
     * Creation of the entity bean
     * @param txid the primary key -> date.getTime() as string of creation
     * @return the entity bean
     * @throws CreateException CreateException
     */
    public Object ejbCreate(String txid) throws CreateException {
        setTxid(txid);
        return null;
    }

    /**
     * Post create methode invoked after create methode
     * @param number the pk of the entity bean
     */
    public void ejbPostCreate(String txid) {
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
    public void setEntityContext(EntityContext ec) {
    }

    /**
     * Unsets the EntityContext
     */
    public void unsetEntityContext() {
    }

    /**
     * Returns the txid
     * @return The txid
     */
    public abstract String getTxid();

    /**
     * Sets the txid
     * @param txid The txid
     */
    public abstract void setTxid(String txid);
}