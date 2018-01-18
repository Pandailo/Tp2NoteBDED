/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 2009 Bull S.A.S.
 * Contact: jonas-team@ow2.org
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 *
 * --------------------------------------------------------------------------
 * $Id: QuoteMain.java 17805 2009-06-25 13:08:27Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.tutorial.jaxws.client;

import javax.xml.ws.WebServiceRef;
import org.ow2.jonas.tutorial.jaxws.quote.Quote;
import org.ow2.jonas.tutorial.jaxws.quote.QuoteReporter;
import org.ow2.jonas.tutorial.jaxws.quote.QuoteReporterService;

public class QuoteMain {

  @WebServiceRef
	static private QuoteReporterService service;

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		QuoteReporter reporter = service.getQuoteReporterPort();
		for (int i = 0; i < 10; i++) {
			Quote quote = reporter.getQuote("Ticker " + i);
			System.out.println("Quote[" + quote.getTicker() + ", " + quote.getValue());
		}
	}

}
