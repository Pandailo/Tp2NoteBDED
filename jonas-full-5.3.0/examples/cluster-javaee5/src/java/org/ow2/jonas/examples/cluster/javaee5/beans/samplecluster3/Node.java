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
 * $Id: Node.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */


package org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3;

import static org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.Node.QN.ALL_NODES;
import static org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.Node.QN.FIND_NODE;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 * Node
 * @author pelletib
 */
@Entity
@NamedQueries({@NamedQuery(name=ALL_NODES, query="select o FROM Node o"),
               @NamedQuery(name=FIND_NODE, query="select o FROM Node o WHERE name = :name")})
public class Node implements Serializable {
    /**
     * Store Query names.
     */
    public static interface QN {
        /**
         * Search all authors.
         */
        String ALL_NODES = "Node.allNodes";

        /**
         * Search a named author.
         */
        String FIND_NODE = "Node.findNode";
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
     * Name of the node.
     */
    private String name = null;

    /**
     * Creating time of the bean.
     */
    private int invocationNumber = 0;


    /**
     * Default constructor.
     */
    public Node() {
    }

    /**
     * Constructor with a given node name.
     * @param name - the name of the node
     */
    public Node(final String name) {
        this();
        setName(name);
    }

    /**
     * @return name of the node
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the node.
     * @param name - the name of this node
     */
    public void setName(final String name) {
        this.name = name;
    }

    /**
     * @return creating time of the bean
     */
    public int getInvocationNumber() {
        return invocationNumber;
    }

    /**
     * Sets the creating time of the bean.
     * @param number - the creating time of the bean
     */
    public void setInvocationNumber(final int invocationNumber) {
        this.invocationNumber = invocationNumber;
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
     * Sets the id of this node object.
     * @param id the given id of this node
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
        sb.append(", invocationNumber=");
        sb.append(Integer.valueOf(getInvocationNumber()).toString());
        sb.append("]");
        return sb.toString();
    }
}
