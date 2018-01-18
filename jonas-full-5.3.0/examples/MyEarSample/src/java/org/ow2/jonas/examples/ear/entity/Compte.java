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
@NamedQueries({@NamedQuery(name=Compte.QN.ALL_COMPTES, query="select o FROM Compte o"),
               @NamedQuery(name=Compte.QN.FIND_COMPTE, query="select o FROM Compte o WHERE o.intitule = :MYTITLE")
})
public class Compte implements Serializable {

    /**
     * Defines Query names.
     */
    public static interface QN {
        /**
         * Search all books.
         */
        String ALL_COMPTES = "Compte.allComptes";

        /**
         * Search a book.
         */
        String FIND_COMPTE = "Compte.findCompte";
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
     * Client du compte.
     */
    private Client client;
    
    /**
     * Client du compte.
     */
    private double balance;

    /**
     * title of the book.
     */
    private String intitule;

    /**
     * Default constructor.
     */
    public Compte() {

    }

    /**
     * Constructor. Build a new Compte with the given intitule and belonging to the
     * given client.
     * @param intitule the given title
     * @param client the given author.
     */
    public Compte(final String intitule, final Client client) {
        setIntitule(intitule);
        setClient(client);
    }

    /**
     * @return the Client of this Compte.
     */
    @ManyToOne
    @JoinColumn(name="Client_id")
    public Client getClient() {
        return client;
    }
    
    /**
     * @return the Client of this Compte.
     */
    @Column(name="balance", updatable=true, precision=12, scale=2)
    public double getBalance() {
        return balance;
    }

    /**
     * Sets the client of this Compte.
     * @param client the given client.
     */
    public void setClient(final Client client) {
        this.client = client;
    }

    /**
     * @return the intitule of this Compte.
     */
    public String getIntitule() {
        return intitule;
    }

    /**
     * Set the intitule of the compte.
     * @param intitule - the intitule of the compte
     */
    public void setIntitule(final String intitule) {
        this.intitule = intitule;
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
     * Sets the id of this compte object.
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
        sb.append(", intitule=");
        sb.append(getIntitule());
        sb.append("]");
        return sb.toString();
    }
}
