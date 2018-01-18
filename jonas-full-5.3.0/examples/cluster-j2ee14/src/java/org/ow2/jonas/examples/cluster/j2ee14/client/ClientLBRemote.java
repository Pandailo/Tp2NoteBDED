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
 * $Id: ClientLBRemote.java 17406 2009-05-18 16:28:03Z eyindanga $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.examples.cluster.j2ee14.client;

import java.util.Properties;

import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1;
import org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.MyEjb1Home;


/**
 * Fat client :
 * - access to a SSB
 * - LB at the remote
 */
public class ClientLBRemote extends ClientBase {
    /**
     * Constructor using arguments.
     * @param args arguments.
     */
    public ClientLBRemote(final String[] args) {
        super(args);
    }
    /**
     * Starts the client.
     */
    private int start() throws Exception {
        String jonasEJBServer = null;
        String ejbTotalCallsCount = null;
        String ejbEntityCreated = null;
        Properties prop = null;
        out.println(clientName + ": starting...");
        out.println("------------------------------------------");
        MyEjb1Home home = ClientUtility.getMyEjb1Home();
        out.println("Home retrieved -> " + home);
        MyEjb1 bean = ClientUtility.getMyEjb1Bean(home);
        out.println("Bean created -> " + bean);
        out.println("------------------------------------------");
        for (int i = 0; i < iterations; i++) {
            try {
                prop = bean.getInfoProps();
                out.println("Bean invoked");
                jonasEJBServer = prop.getProperty("EJB server");
                ejbTotalCallsCount = prop.getProperty("EJB total calls");
                ejbEntityCreated = prop.getProperty("EJB server entity created");
            } catch (Exception e) {
                out.println(clientName + ": KO. " + e);
                out.close();
                throw e;
            }

            out.println("Calls=" + i + " - EJB served by jonas=" + jonasEJBServer + " - EJB total calls=" + ejbTotalCallsCount + " - ejbEntityCreated=" + ejbEntityCreated);
            if (0 == i % 10) {
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
            out.println();
        }
        try {
            bean.remove();
        } catch (Exception e) {
            out.println(clientName + ": KO. " + e);
            out.close();
            throw e;
        }
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
        ClientLBRemote client = new ClientLBRemote(args);
        return client.start();
    }
}

