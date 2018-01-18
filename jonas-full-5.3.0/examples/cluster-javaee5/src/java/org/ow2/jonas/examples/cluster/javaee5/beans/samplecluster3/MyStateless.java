/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2008 Bull S.A.S
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
 * $Id: MyStateless.java 19274 2010-02-23 08:50:51Z benoitf $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3;

import java.util.Properties;
import java.rmi.RemoteException;

/**
 * MyStateless interface.
 */
public interface MyStateless  {

    /**
     * Access a property stored in the JOnAS instance executing the EJB
     * container.
     * @param prop Name of the property
     * @return The value of the property
     */
    String getProperty(String prop);

    /**
     * Retreive some information of the JOnAS instance executing the EJB
     * container The names of the properties are : EJB server, EJB id, EJB
     * instance calls, EJB total calls - EJB server : name of the JOnAS instance -
     * EJB id : toString() of the MyEjb1 - EJB instance calls : number of calls
     * to this EJB instance - EJB total calls : number of calls to this EJB for
     * all instance of class MyEjb1
     * @return The Properties
     */
    Properties getInfoProps();

    /**
     * Throw a MyException
     * @throws RemoteException remote exception
     * @throws MyException application exception
     */
    void throwMyException() throws MyException;

}
