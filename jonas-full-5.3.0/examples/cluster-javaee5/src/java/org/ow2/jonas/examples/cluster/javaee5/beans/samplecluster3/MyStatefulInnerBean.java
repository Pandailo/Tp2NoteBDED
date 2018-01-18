/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2008 Bull S.A.S
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
 * $Id: MyStatefulInnerBean.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3;


import javax.ejb.Local;
import javax.ejb.SessionSynchronization;
import javax.ejb.Stateful;

import org.ow2.util.log.Log;
import org.ow2.util.log.LogFactory;

/**
 * Inner statefull
 * @author pelletib
 */
@Stateful
@Local(MyStatefulInner.class)
public class MyStatefulInnerBean implements SessionSynchronization,MyStatefulInner {

    /**
     * The logger.
     */
    private Log logger = LogFactory.getLog(MyStatefulInnerBean.class);

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * counter
     */
    private int count = 0;

    /**
     * Modifier flag
     */
    private transient boolean isModified = true;

    /**
     * After the transaction begun
     */
    public void afterBegin() {
        logger.debug("afterBegin");
    }

    /**
     * before the commit is executed
     */
    public void beforeCompletion() {
        logger.debug("beforeCompletion");
    }

    /**
     * after the commit or rollback
     * @param committed true -> commit, false -> rollback
     */
    public void afterCompletion(final boolean committed) {
        logger.debug("afterCompletion: " + committed);
    }


    /**
     * increment the local counter
     */
    public void increment() {
        count++;
        isModified = true;
    }

    /**
     * @return local counter
     */
    public int getCount() {
        return count;
    }

    /**
     *
     * @return true if the counter is modified
     */
    public boolean isModified() {
        boolean result = isModified;
        isModified = false;
        return result;
    }
}

