/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2009 Bull S.A.S
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
 * $Id: ClientBase.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */
package org.ow2.jonas.examples.cluster.j2ee14.client;

import java.io.FileOutputStream;
import java.io.PrintStream;

public class ClientBase {

    /**
     * Iteration number
     */
    private static final int ITERATION_NB = 50;

    /**
     * Default time to sleep.
     */
    private static final long TIME2SLEEP = 10000;

    /**
     * Output to be used.
     */
    protected PrintStream out = null;
    /**
     * the name of the client.
     */
    protected String clientName = "JOnAS Client for cluster-j2ee14";

    /**
     *  Time to sleep each 10 iterations.
     */
    protected long time2sleep = 10000;

    /**
     *  Iterations number.
     */
    protected int iterations = ITERATION_NB;

    public ClientBase() {
    }

    public ClientBase(final String[] args) {
        initArgs(args);
    }

    private void initArgs(final String[] args) {
        out = System.out;
        String url = null;
        if(args != null && args.length != 0) {
            for (int argn = 0; argn < args.length; argn++) {
                String arg = args[argn];
                if("-out".equals(arg)) {
                    url = args[++argn];
                    continue;
                }else if ("-clientName".equals(arg)) {
                    clientName = args[++argn];
                    out.println("Client name set to : " + clientName);
                    continue;
                }else if ("-time2sleep".equals(arg)) {
                    String time = args[++argn];
                    try {
                        time2sleep = Long.parseLong(time);
                    } catch (NumberFormatException e) {
                        time2sleep = TIME2SLEEP;
                    }
                    out.println("Time to sleep set to : " + time2sleep);
                    continue;
                }else if ("-iterations".equals(arg)) {
                    String it = args[++argn];
                    try {
                        iterations = Integer.parseInt(it);
                    } catch (Exception e) {
                        // TODO: handle exception
                        iterations = ITERATION_NB;
                    }
                    out.println("Number of iterations set to : " + iterations);
                    continue;
                }
            }
        }
        if (url != null) {
            initOut(url);
        }
    }
    /**
     * Initializes client output.
     * @param url Stringified url of the client output file.
     */
    private void initOut(final String url) {
        try {
            FileOutputStream file =  new FileOutputStream(url, true);
            out.println("Initializing output '" + url + "' for " + clientName);
            out = new PrintStream(file, true);
        } catch (Exception e) {
            out.println("Unable to initialize output for " + clientName + " because : " + e);
        }
    }

}
