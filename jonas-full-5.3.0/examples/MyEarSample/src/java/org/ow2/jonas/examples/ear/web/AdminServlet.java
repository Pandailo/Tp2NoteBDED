/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2007-2008 Bull S.A.S.
 * Contact: jonas-team@ow2.org
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 *
 * --------------------------------------------------------------------------
 * $Id: AdminServlet.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.ear.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ow2.jonas.examples.ear.entity.Author;
import org.ow2.jonas.examples.ear.entity.Book;
import org.ow2.jonas.examples.ear.init.Initializer;
import org.ow2.jonas.examples.ear.reader.LocalReader;
import org.ow2.jonas.examples.ear.writer.LocalWriter;

/**
 * Defines a servlet that is accessing the two entities through a local session
 * bean.
 * @author Florent Benoit
 * @author Guillaume Sauthier
 */
public class AdminServlet extends HttpServlet {

    /**
     * Serializable class uid.
     */
    private static final long serialVersionUID = 7724116000656853982L;

    /**
     * Local writer bean.
     */
    @EJB
    private LocalWriter writerBean;

    /**
     * Local reader bean.
     */
    @EJB
    private LocalReader readerBean;

    /**
     * Initializer bean.
     */
    @EJB
    private Initializer initializerBean;


    /**
     * Called by the server (via the service method) to allow a servlet to
     * handle a GET request.
     * @param request an HttpServletRequest object that contains the request the
     *        client has made of the servlet
     * @param response an HttpServletResponse object that contains the response
     *        the servlet sends to the client
     * @throws IOException if an input or output error is detected when the
     *         servlet handles the GET request
     * @throws ServletException if the request for the GET could not be handled
     */
    @Override
    public void doGet(final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "Ear Sample of Servlet accessing an EJB";

        printHTMLHeader(out, title);

        out.println("  <div class=\"links\">");
        out.println("    <table width=\"100%\" cellpadding=\"0\">");
        out.println("      <tr>");
        out.println("        <td>");

        // Try to init the DB if this is the very first call to this application
        initAuthorBooks(out);

        out.println("<br />");

        // Print the add-author Form
        printAddAuthorForm(out);

        out.println("        </td>");
        out.println("        <td>");

        // Try to add the new author
        addAuthor(out, request.getParameter("author"));

        // Display updated list of authors
        printAuthors(out);

        out.println("        </td>");
        out.println("      </tr>");
        out.println("    </table>");
        out.println("  </div>");

        printFooter(out);
        out.close();
    }

    /**
     * Print the page Footer.
     * @param out Servlet PrintWriter
     */
    private void printFooter(final PrintWriter out) {
        out.println("  <div class=\"footer\">");
        out.println("    <p>");
        out.println("      <a href=\"http://validator.w3.org/check/referer\">");
        out.println("        <img src=\"../img/valid-xhtml11.png\" alt=\"Valid XHTML 1.1!\"");
        out.println("             title=\"Valid XHTML 1.1!\" height=\"31\" width=\"88\" />");
        out.println("      </a>");
        out.println("      <a href=\"http://jigsaw.w3.org/css-validator/\">");
        out.println("        <img style=\"border:0;width:88px;height:31px\" src=\"../img/vcss.png\"");
        out.println("             title=\"Valid CSS!\" alt=\"Valid CSS!\" />");
        out.println("      </a>");
        out.println("    </p>");
        out.println("  </div>");

        out.println("</body>");
        out.println("</html>");
    }

    /**
     * Print the page Header.
     * @param out Servlet {@link PrintWriter}
     * @param title page's title
     */
    private void printHTMLHeader(final PrintWriter out, final String title) {
        out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">");
        out.println("<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\">");
        out.println("  <head>");
        out.println("    <link type=\"text/css\" href=\"../ow2_jonas.css\" rel=\"stylesheet\" id=\"stylesheet\"/>");
        out.println("    <title>" + title + "</title>");
        out.println("  </head>");
        out.println("<body style=\"background : white; color : black;\">");

        out.println("  <div><a href=\"http://www.ow2.org\"><img src=\"../img/logoOW2.png\" alt=\"logo\"/></a></div>");
        out.println("  <div class=\"logos\">");
        out.println("    <img src=\"../img/tomcat.gif\" alt=\"Tomcat Logo\"/>");
        out.println("    <img src=\"../img/jetty.gif\" alt=\"Jetty Logo\"/>");
        out.println("    <img src=\"../img/ow_jonas_logo.gif\" alt=\"JOnAS Logo\"/>");
        out.println("  </div>");

        out.println("  <div class=\"titlepage\">" + title + "</div>");
    }

    /**
     * Add a named {@link Author} in the model.
     * @param out {@link PrintWriter} used for Exception printing.
     * @param name Author's name
     */
    private void addAuthor(final PrintWriter out, final String name) {

        // Maybe the author param is null (possible for the first access)
        if (name != null) {

            try {
                // Persists a new Author
                Author author = new Author(name);
                writerBean.addAuthor(author);
            } catch (Exception e) {
                printException(out, "Cannot add a new Author (" + name + ")", e);
                return;
            }
        }

    }

    /**
     * Init list of authors/books.
     * @param out the given writer
     */
    private void initAuthorBooks(final PrintWriter out) {
        out.println("Initialize authors and their books...<br/>");

        try {
            initializerBean.initializeEntities();
        } catch (Exception e) {
            printException(out, "Cannot init list of authors with their books", e);
            return;
        }
    }

    /**
     * Display authors.
     * @param out the given writer
     */
    private void printAuthors(final PrintWriter out) {
        out.println("Get authors");
        out.println("<br /><br />");

        // Get list of Authors
        List<Author> authors = null;
        try {
            authors = readerBean.listAllAuthors();
        } catch (Exception e) {
            printException(out, "Cannot call listAllAuthors on the bean", e);
            return;
        }

        // List for each author, the name of books
        if (authors != null) {
            for (Author author : authors) {
                out.println("List of books with author '" + author.getName() + "' :");
                out.println("<ul>");
                Collection<Book> books = author.getBooks();
                if (books == null || books.size() == 0) {
                    out.println("<li>No book !</li>");
                } else {
                    for (Book book : books) {
                        out.println("<li>Title '" + book.getTitle() + "'.</li>");
                    }
                }
                out.println("</ul>");

            }
        } else {
            out.println("No author found !");
        }

    }

    /**
     * Display authors.
     * @param out the given writer
     */
    private void printAddAuthorForm(final PrintWriter out) {

        out.println("Add a new Author:");
        out.println("<form action=\"add-author\" method=\"get\">");
        out.println("  <div>");
        out.println("    <input name=\"author\" type=\"text\" value=\"\"/>");
        out.println("    <input type=\"submit\" value=\"Add\"/>");
        out.println("  </div>");
        out.println("</form>");
    }

    /**
     * If there is an exception, print the exception.
     * @param out the given writer
     * @param errMsg the error message
     * @param e the content of the exception
     */
    private void printException(final PrintWriter out, final String errMsg, final Exception e) {
        out.println("<p>Exception : " + errMsg);
        out.println("<pre>");
        e.printStackTrace(out);
        out.println("</pre></p>");
    }

}
