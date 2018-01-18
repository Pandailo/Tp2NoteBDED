/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 1999-2008 Bull S.A.S.
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
 * $Id: WriterBean.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.ear.writer;

import javax.annotation.security.DeclareRoles;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ow2.jonas.examples.ear.entity.Author;
import org.ow2.jonas.examples.ear.entity.Book;

/**
 * This is an example of Session Bean, stateless, secured, available
 * with a Local and a Remote interface (with the same methods).
 * @author JOnAS team
 */
@Stateless
@Remote(RemoteWriter.class)
@Local(LocalWriter.class)
@DeclareRoles("earsample")
@RolesAllowed("earsample")
public class WriterBean implements LocalWriter, RemoteWriter {

    /**
     * Entity manager used by this bean.
     */
    @PersistenceContext
    private EntityManager entityManager = null;

    /**
     * Persists a new {@link Author}.
     * @param author {@link Author} to add.
     */
    public void addAuthor(final Author author) {
        entityManager.persist(author);
    }

    /**
     * Persists a new {@link Book}.
     * @param book {@link Book} to add.
     */
    public void addBook(final Book book) {
        entityManager.persist(book);
    }

    /**
     * Cascade remove an {@link Author}.
     * @param author {@link Author} to be removed.
     */
    public void removeAuthor(final Author author) {
        entityManager.remove(author);
    }

    /**
     * Cascade remove a {@link Book}.
     * @param book {@link Book} to be removed.
     */
    public void removeBook(final Book book) {
        entityManager.remove(book);
    }

}
