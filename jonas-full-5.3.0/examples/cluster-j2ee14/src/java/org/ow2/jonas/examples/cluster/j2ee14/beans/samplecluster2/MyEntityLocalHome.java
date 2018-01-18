/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2005-2006 Bull S.A.S
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
 * Initial developer(s):
 * --------------------------------------------------------------------------
 * $Id: MyEntityLocalHome.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2;

/**
 * Local interface for the entity bean
 * @author goebelg
 */
public interface MyEntityLocalHome extends javax.ejb.EJBLocalHome {

    /**
     * Creation of the entity bean
     * @param number the primary key -> date.getTime() as string of creation
     * @return the entity bean
     * @throws javax.ejb.CreateException if creation fails
     */
    MyEntityLocal create(String number) throws javax.ejb.CreateException;

    /**
     * Search for a record with the primary key. Indicate the time of the creation as pk.
     * @param primaryKey the primary key to look for
     * @return the entity bean
     * @throws javax.ejb.FinderException if not existing
     */
    MyEntityLocal findByPrimaryKey(Object primaryKey) throws javax.ejb.FinderException;

}