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
 * $Id: ClientLBRemote.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.javaee5.client;

import java.util.Properties;

import javax.ejb.EJB;

import org.ow2.jonas.examples.cluster.javaee5.beans.samplecluster3.MyStateless;


/**
 * Fat client :
 * - access to a SSB
 * - LB at the remote
 */
public class ClientLBRemote extends ClientBase {

    /**
     * Link to the SSB.
     */
    @EJB
    private static MyStateless myStateless = null;

    /**
     * Default constructor.
     */
    public ClientLBRemote() {
    }

    /**
     * Constructor.
     */
    public ClientLBRemote(final String[] args) {
        super(args);
    }

    /**
     * Start the client.
     */
    private int start() {
        String jonasEJBServer = null;
        String ejbTotalCallsCount = null;
        Properties prop = null;

        out.println("------------------------------------------");
        out.println("Bean created -> " + myStateless);
        out.println("------------------------------------------");

        for (int i = 0; i < iterations; i++) {
            try {

                prop = myStateless.getInfoProps();
                out.println("Bean invoked");

                jonasEJBServer = prop.getProperty("EJB server");
                ejbTotalCallsCount = prop.getProperty("EJB total calls");
            } catch (Exception e) {
                e.printStackTrace();
                return -1;
            }

            out.println("Calls=" + i + " - EJB served by jonas=" + jonasEJBServer + " - EJB total calls=" + ejbTotalCallsCount);
            if (0 == i % 10) {
                out.println("------------------------------------------");
                out.println("Sleep " + time2sleep / 1000 +" s");
                out.println("------------------------------------------");
                try {
                    Thread.sleep(time2sleep);
                } catch (Exception e) {
                    e.printStackTrace();
                    return -1;
                }
            }
            out.println();
        }

        out.println("Client OK. Exiting.");
        return 0;
    }

    /**
     * Main method
     * @param args arguments of the client
     */
    public static int main(final String[] args) {
        ClientLBRemote client = new ClientLBRemote(args);
        return client.start();
    }
}

