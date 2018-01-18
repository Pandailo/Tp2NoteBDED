/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2005 Bull S.A.
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
 * $Id:AbstractServlet.java 14651 2008-07-28 11:50:13Z eyindanga $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.j2ee14.servlets;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServlet;

import org.objectweb.util.monolog.api.BasicLevel;
import org.objectweb.util.monolog.api.Logger;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1Home;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyStateful;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyStatefulHome;
import org.ow2.jonas.lib.bootstrap.JProp;
import org.ow2.jonas.lib.util.Log;

/**
 * @author goebelg
 *
 * Servlet super class
 */
public abstract class AbstractServlet extends HttpServlet {

    /**
     * Servlet initialization
     */
    @Override
    public void init() {

        if (logger == null) {
            logger = Log.getLogger("org.ow2.jonas_tests");
        }
        logger.log(BasicLevel.DEBUG, "");
    }

    /**
     * Creates a new Statefull session bean.
     * @return A new session bean
     */
    public MyStateful createStatefulEJB() {
        Context ctx = null;
        MyStatefulHome home = null;
        MyStateful bean = null;

        try {
            ctx = new InitialContext();
        } catch (NamingException e) {
            e.printStackTrace();
        }

        // Lookup bean home
        String bName = "java:comp/env/ejb/MyStatefulHome";
        try {
            home = (MyStatefulHome) PortableRemoteObject.narrow(ctx.lookup(bName), MyStatefulHome.class);
            bean = home.create();
            bean.initialize();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * Creates a new stateless session bean.
     * @return a new stateless session bean
     */
    public MyEjb1 theEJB() {
        Context ctx = null;
        MyEjb1Home home = null;
        MyEjb1 bean = null;

        try {
            ctx = new InitialContext();
        } catch (NamingException e) {
            e.printStackTrace();
        }

        // Lookup bean home
        String bName = "java:comp/env/ejb/MyEjb1Home";
        try {
            home = (MyEjb1Home) PortableRemoteObject.narrow(ctx.lookup(bName), MyEjb1Home.class);
            bean = home.create();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * Retrieve the name of the JOnAS node where the servlet is executed.
     * @return The JOnAS node name where the servlet is executed.
     */
    public static String getMyJonasInstanceName() {

        String s = "unknown";
        try {
            JProp jp = JProp.getInstance();
            s = jp.getValue("jonas.name");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    /**
     * Get the logger
     * @return the logger
     */
    public Logger getLogger() {
        return logger;
    }

    /**
     * The logger
     */
    private static Logger logger = null;
}

