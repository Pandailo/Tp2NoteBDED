/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2008 Bull S.A.S.
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
 * $Id: ReaderBean.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.ear.reader;

import static org.ow2.jonas.examples.ear.entity.Author.QN.ALL_AUTHORS;
import static org.ow2.jonas.examples.ear.entity.Author.QN.FIND_AUTHOR;
import static org.ow2.jonas.examples.ear.entity.Book.QN.ALL_BOOKS;
import static org.ow2.jonas.examples.ear.entity.Book.QN.FIND_BOOK;

import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.ow2.jonas.examples.ear.entity.Author;
import org.ow2.jonas.examples.ear.entity.Book;

/**
 *The {@link ReaderBean} EJB is an unrestricted, read-only, Stateless Bean.
 * @author Guillaume Sauthier
 */
@Stateless
@Local(LocalReader.class)
@Remote(RemoteReader.class)
public class ReaderBean implements LocalReader, RemoteReader {

    /**
     * Entity manager used by this bean.
     */
    @PersistenceContext
    private EntityManager entityManager = null;

    /**
     * Find a given {@link Author} using it's name as a key.
     * @param name {@link Author}'s name.
     * @return the first {@link Author} that matches the given name.
     */
    @SuppressWarnings("unchecked")
    public Author findAuthor(final String name) {
        Query query = entityManager.createNamedQuery(FIND_AUTHOR);
        query.setParameter("MYNAME", name);
        List<Author> authors = query.getResultList();
        if (authors != null && authors.size() > 0) {
            return authors.get(0);
        }
        return null;
    }

    /**
     * Find a given {@link Book} using it's name as a key.
     * @param name {@link Book}'s name.
     * @return the first {@link Book} that matches the given name.
     */
    @SuppressWarnings("unchecked")
    public Book findBook(final String title) {
        Query query = entityManager.createNamedQuery(FIND_BOOK);
        query.setParameter("MYTITLE", title);
        List<Book> books = query.getResultList();
        if (books != null && books.size() > 0) {
            return books.get(0);
        }
        return null;
    }

    /**
     * @return the list of all the persisted {@link Author}s.
     */
    @SuppressWarnings("unchecked")
    public List<Author> listAllAuthors() {
        return entityManager.createNamedQuery(ALL_AUTHORS).getResultList();
    }

    /**
     * @return the list of all the persisted {@link Book}s.
     */
    @SuppressWarnings("unchecked")
    public List<Book> listAllBooks() {
        return entityManager.createNamedQuery(ALL_BOOKS).getResultList();
    }

}
