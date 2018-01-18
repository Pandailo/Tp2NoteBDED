/**
 * JOnAS: Java(TM) Open Application Server
 * Copyright (C) 1999-2005 Bull S.A.
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
 * --------------------------------------------------------------------------
 * $Id: ResourceAdapterImpl.java 17350 2009-05-13 14:15:43Z fornacif $
 * --------------------------------------------------------------------------
 */

package org.ow2.jonas.earsample.resourceadapters;


import java.net.MalformedURLException;
import java.util.HashMap;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.resource.NotSupportedException;
import javax.resource.ResourceException;
import javax.resource.spi.ActivationSpec;
import javax.resource.spi.BootstrapContext;
import javax.resource.spi.ResourceAdapterInternalException;
import javax.resource.spi.endpoint.MessageEndpointFactory;
import javax.transaction.xa.XAResource;

/**
 * A Resource adapter
 * @author kemlerp
 *
 */
public class ResourceAdapterImpl implements javax.resource.spi.ResourceAdapter, java.io.Serializable {


    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 3834312812943456568L;

    /**
     * String should be the RA name when set, ie, EIS
     */
    private String eisurl;

    /**
     * The JNDI name
     */
    private String jndiName;

    /**
     * Initial context
     */
    private InitialContext ictx;

    /**
     * BootstrapContext
     */
    private BootstrapContext bootstrapCtx = null; // set in start()

    /**
     * EndpointFactories
     */
    private transient HashMap endpointFactories = new HashMap();


    /**
     * Start
     * @param bootstrapCtx bootstrapCtx
     * @throws ResourceAdapterInternalException if an error occurs
     */
    public void start(BootstrapContext bootstrapCtx) throws ResourceAdapterInternalException {
        this.bootstrapCtx = bootstrapCtx;

        try {
            ictx = new InitialContext();
            ictx.bind(jndiName, eisurl);
        } catch (NamingException e) {
            e.printStackTrace();
        }

    }

    /**
     * Stop
     */
    public void stop() {
        try {
            ictx.unbind(jndiName);
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }


    /**
     * Called by the application server when a message-driven bean
     * (MessageEndpoint) is deployed.
     * @param factory MessageEndpointFactory
     * @param spec activation spec
     * @throws NotSupportedException if an error occurs
     * @throws ResourceAdapterInternalException if an error occurs
     */
    public void endpointActivation(MessageEndpointFactory factory, ActivationSpec spec) throws NotSupportedException,
            ResourceAdapterInternalException {
            endpointFactories.put(spec, factory);
    }

    /**
     * Endpoint Deactivation
     * @param factory MessageEndpointFactory
     * @param spec activation spec
     */
    public void endpointDeactivation(MessageEndpointFactory factory, ActivationSpec spec) {
        endpointFactories.remove(spec);
    }

    /**
     * Get XAResources
     * @param specs A tab of specs
     * @throws ResourceException if an error occurs
     * @return Tab of XAResources
     */
    public XAResource[] getXAResources(ActivationSpec[] specs) throws ResourceException {
        return null;
    }

    /**
     * Get Eis URL
     * @return Eis URL
     */
    public String getEisURL() {
        return eisurl.toString();
    }

    /**
     * Set Eis URL
     * @param eisURL Eis URL
     * @throws MalformedURLException if 'eisURL' is not a URL
     */
    public void setEisURL(String eisURL) throws MalformedURLException {
        // ra.xml deployment supplies value
        this.eisurl = eisURL;
    }

    /**
     * Get BootstrapContext
     * @return bootstrapCtx
     */
    public BootstrapContext getBootstrapCtx() {
        return bootstrapCtx;
    }

    /**
     * Set BootstrapContext
     * @param bootstrapCtx bootstrapContext
     */
    public void setBootstrapCtx(BootstrapContext bootstrapCtx) {
        this.bootstrapCtx = bootstrapCtx;
    }

    /**
     * Get used JNDI name
     * @return A string
     */
    public String getJndiName() {
        return jndiName;
    }

    /**
     * Set JNDI name
     * @param jndiName a string
     */
    public void setJndiName(String jndiName) {
        this.jndiName = jndiName;
    }
}
