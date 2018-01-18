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
 * $Id: MyStatefulInner.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2;


import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.ejb.SessionSynchronization;

import org.ow2.jonas.lib.util.Log;
import org.objectweb.util.monolog.api.BasicLevel;
import org.objectweb.util.monolog.api.Logger;

/**
 *
 */
public class MyStatefulInner implements SessionBean, SessionSynchronization {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * After the transaction begun
     */
    public void afterBegin() {
        logger.log(BasicLevel.DEBUG, "afterBegin");
    }

    /**
     * before the commit is executed
     */
    public void beforeCompletion() {
        logger.log(BasicLevel.DEBUG, "beforeCompletion");
    }

    /**
     * after the commit or rollback
     * @param committed true -> commit, false -> rollback
     */
    public void afterCompletion(boolean committed) {
        logger.log(BasicLevel.DEBUG, "afterCompletion: " + committed);
    }

    /**
     * Set the session context
     * @param ctx the session context
     */
    public void setSessionContext(SessionContext ctx) {
        if (logger == null) {
            logger = Log.getLogger("org.ow2.jonas_tests");
        }
        logger.log(BasicLevel.DEBUG, "setSessionContext");
    }

    /**
     * removes the ejb
     */
    public void ejbRemove() {
        logger.log(BasicLevel.DEBUG, "ejbRemove");
    }

    /**
     * creation of the ejb
     */
    public void ejbCreate() {
        logger.log(BasicLevel.DEBUG, "ejbCreate()->" + this.toString());
    }

    /**
     * Passivate of the ejb
     */
    public void ejbPassivate() {
        logger.log(BasicLevel.DEBUG, "ejbPassivate");
    }

    /**
     * activation of the ejb
     */
    public void ejbActivate() {
        logger.log(BasicLevel.DEBUG, "ejbActivate");
    }

    private int count = 0;

    private transient boolean isModified = true;

    public void increment() {
        count++;
        isModified = true;
    }

    public int getCount() {
        return count;
    }

    /**
     * The logger
     */
    private static Logger logger = null;

    public boolean isModified() {
        boolean result = isModified;
        isModified = false;

        return result;
    }
}

