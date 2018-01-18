/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 1999-2004 Bull S.A.
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
 * Initial developer: Florent Benoit
 *
 * --------------------------------------------------------------------------
 * $Id: Client.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.earsample.clients;

import java.net.URL;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.transaction.UserTransaction;
import javax.rmi.PortableRemoteObject;

import org.ow2.jonas.earsample.beans.secusb.Op;
import org.ow2.jonas.earsample.beans.secusb.OpHome;


/**
 * Heavy client doing some operations on a bean
 * @author jonas team
 */
public class Client {

    /**
     * First amount to buy
     */
    private static final int FIRST_BUY_AMOUNT = 10;

    /**
     * Second amount to buy
     */
    private static final int SECOND_BUY_AMOUNT = 20;

    /**
     * Third amount to buy (will be rollback)
     */
    private static final int THIRD_BUY_AMOUNT = 50;

    /**
     * Constructor. Hide constructor as it is an utility class
     */
    private Client() {

    }

    /**
     * Main method
     * @param args arguments of the client
     */
    public static void main(String[] args) {

        Context initialContext = null;
        System.out.print("Building a new InitialContext...");
        try {
            initialContext = new InitialContext();
        } catch (Exception e) {
            System.err.println("Cannot get initial context for JNDI: " + e);
            System.exit(2);
        }
        System.out.println("done !");

        System.out.print("Looking up java:comp/UserTransaction ...");
        // We want to start transactions from client: get UserTransaction
        UserTransaction utx = null;
        try {
            utx = (UserTransaction) initialContext.lookup("java:comp/UserTransaction");
        } catch (Exception e) {
            System.err.println("Cannot lookup UserTransaction: " + e);
            System.exit(2);
        }
        System.out.println("done !");

        String envEntry = null;
        System.out.print("Looking up java:comp/env/envEntryString ...");
        try {
            envEntry = (String) initialContext.lookup("java:comp/env/envEntryString");
        } catch (Exception e) {
            System.err.println("Cannot get env-entry on JNDI " + e);
            System.exit(2);
        }
        System.out.println("done !");
        System.out.println("Env entry is : " + envEntry);

        URL url = null;
        System.out.print("Looking up java:comp/env/url/jonas ...");
        try {
            url = (URL) initialContext.lookup("java:comp/env/url/jonas");
        } catch (Exception e) {
            System.err.println("Cannot get URL on JNDI " + e);
            System.exit(2);
        }
        System.out.println("done !");
        System.out.println("Web site of jonas is at :" + url);

        System.out.print("Looking up java:comp/env/ejb/Op ...");
        // Connecting to OpHome thru JNDI
        OpHome home = null;
        try {
            home = (OpHome) PortableRemoteObject.narrow(initialContext.lookup("java:comp/env/ejb/Op"), OpHome.class);
            System.out.println("done !");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Cannot lookup OpHome: " + e);
            System.exit(2);
        }

        // OpBean creation
        Op t1 = null;
        try {
            System.out.println("Create a bean");
            t1 = home.create("User1");
        } catch (Exception e) {
            System.err.println("Cannot create OpBean: " + e);
            System.exit(2);
        }

        // First transaction (committed)
        try {
            System.out.println("Start a first transaction");
            utx.begin();
            System.out.println("First request on the new bean");
            t1.buy(FIRST_BUY_AMOUNT);
            System.out.println("Second request on the bean");
            t1.buy(SECOND_BUY_AMOUNT);
            System.out.println("Commit the transaction");
            utx.commit();
        } catch (Exception e) {
            System.err.println("exception during 1st Tx: " + e);
            System.exit(2);
        }
        // Start another transaction (rolled back)
        try {
            System.out.println("Start a second transaction");
            utx.begin();
            t1.buy(THIRD_BUY_AMOUNT);
            System.out.println("Rollback the transaction");
            utx.rollback();
        } catch (Exception e) {
            System.err.println("exception during 2nd Tx: " + e);
            System.exit(2);
        }

        // Get the total bought, outside the transaction
        int val = 0;
        try {
            System.out.println("Request outside any transaction");
            val = t1.read();
        } catch (Exception e) {
            System.err.println("Cannot read value on t1 : " + e);
            System.exit(2);
        }
        if (val != FIRST_BUY_AMOUNT + SECOND_BUY_AMOUNT) {
            System.err.println("Bad value read: " + val);
            System.exit(2);
        }

        // Remove Session bean
        try {
            t1.remove();
        } catch (Exception e) {
            System.out.println("Exception on buy: " + e);
            System.exit(2);
        }
        System.out.println("ClientOp OK. Exiting.");
    }
}

