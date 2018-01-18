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
 * $Id: ReleaseServlet.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.javaee5.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStateful;

/**
 * @author pelletib
 * Release an http session servlet
 */
public class ReleaseServlet extends AbstractServlet {

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

        // Get the session object to invalidate it

        HttpSession session = req.getSession(false);
        String sessionToReleaseInfo = "no session to invalidate";
        if (session != null) {
            // invalidate the SFSB
            MyStateful myStateful = (MyStateful) session.getAttribute("myStateful");
            myStateful.cleanup();

            // invalidate the HTTP session
            sessionToReleaseInfo = "session=" + session.getId() + " invalidated";
            session.setAttribute("myStateful", null);
            session.invalidate();
        }
        getLogger().info(sessionToReleaseInfo);
        req.setAttribute("sessionToReleaseInfo", sessionToReleaseInfo);

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            Cookie ck = null;
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("JSESSIONID")) {
                    ck = (Cookie) cookies[i].clone();
                    ck.setMaxAge(0);
                    res.addCookie(ck);
                }
            }
        }

        // --------------
        // Write response
        // --------------

        RequestDispatcher disp = req.getRequestDispatcher("../jsp/releaseRsp.jsp");
        disp.forward(req, res);

        return;
    }
}
