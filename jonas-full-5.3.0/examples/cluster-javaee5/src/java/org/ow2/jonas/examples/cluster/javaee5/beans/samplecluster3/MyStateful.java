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
 * $Id: MyStateful.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3;

import javax.ejb.Handle;


/**
 * MyStateful remote interface
 */
public interface MyStateful {

    /**
     * Initializes the inner beans
     */
    void initialize();

    /**
     * Keep the parameter in a list. Note : the parameter represents a line in
     * the "session servlet output" screen
     * @param s The string to keep.
     */
    void log(java.lang.String s);

    /**
     * Keep the parameter in a list keeping track of the JOnAS instance
     * @param s The string to keep.
     */
    void logWithJOnASInstance(java.lang.String s);

    /**
     * Retreive all the data in the log table Note : The return value is the
     * data shown in the "session servlet output" screen
     * @return All the logged data
     */
    java.lang.StringBuffer getLogDump();

    /**
     * Retreive all the data in the log table Note : The return value is the
     * text format (calls from the java client)
     * @return All the logged data
     */
    java.lang.StringBuffer getLogTextDump();


    /**
     * Set the http sessionid of the caller.
     * @param s The sessionid of the caller.
     */
    void setHTTPSessionId(java.lang.String s);

    /**
     * Get the stored http sessionid of the caller.
     * @return The stored sessionid.
     */
    java.lang.String getHTTPSessionId();

    /**
     *
     * @return handle on the SFSB
     */
    Handle getMyHandle();

    /**
     * Cleanup/Remove
     */
    void cleanup();


}