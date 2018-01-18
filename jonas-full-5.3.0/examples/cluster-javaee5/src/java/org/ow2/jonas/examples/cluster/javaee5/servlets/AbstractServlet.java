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
 * $Id: AbstractServlet.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.javaee5.servlets;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;

import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStateful;
import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStateless;
import org.ow2.jonas.lib.bootstrap.JProp;
import org.ow2.util.log.Log;
import org.ow2.util.log.LogFactory;

/**
 * @author pelletib
 *
 * Servlet super class
 */
public abstract class AbstractServlet extends HttpServlet {

    /**
     * Link to the SSB.
     */
   // @EJB
    private MyStateless myStateless = null;

    /**
     * Link to the SFSB.
     */
    private MyStateful myStateful = null;

    /**
     * Logger
     */
    private Log logger = LogFactory.getLog(AbstractServlet.class);


    /**
     * Servlet initialization
     */
    @Override
    public void init() {

        logger.debug("");
    }

    /**
     * Creates a new Stateful session bean.
     * @return A new session bean
     */
    public MyStateful getMyStateful() {
        try {
            Context ctx = new InitialContext();
            myStateful = (MyStateful) ctx.lookup("org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStatefulBean"
                            + "_" + MyStateful.class.getName() + "@Remote");
        } catch (NamingException e) {
            e.printStackTrace();
        }
        myStateful.initialize();
        return myStateful;
    }

    /**
     * Creates a new stateless session bean.
     * @return a new stateless session bean
     */
    public MyStateless getMyStateless() {
        try {
            Context ctx = new InitialContext();
            myStateless = (MyStateless) ctx.lookup("org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStatelessBean"
                            + "_" + MyStateless.class.getName() + "@Remote");
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return myStateless;
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
    public Log getLogger() {
        return logger;
    }


}

