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
 * $Id: HaTransactionRemote.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.j2ee14.beans.hatransactions;

import java.rmi.RemoteException;

/**
 * @author goebelg
 * Local interface for the entity bean
 */
public interface HaTransactionRemote extends javax.ejb.EJBObject {

    /**
     * Get the date formatted as string.
     * @return the date as string
     */
    String getTxid() throws RemoteException;

    /**
     * Set the date formatted as string
     * @param txid the date as string
     */
    void setTxid(String txid) throws RemoteException;
}