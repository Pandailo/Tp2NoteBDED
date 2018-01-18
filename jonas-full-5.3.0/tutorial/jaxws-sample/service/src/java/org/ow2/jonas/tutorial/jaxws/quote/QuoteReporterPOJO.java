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
 * $Id: QuoteReporterPOJO.java 17803 2009-06-25 12:58:11Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.tutorial.jaxws.quote;

import javax.jws.WebService;


@WebService(portName="QuoteReporterPort",
            serviceName="QuoteReporterService",
            targetNamespace="http://jonas.ow2.org/tutorial/jaxws/quote",
            endpointInterface="org.ow2.jonas.tutorial.jaxws.quote.QuoteReporter")

public class QuoteReporterPOJO implements QuoteReporter {

	public Quote getQuote(String ticker)  {
		Quote quote = new Quote();
		quote.setTicker(ticker);
		quote.setValue(Math.random() * 100);
		return quote;
	}
}
