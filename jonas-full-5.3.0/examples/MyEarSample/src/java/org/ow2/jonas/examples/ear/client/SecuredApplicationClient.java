/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2008 Bull S.A.S.
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
 * $Id: SecuredApplicationClient.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.ear.client;

import java.io.PrintStream;
import java.util.Collection;
import java.util.List;
import java.text.MessageFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.ejb.EJB;

import org.ow2.jonas.examples.ear.entity.Author;
import org.ow2.jonas.examples.ear.entity.Book;
import org.ow2.jonas.examples.ear.init.Initializer;
import org.ow2.jonas.examples.ear.reader.RemoteReader;
import org.ow2.jonas.examples.ear.writer.RemoteWriter;

/**
 * Simple Application Client.
 * @author Guillaume Sauthier
 */
public final class SecuredApplicationClient {

    /**
     * Empty default constructor for utility class.
     */
    private SecuredApplicationClient() {

    }

       /**
      * Link to the initializer bean.
      */
     @EJB
     static private Initializer initializerBean;

    /**
      * Link to the Remote Reader bean. Bean will be injected by JOnAS.
      */
     @EJB
     static private RemoteReader readerBean;

     /**
      * Link to the Remote Writer bean. Bean will be injected by JOnAS.
      */
     @EJB
     static private RemoteWriter writerBean;

    /**
     * @param args Command line arguments
     * @throws NamingException InitialContext creation failure
     */
    public static void main(final String[] args) throws NamingException {

        PrintStream out = System.out;

        // Print Header
        out.println("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
        out.println("OW2 JOnAS :: EAR Sample :: Secured Application Client      ");
        out.println("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
        // Init. data if needed
        out.print("Initialization ... ");
        initializerBean.initializeEntities();
        out.println("Done.");

        out.println("The RemoteReader Bean reference is: " + readerBean);

        // List registered authors and their books
        out.println("List of authors, and their books:");
        // retrieve again the authors list (now it has been initialized)
        List<Author> authors = readerBean.listAllAuthors();
        for (Author author : authors) {
            out.println(" * " + author.getName());
            Collection<Book> books = author.getBooks();
            for (Book book : books) {
                out.println(MessageFormat.format(" -> {0} [id: {1}]", book.getTitle(), book.getId()));
            }
        }

        // Use the secured Bean (RemoteWriter)
        // ======================================
        out.println("Get the RemoteWriter Bean reference: " + writerBean);

        // Add another author, and some books
        Author zola = new Author("Emile Zola");
        Book germinal = new Book("Germinal", zola);
        Book beteHumaine = new Book("La Bete Humaine", zola);
        zola.getBooks().add(germinal);
        zola.getBooks().add(beteHumaine);

        // Display Author before storage
        out.println("Created a new Author: ");
        out.println(zola.toString());

        // Persists
        writerBean.addAuthor(zola);

        // See the new content
        out.println("Updated authors' list:");
        authors = readerBean.listAllAuthors();
        for (Author author : authors) {
            out.println(" * " + author.getName());
            Collection<Book> books = author.getBooks();
            for (Book book : books) {
                out.println(MessageFormat.format(" -> {0} [id: {1}]", book.getTitle(), book.getId()));
            }
        }

        // Remove Zola (and its books), so that next time the client
        // is executed, we can add them again.
        writerBean.removeAuthor(zola);
        out.println("Cleaned added Author.");
        out.println("Success.");

    }
}
