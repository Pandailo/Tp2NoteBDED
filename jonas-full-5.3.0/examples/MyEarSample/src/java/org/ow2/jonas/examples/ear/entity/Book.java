/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2007 Bull S.A.S.
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
 * $Id: Book.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.ear.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 * Define a book.
 * @author Florent Benoit
 */
@Entity
@NamedQueries({@NamedQuery(name=Book.QN.ALL_BOOKS, query="select o FROM Book o"),
               @NamedQuery(name=Book.QN.FIND_BOOK, query="select o FROM Book o WHERE o.title = :MYTITLE")
})
public class Book implements Serializable {

    /**
     * Defines Query names.
     */
    public static interface QN {
        /**
         * Search all books.
         */
        String ALL_BOOKS = "Book.allBooks";

        /**
         * Search a book.
         */
        String FIND_BOOK = "Book.findBook";
    }

    /**
     * Serial Version UID.
     */
    private static final long serialVersionUID = 0L;

    /**
     * Primary key.
     */
    private long id;

    /**
     * Author's book.
     */
    private Author author;

    /**
     * title of the book.
     */
    private String title;

    /**
     * Default constructor.
     */
    public Book() {

    }

    /**
     * Constructor. Build a new Book with the given title and written by the
     * given author.
     * @param title the given title
     * @param author the given author.
     */
    public Book(final String title, final Author author) {
        setTitle(title);
        setAuthor(author);
    }

    /**
     * @return the Author of this Book.
     */
    @ManyToOne
    @JoinColumn(name="Author_id")
    public Author getAuthor() {
        return author;
    }

    /**
     * Sets the author of this book.
     * @param author the given author.
     */
    public void setAuthor(final Author author) {
        this.author = author;
    }

    /**
     * @return the title of this book.
     */
    public String getTitle() {
        return title;
    }

    /**
     * Set the title of the book.
     * @param title - the title of the book
     */
    public void setTitle(final String title) {
        this.title = title;
    }

    /**
     * @return an id for this object (incremented automatically)
     */
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    public long getId() {
        return this.id;
    }

    /**
     * Sets the id of this author object.
     * @param id the given id of this author
     */
    public void setId(final long id) {
        this.id = id;
    }

    /**
     * @return String representation of this entity object.
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder(this.getClass().getName());
        sb.append("[id=");
        sb.append(getId());
        sb.append(", title=");
        sb.append(getTitle());
        sb.append("]");
        return sb.toString();
    }
}
