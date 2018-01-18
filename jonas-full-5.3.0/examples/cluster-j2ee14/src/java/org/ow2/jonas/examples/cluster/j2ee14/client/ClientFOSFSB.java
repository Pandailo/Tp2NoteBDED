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
 * $Id: ClientFOSFSB.java 17406 2009-05-18 16:28:03Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.client;

import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyStateful;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyStatefulHome;


/**
 * Fat client :
 * - test Fail Over of the SFSB
 */
public class ClientFOSFSB extends ClientBase {

    /**
     * Default constructor.
     */
    public ClientFOSFSB() {
    }

    /**
     * Constructor.
     * @param args arguments.
     */
    public ClientFOSFSB(final String[] args) {
        super(args);
    }
    /**
     * Starts the client.
     * @return <code>0</code> if ok.
     * @throws Exception any.
     */
    private int start() throws Exception {
        out.println(clientName + " : starting...");
        out.println("------------------------------------------");
        // get home
        MyStatefulHome home = ClientUtility.getMyStatefulHome();
        out.println("Home retrieved -> " + home);

        // get primary remote
        MyStateful bean = ClientUtility.getMyStatefulBean(home);
        out.println("Bean created -> " + bean);
        out.println("------------------------------------------");

        for (int i = 0; i < iterations; i++) {
            try {

                String l = "log entry " + i;
                // add in the bean state
                bean.logWithJOnASInstance(l);

                out.println("Add " + l);

                if (0 == i % 10) {
                    out.println("------------------------------------------");
                    out.println("Get the log entries from the bean state");
                    out.println("------------------------------------------");
                    StringBuffer sb = bean.getLogTextDump();
                    out.println(sb);

                    out.println("------------------------------------------");
                    out.println("Sleep " + time2sleep / 1000 + " s");
                    out.println("------------------------------------------");
                    try {
                        Thread.sleep(time2sleep);
                    } catch (Exception e) {
                        out.println(clientName + ": KO. " + e);
                        out.close();
                        throw e;
                    }
                }

            } catch (Exception e) {
                out.println("exception occured " + e);
                out.close();
                throw e;
            }
        }
        try {
            bean.remove();
        } catch (Exception e) {
            out.println(clientName + ": KO. " + e);
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
     * @throws Exception
     */
    public static int main(final String[] args) throws Exception {
        ClientFOSFSB client = new ClientFOSFSB(args);
        return client.start();
    }
}

