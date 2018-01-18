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
 * $Id: ClientFOSFSB.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.client;

import javax.ejb.EJB;

import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStateful;


/**
 * Fat client :
 * - test Fail Over of the SFSB
 */
public class ClientFOSFSB extends ClientBase {

    /**
     * Link to the SFSB.
     */
    @EJB
    private static MyStateful myStateful = null;

    /**
     * Default constructor.
     */
    public ClientFOSFSB() {
    }

    /**
     * Constructor.
     */
    public ClientFOSFSB(final String[] args) {
        super(args);
    }
    /**
     * Starts the client.
     * @return 0 if OK, -1 else.
     */
    private int start() {
        out.println("------------------------------------------");
        out.println("Bean created -> " + myStateful);
        out.println("------------------------------------------");

        for (int i = 0; i < iterations; i++) {
            try {

                String l = "log entry " + i;
                // add in the bean state
                myStateful.logWithJOnASInstance(l);

                out.println("Add " + l);

                if (0 == i % 10) {
                    out.println("------------------------------------------");
                    out.println("Get the log entries from the bean state");
                    out.println("------------------------------------------");
                    StringBuffer sb = myStateful.getLogTextDump();
                    out.println(sb);

                    out.println("------------------------------------------");
                    out.println("Sleep " + time2sleep / 1000 + "s");
                    out.println("------------------------------------------");
                    try {
                        Thread.sleep(time2sleep);
                    } catch (Exception e) {
                        e.printStackTrace();
                        return -1;
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
                return -1;
            }
        }
        myStateful.cleanup();
        out.println();
        out.println("Client OK. Exiting.");
        return 0;
    }
    /**
     * Main method
     * @param args arguments of the client
     */
    public static int main(final String[] args) {
        ClientFOSFSB client = new ClientFOSFSB(args);
        return client.start();

    }
}

