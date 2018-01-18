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
 * $Id: MyStateful.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2;

import java.rmi.RemoteException;

import javax.ejb.EJBObject;

/**
 * MyStateful remote interface
 */
public interface MyStateful extends EJBObject {

    /**
     * Initializes the inner beans
     * @throws RemoteException fi invocation fails
     */
    void initialize() throws RemoteException;
    
    /**
     * Keep the parameter in a list. Note : the parameter represents a line in
     * the "session servlet output" screen
     * @param s The string to keep.
     * @throws RemoteException if invocation fails
     */
    void log(java.lang.String s) throws RemoteException;

    /**
     * Keep the parameter in a list keeping track of the JOnAS instance
     * @param s The string to keep.
     * @throws RemoteException if invocation fails
     */
    void logWithJOnASInstance(java.lang.String s) throws RemoteException;

    /**
     * Retreive all the data in the log table Note : The return value is the
     * data shown in the "session servlet output" screen
     * @return All the logged data
     * @throws RemoteException if invocation fails
     */
    java.lang.StringBuffer getLogDump() throws RemoteException;

    /**
     * Retreive all the data in the log table Note : The return value is the
     * text format (calls from the java client)
     * @return All the logged data
     * @throws RemoteException if invocation fails
     */
    java.lang.StringBuffer getLogTextDump() throws RemoteException;


    /**
     * Set the http sessionid of the caller.
     * @param s The sessionid of the caller.
     * @throws RemoteException if invocation fails
     */
    void setHTTPSessionId(java.lang.String s) throws RemoteException;

    /**
     * Get the stored http sessionid of the caller.
     * @return The stored sessionid.
     * @throws RemoteException if invocation fails
     */
    java.lang.String getHTTPSessionId() throws RemoteException;

}