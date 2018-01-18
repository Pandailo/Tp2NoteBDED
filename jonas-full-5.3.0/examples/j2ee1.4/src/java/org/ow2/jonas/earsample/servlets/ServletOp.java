/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 1999-2005 Bull S.A.
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
 * --------------------------------------------------------------------------
 * $Id: ServletOp.java 21665 2011-08-23 13:35:55Z benoitf $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.earsample.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

import org.ow2.jonas.earsample.beans.secusb.Op;
import org.ow2.jonas.earsample.beans.secusb.OpHome;
import org.ow2.jonas.earsample.beans.secusb.OpLocal;
import org.ow2.jonas.earsample.beans.secusb.OpLocalHome;


/**
 * This servlet is an example to show how to access a EJB from a servlet
 * @author JOnAS team
 */
public class ServletOp extends HttpServlet {

    /**
     * First amount to buy
     */
    private static final int FIRST_BUY_AMOUNT = 10;

    /**
     * Second amount to buy
     */
    private static final int SECOND_BUY_AMOUNT = 20;

    /**
     * Third amount to buy (will be rollback)
     */
    private static final int THIRD_BUY_AMOUNT = 50;


    /**
     * Called by the server (via the service method) to allow a servlet to
     * handle a GET request.
     * @param request an HttpServletRequest object that contains the request
     * the client has made of the servlet
     * @param response an HttpServletResponse object that contains the
     * response the servlet sends to the client
     * @throws IOException if an input or output error is detected when the
     * servlet handles the GET request
     * @throws ServletException if the request for the GET could not be handled
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<link type=\"text/css\" href=\"../ow2_jonas.css\" rel=\"stylesheet\" id=\"stylesheet\">");
        out.println("<title>");
        out.println("Ear Sample of Servlet accessing a protected EJB</title>");
        out.println("</head>");
        out.println("<body style=\"background : white; color : black;\">");
        out.println("<h1>Ear sample of Servlet accessing a protected EJB");
        out.println("</h1><img src=\"../img/tomcat.gif\" alt=\"Tomcat Logo\">");
        out.println("<img src=\"../img/jetty.gif\" alt=\"Jetty Logo\">");
        out.println("<img src=\"../img/ow_jonas_logo.gif\" alt=\"JOnAS Logo\">");
        out.println("<h3>Initial context / UserTransaction </h3>");
        out.println("<ul>");
        Context initialContext = null;
        try {
            initialContext = new InitialContext();
            out.println("<li>Initial context OK</li>");
        } catch (Exception e) {
            out.print("<li>Cannot get initial context for JNDI: ");
            out.println(e + "</li>");
            return;
        }

        // We want to start transactions from client: get UserTransaction
        UserTransaction utx = null;
        try {
            utx = (UserTransaction) initialContext.lookup("java:comp/UserTransaction");
            out.println("<li>Get java:comp/UserTransaction OK</li>");
        } catch (Exception e) {
            out.println("<li>Cannot lookup java:comp/UserTransaction: " + e + "</li>");
            return;
        }
        out.println("</ul><br />");

        out.println("<h3>");
        out.println("Lookup on env-entry with java:comp/env/envEntryString");
        out.println("</h3>");
        out.println("<ul>");
        String envEntry = null;
        try {
            envEntry = (String) initialContext.lookup("java:comp/env/envEntryString");
            out.println("<li>Env entry is : " + envEntry + "</li>");
        } catch (Exception e) {
            out.println("<li>Cannot get env-entry on JNDI " + e + "</li>");
            return;
        }
        out.println("</ul><br />");


        out.println("</ul><br />");

        out.println("<h3>");
        out.println("Lookup on URL with java:comp/env/url/URL");
        out.println("</h3>");
        out.println("<ul>");
        URL jonasURL = null;
        try {
            jonasURL = (URL) initialContext.lookup("java:comp/env/url/URL");
            out.println("<li>URL is : <a href=\"" + jonasURL.toString() + "\">" + jonasURL.toString() + "</a></li>");
        } catch (Exception e) {
            out.println("<li>Cannot get url on JNDI " + e + "</li>");
            return;
        }
        out.println("</ul><br />");

        out.println("<h3>Actions realized by the servlet and the EJB</h3>");
        out.println("<h3>With local interface</h3>");
        out.println("<ul>");
        // Connecting to OpLocalHome thru JNDI
        OpLocalHome opLocalHome = null;
        try {
            opLocalHome = (OpLocalHome)
                initialContext.lookup("java:comp/env/ejb/OpLocal");
        } catch (Exception e) {
            out.println("<li>Cannot lookup java:comp/env/ejb/OpLocal: " + e + "</li>");
            return;
        }
        // OpBean creation
        OpLocal opLocal = null;
        try {
            opLocal = opLocalHome.create("User1");
            out.println("<li>Create a bean</li>");
        } catch (Exception e) {
            out.println("<li>Cannot create OpBean: " + e + "</li>");
            return;
        }
        // First transaction (committed)
        try {
            out.println("<li>Start a first transaction</li>");
            utx.begin();
            opLocal.buy(FIRST_BUY_AMOUNT);
            out.println("<li>First request on the new bean</li>");
            opLocal.buy(SECOND_BUY_AMOUNT);
            out.println("<li>Second request on the bean</li>");
            utx.commit();
            out.println("<li>Commit the transaction</li>");
        } catch (Exception e) {
            out.println("<li>exception during 1st Tx: " + e + "</li>");
            return;
        }
        // Start another transaction (rolled back)
        try {
            out.println("<li>Start a second transaction</li>");
            utx.begin();
            opLocal.buy(THIRD_BUY_AMOUNT);
            utx.rollback();
            out.println("<li>Rollback the transaction</li>");
        } catch (Exception e) {
            out.println("<li>exception during 2nd Tx: " + e + "</li>");
            return;
        }
        // Get the total bought, outside the transaction
        int val = 0;
        try {
            val = opLocal.read();
            out.println("<li>Request outside any transaction</li>");
        } catch (Exception e) {
            out.println("<li>Cannot read value on t1 : " + e + "</li>");
            return;
        }
        if (val != FIRST_BUY_AMOUNT + SECOND_BUY_AMOUNT) {
            out.println("<li>Bad value read: " + val + "</li>");
            return;
        }
        // Remove Session bean
        try {
            opLocal.remove();
        } catch (Exception e) {
            out.println("<li>Exception on buy: " + e + "</li>");
            return;
        }
        out.println("</ul><br />");

        out.println("<h3>With remote interface</h3>");
        out.println("<ul>");
        // Connecting to OpHome thru JNDI
        OpHome opHome = null;
        try {
            opHome = (OpHome) PortableRemoteObject.narrow(initialContext.lookup("java:comp/env/ejb/Op"), OpHome.class);
        } catch (Exception e) {
            out.println("<li>Cannot lookup java:comp/env/ejb/Op: " + e + "</li>");
            return;
        }
        // OpBean creation
        Op op = null;
        try {
            op = opHome.create("User1");
            out.println("<li>Create a bean</li>");
        } catch (Exception e) {
            out.println("<li>Cannot create OpBean: " + e + "</li>");
            return;
        }
        // First transaction (committed)
        try {
            out.println("<li>Start a first transaction</li>");
            utx.begin();
            op.buy(FIRST_BUY_AMOUNT);
            out.println("<li>First request on the new bean</li>");
            op.buy(SECOND_BUY_AMOUNT);
            out.println("<li>Second request on the bean</li>");
            utx.commit();
            out.println("<li>Commit the transaction</li>");
        } catch (Exception e) {
            out.println("<li>exception during 1st Tx: " + e + "</li>");
            return;
        }
        // Start another transaction (rolled back)
        try {
            out.println("<li>Start a second transaction</li>");
            utx.begin();
            op.buy(THIRD_BUY_AMOUNT);
            utx.rollback();
            out.println("<li>Rollback the transaction</li>");
        } catch (Exception e) {
            out.println("<li>exception during 2nd Tx: " + e + "</li>");
            return;
        }
        // Get the total bought, outside the transaction
        val = 0;
        try {
            val = op.read();
            out.println("<li>Request outside any transaction</li>");
        } catch (Exception e) {
            out.println("<li>Cannot read value on t1 : " + e + "</li>");
            return;
        }
        if (val != FIRST_BUY_AMOUNT + SECOND_BUY_AMOUNT) {
            out.println("<li>Bad value read: " + val + "</li>");
            return;
        }
        // Remove Session bean
        try {
            op.remove();
        } catch (Exception e) {
            out.println("<li>Exception on buy: " + e + "</li>");
            return;
        }
        out.println("</ul><br />");



        out.println("<h3>");
        out.println("Resource Adapter Properties");
        out.println("</h3>");
        out.println("<ul>");
        String eisName = null;
        try {
            eisName = (String) initialContext.lookup("eisName");
            out.println("<li>EIS Name is : " + eisName  + "</li>");
        } catch (Exception e) {
            out.println("<li>Cannot get eis name on JNDI " + e + "</li>");
            return;
        }
        out.println("</ul><br />");


        out.println("<strong>Sample is OK.</strong><br />");
        out.println("</body>");
        out.println("</html>");
    }
}
