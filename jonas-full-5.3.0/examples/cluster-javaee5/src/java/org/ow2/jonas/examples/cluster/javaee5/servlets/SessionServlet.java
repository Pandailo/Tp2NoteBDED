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
 * $Id:SessionServlet.java 14651 2008-07-28 11:50:13Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.servlets;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStateful;

/**
 * @author goebelg
 *
 * servlet which manages the different instantiations of the ejbs
 */
public class SessionServlet extends AbstractServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * doGet methode of the servlet
     * @param req http servlet request
     * @param res http servlet response
     * @throws ServletException servlet exception
     * @throws IOException io exception
     */
    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse res) throws ServletException, IOException {
        String jonasEJBServer = null;
        String ejbId = null;
        String ejbTotalCallsCount = null;
        String ejbEntityCreated = null;
        Properties prop = null;

        /*
         * ---------------------------------------- Update the session context -
         * sessiontest.counter : number of times this servlet has been called -
         * sessiontest.jonas. <name> : counts the number of time the EJB was
         * served by <name> JOnAS instance
         * -----------------------------------------
         */
        HttpSession session = req.getSession(true);

        // update sessiontest.counter

        Integer ival = (Integer) session.getAttribute("sessiontest.counter");
        if (ival == null) { // If counter is not in session, then create it
            ival = new Integer(1);
        } else {
            ival = new Integer(ival.intValue() + 1);
        }
        session.setAttribute("sessiontest.counter", ival);

        // Call EJB then update sessiontest.jonas.x

        try {
            prop = getMyStateless().getInfoProps();
            jonasEJBServer = prop.getProperty("EJB server");
            ejbId = prop.getProperty("EJB id");
            ejbTotalCallsCount = prop.getProperty("EJB total calls");
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Retrieve or create the Stateful EJB to log history

        /*
         * getHandle() doesn't work
         * see bug http://jira.easybeans.org/browse/EZB-314
         *
        Handle h = (Handle) session.getAttribute("myStateful");
        MyStateful statefulBean = null;
        if (h == null) {

            statefulBean = getMyStateful();
            if (statefulBean != null) {

                h = statefulBean.getMyHandle();
                session.setAttribute("myStateful", h);
                statefulBean.setHTTPSessionId(session.getId());
            }
        } else {
            statefulBean = (MyStateful) PortableRemoteObject.narrow(h.getEJBObject(), MyStateful.class);
        } */

        MyStateful statefulBean = (MyStateful) session.getAttribute("myStateful");
        if (statefulBean == null) {
            getLogger().info("create new stateful");
            statefulBean = getMyStateful();
            if (statefulBean != null) {
                session.setAttribute("myStateful", statefulBean);
                statefulBean.setHTTPSessionId(session.getId());
            }
        }

        if (!session.isNew()) {
            session.setAttribute("sessiontest.old.EJB", session.getAttribute("sessiontest.EJB"));
            session.setAttribute("sessiontest.old.WEB", session.getAttribute("sessiontest.WEB"));
        }
        session.setAttribute("sessiontest.EJB", jonasEJBServer);
        session.setAttribute("sessiontest.WEB", getMyJonasInstanceName());

        req.setAttribute("jonas.EJB.served.by", jonasEJBServer);
        req.setAttribute("jonas.WEB.served.by", getMyJonasInstanceName());

        session.setAttribute("sessiontest.jonas.EJB_Server", jonasEJBServer);
        session.setAttribute("sessiontest.jonas.EJB_id", ejbId);
        session.setAttribute("sessiontest.jonas.nb_EJB_totalCalls", ejbTotalCallsCount);

        // Log information

        getLogger().info("session=" + session.getId() + " on jonas=" + getMyJonasInstanceName()
                + " - calls=" + ival + " - EJB served by jonas=" + jonasEJBServer + " - EJB total calls="
                + ejbTotalCallsCount);

        if (statefulBean != null) {
                try {
                    statefulBean.log("<tr>" + "<td>" + getMyJonasInstanceName() + "</td>" + "<td>" + jonasEJBServer
                            + "</td>" + "<td>" + ejbTotalCallsCount + "</td>"
                            + "</tr>");
                } catch (Exception e) {
                    getLogger().info("session=" + session.getId()
                            + " : Exception when calling MyStateful EJB (" + e.getMessage() + ")");
                    session.removeAttribute("myStateful");
                }
        }
        // --------------
        // Write response
        // --------------

        RequestDispatcher disp = req.getRequestDispatcher("../jsp/sessionRsp.jsp");
        disp.forward(req, res);

        return;
    }
}

