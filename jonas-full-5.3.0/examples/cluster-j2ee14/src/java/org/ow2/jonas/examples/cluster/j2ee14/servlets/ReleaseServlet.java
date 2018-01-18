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
 * $Id:ReleaseServlet.java 14651 2008-07-28 11:50:13Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.servlets;

import java.io.IOException;
import java.rmi.RemoteException;

import javax.ejb.Handle;
import javax.ejb.RemoveException;
import javax.rmi.PortableRemoteObject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.objectweb.util.monolog.api.BasicLevel;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyStateful;

/**
 * @author goebelg Release an http session servlet
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
            sessionToReleaseInfo = "session=" + session.getId() + " invalidated";
            // Remove the SFSB if present
            // Retrieve or create the Stateful EJB to log history
            Handle h = (Handle) session.getAttribute("myStateful");
            if (h != null) {
                MyStateful statefulBean = (MyStateful) PortableRemoteObject.narrow(h.getEJBObject(), MyStateful.class);
                try {
                    statefulBean.remove();
                } catch (RemoteException e) {
                    e.printStackTrace();
                } catch (RemoveException e) {
                    e.printStackTrace();
                }
            }

            session.invalidate();
        }
        getLogger().log(BasicLevel.INFO, sessionToReleaseInfo);
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