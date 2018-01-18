/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2006 Bull S.A.S
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
 * $Id:ExceptionServlet.java 14651 2008-07-28 11:50:13Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyException;



/**
 * @author goebelg Release an http session servlet
 */
public class ExceptionServlet extends AbstractServlet {

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

        // creating a new stateless EJB -> EJBCreate
        MyEjb1 bean = theEJB();
        try {
            bean.throwMyException();
        } catch (MyException e) {
            System.out.println("My Exception caught: invocation successful");
            req.setAttribute("expectedException", "OK");
            req.setAttribute("exception", e);
        } catch (Exception e) {
            System.out.println("Exception caught" + e);
            e.printStackTrace();
            req.setAttribute("expectedException", "KO");
            req.setAttribute("exception", e);
        }

        RequestDispatcher disp = req.getRequestDispatcher("../jsp/exceptionRsp.jsp");
        disp.forward(req, res);

        return;
    }
}