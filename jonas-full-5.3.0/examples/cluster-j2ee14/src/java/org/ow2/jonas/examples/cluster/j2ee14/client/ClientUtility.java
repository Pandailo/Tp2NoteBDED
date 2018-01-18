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
 * $Id: ClientUtility.java 17406 2009-05-18 16:28:03Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.client;

import java.rmi.RemoteException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1Home;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyStateful;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyStatefulHome;


/**
 * Fat client : generic methods
 */
public class ClientUtility {

    /**
     * Constructor. Hide constructor as it is an utility class
     */
    private ClientUtility() {
    }

    /**
     * @return MyEjb1 home object
     * @throws Exception any.
     */
    protected static MyEjb1Home getMyEjb1Home() throws Exception {

        MyEjb1Home home = null;
        Context ctx = null;

        try {
            ctx = new InitialContext();
        } catch (NamingException e) {
            throw new Exception("Exception in getMyEjb1Home. Unable to create context ", e);
        }

        // Lookup bean home
        String bName = "MyEjb1Home";
        try {
            home = (MyEjb1Home) PortableRemoteObject.narrow(ctx.lookup(bName), MyEjb1Home.class);
            ctx.close();
        } catch (Exception e) {
            //e.printStackTrace();
            //System.exit(2);
            throw new Exception("Exception in getMyEjb1Home. Unable to get home reference ", e);
        }

        return home;
    }
    /**
     * Gets the entity bean reference.
     * @param home home object
     * @return MyEjb1 remote object
     * @throws Exception any.
     */
    protected static MyEjb1 getMyEjb1Bean(final MyEjb1Home home) throws Exception {

        MyEjb1 bean = null;

        try {
            bean = home.create();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Exception in getMyEjb1Bean. Unable to invoke home.create() ", e);
            //System.exit(2);
        }
        return bean;
    }

    /**
     * Gets home for stateful bean.
     * @return MyStateful home object
     * @throws Exception any.
     */
    protected static MyStatefulHome getMyStatefulHome() throws Exception {
        MyStatefulHome home = null;
        Context ctx = null;

        try {
            ctx = new InitialContext();
        } catch (NamingException e) {
            throw new RemoteException("Exception in getMyStatefulHome. Unable to create context ", e);
        }

        // Lookup bean home
        String bName = "MyStatefulHome";
        try {
            home = (MyStatefulHome) PortableRemoteObject.narrow(ctx.lookup(bName), MyStatefulHome.class);
            ctx.close();
        } catch (Exception e) {
            //System.exit(2);
            throw new Exception("Exception in getMyStatefulHome. Unable get home reference ", e);
        }
        return home;
    }
    /**
     * Gets the stateful bean from home.
     * @param home home object
     * @return MyStateful remote object
     * @throws Exception any.
     */
    protected static MyStateful getMyStatefulBean(final MyStatefulHome home) throws Exception {

        MyStateful bean = null;

        try {
            bean = home.create();
        } catch (Exception e) {
            //System.exit(2);
            throw new Exception("Exception in getMyStatefulHome. Unable invoke home.create()", e);
        }
        return bean;
    }
}

