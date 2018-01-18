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
 * $Id: ClientException.java 17406 2009-05-18 16:28:03Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.client;

import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1Home;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyException;


/**
 * Fat client :
 * - get an exception
 */
public class ClientException extends ClientBase {
    /**
     * Private constructor for utility class
     *
     */
    private ClientException() {
    }
    /**
     * Contructor.
     * @param args : arguments.
     */
    private ClientException(final String[] args) {
        super(args);
    }
    /**
     * Starts the client.
     * @return <code>0</code> if ok.
     */
    private int start() throws Exception {
        out.println(clientName + " : starting ...");
        out.println("------------------------------------------");
        MyEjb1Home home = ClientUtility.getMyEjb1Home();
        out.println("Home retrieved -> " + home);
        MyEjb1 bean = ClientUtility.getMyEjb1Bean(home);
        out.println("Bean created -> " + bean);
        out.println("------------------------------------------");


        try {
            out.println("Throw an exception at the server side");
            bean.throwMyException();
        } catch (MyException e) {
            out.println("MyException caught : invocation successful");
        } catch (Exception e) {
            out.println("Invocation failed because : " + e);
            out.println("Client KO. Exiting.");
            out.close();
            throw e;
        }

        out.println();
        out.println(clientName + ": OK. Exiting.");
        out.close();
        return 0;

    }
    /**
     * Main method
     * @param args arguments of the client
     * @throws Exception any.
     */
    public static int main(final String[] args) throws Exception {
        ClientException  client = new ClientException(args);
        return client.start();

    }
}

