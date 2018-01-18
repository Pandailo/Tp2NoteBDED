/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 1999-2004 Bull S.A.
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
 * Initial developer(s):
 * --------------------------------------------------------------------------
 * $Id: OpLocalHome.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.earsample.beans.secusb;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * Local home interface for the bean Op
 * @author JOnAS team
 */
public interface OpLocalHome extends EJBLocalHome {

    /**
     * Create an instance of the Op bean.
     * @param user the user name.
     * @return the Remote interface of the bean Op.
     * @throws CreateException if the creation failed.
     */
    OpLocal create(String user) throws CreateException;
}