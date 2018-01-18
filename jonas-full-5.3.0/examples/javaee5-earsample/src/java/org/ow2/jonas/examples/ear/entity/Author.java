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
 * $Id: Author.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.ear.entity;

import static org.ow2.jonas.examples.ear.entity.Author.QN.ALL_AUTHORS;
import static org.ow2.jonas.examples.ear.entity.Author.QN.FIND_AUTHOR;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * Author of a book.
 * @author Florent Benoit
 */
@Entity
@NamedQueries({@NamedQuery(name=ALL_AUTHORS, query="select o FROM Author o"),
               @NamedQuery(name=FIND_AUTHOR, query="select o FROM Author o WHERE o.name = :MYNAME")})
public class Author implements Serializable {
    /**
     * Store Query names.
     */
    public static interface QN {
        /**
         * Search all authors.
         */
        String ALL_AUTHORS = "Author.allAuthors";

        /**
         * Search a named author.
         */
        String FIND_AUTHOR = "Author.findAuthor";
    }

    /**
     * Serial Version UID.
     */
    private static final long serialVersionUID = 0L;

    /**
     * Primary key (will be auto generated).
     */
    private long id;

    /**
     * Name of the author.
     */
    private String name = null;

    /**
     * List of books written by the author.
     */
    private Collection<Book> books;

    /**
     * Default constructor.
     */
    public Author() {
        books = new ArrayList<Book>();
    }

    /**
     * Constructor with a given author name.
     * @param name - the name of the author
     */
    public Author(final String name) {
        this();
        setName(name);
    }

    /**
     * Relation ship (do not using lazy mode).
     * @return books written by this author
     */
    @OneToMany(mappedBy="author", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
    public Collection<Book> getBooks() {
        return books;
    }

    /**
     * Add a book with a given title.
     * @param title - the title of the book
     */
    public void addBook(final String title) {
        Book livre = new Book();
        livre.setTitle(title);
        livre.setAuthor(this);
        getBooks().add(livre);
    }

    /**
     * Sets the collection of books written by this author.
     * @param books the list of the books
     */
    public void setBooks(final Collection<Book> books) {
        this.books = books;
    }

    /**
     * @return name of the author
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the author.
     * @param name - the name of this author
     */
    public void setName(final String name) {
        this.name = name;
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
        sb.append(", name=");
        sb.append(getName());
        sb.append("]");
        return sb.toString();
    }
}
