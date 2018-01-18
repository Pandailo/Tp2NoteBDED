/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2006 Bull S.A.S
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
 * $Id: ClientException.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.client;

import javax.ejb.EJB;

import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyException;
import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStateless;


/**
 * Fat client :
 * - get an exception
 */
public class ClientException extends ClientBase {

    /**
     * Link to the SSB.
     */
    @EJB
    private static MyStateless myStateless = null;

    /**
     * Private constructor for utility class
     *
     */
    private ClientException() {
    }

    /**
     * Private constructor for utility class
     *
     */
    private ClientException(final String[] args) {
        super(args);
    }

    /**
     * Starts the client.
     * @return
     */
    private int start() {
        out.println("------------------------------------------");
        out.println("Bean created -> " + myStateless);
        out.println("------------------------------------------");

        try {
            out.println("Throw an exception at the server side");
            myStateless.throwMyException();
        } catch (MyException e) {
            out.println("MyException caught : invocation successful");
        }catch (Exception e) {
            out.println("Invocation failed because : " + e);
            out.println("Client KO. Exiting.");
            return -1;
        }
        out.println();
        out.println("Client OK. Exiting.");
        return 0;

    }
    /**
     * Main method
     * @param args arguments of the client
     */
    public static int main(final String[] args) {
        ClientException client = new ClientException(args);
        return client.start();

    }
}

