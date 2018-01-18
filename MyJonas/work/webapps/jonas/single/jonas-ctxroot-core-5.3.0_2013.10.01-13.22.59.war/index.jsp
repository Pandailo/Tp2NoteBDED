<%@ page
  language="java"
  contentType="text/html;charset=utf-8"
  import = "java.util.List"
  import = "java.util.Set"
  import = "javax.management.MBeanServerFactory"
  import = "javax.management.MBeanServer"
  import = "javax.management.ObjectName"
  import = "javax.management.QueryExp"
  import = "javax.management.Query"
  import = "org.ow2.jonas.Version"
  import = "org.ow2.jonas.lib.bootstrap.JProp"
  import = "org.ow2.jonas.lib.util.JonasObjectName"
  import = "org.ow2.jonas.lib.management.javaee.J2eeObjectName"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <meta name="description" content="JOnAS Root Context"/>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <style type="text/css">
      @import "ow2_jonas.css";
    </style>
<title>
  <%

            // Connect to the local MBeanServer
            MBeanServer mbeanServer = null;
            List mbeanServers = MBeanServerFactory.findMBeanServer(null);
            if (mbeanServers.size() > 0) {
                mbeanServer = (MBeanServer) mbeanServers.get(0);
            }

            String webContainer = "";
            boolean isJetty = false;
            boolean isTomcat = false;
            boolean useEarSample = false;
            boolean useJavaEEEarSample = false;
            boolean isDocumentationAvailable = false;
            boolean isJavaDocAvailable = false;

            if (mbeanServer != null) {

              // Retrieve domain
              String domain = JProp.getInstance().getValue(JProp.DOMAIN_NAME);

              // Web Container ?
              ObjectName webContainerON = JonasObjectName.webContainerService(domain);

              boolean hasWebContainer = mbeanServer.isRegistered(webContainerON);

              if (hasWebContainer) {
                // Determine if Jetty or Tomcat
                String name = (String) mbeanServer.getAttribute(webContainerON, "ServerName");
                if ("jetty".equalsIgnoreCase(name)) {
                  isJetty = true;
                } else if ("apache tomcat".equalsIgnoreCase(name)) {
                  isTomcat = true;
                }

                // Get version
                String version = (String) mbeanServer.getAttribute(webContainerON, "ServerVersion");

                // Compose web container displayed name
                webContainer = name + " v" + version;

                // Web-apps deployed
                // ------------------------------------
                // jonas-doc-en
                QueryExp query = getContextRootQuery("jonas-doc-en");
                ObjectName on = JonasObjectName.allWars(domain);
                Set result = mbeanServer.queryMBeans(on, query);

                if (!result.isEmpty()) {
                  // Got a matching webapp
                  isDocumentationAvailable = true;
                }

                // jonas-javadoc
                query = getContextRootQuery("jonas-javadoc");
                result = mbeanServer.queryMBeans(on, query);

                if (!result.isEmpty()) {
                  // Got a matching webapp
                  isJavaDocAvailable = true;
                }

                // Same with Ear
                // ---------------------
                // j2ee-1.4 sample
                on = J2eeObjectName.J2EEApplications(domain);
                query = getJ2EEApplicationQuery("j2ee-1.4");
                result = mbeanServer.queryMBeans(on, query);

                if (!result.isEmpty()) {
                  // Got a matching app
                  useEarSample = true;
                }

                // Java EE 5.0 Sample
                query = getJ2EEApplicationQuery("javaee5-earsample");
                result = mbeanServer.queryMBeans(on, query);

                if (!result.isEmpty()) {
                  // Got a matching app
                  useJavaEEEarSample = true;
                }


              }

            } else {
              // We can't do anything, just print a nice warning and exit
            }

            // Now display data ...
            String title = "JOnAS v" + Version.getNumber();
            if (webContainer != null) {
                title += " / " + webContainer;
            }
            title += " Package";
            out.print(title);
  %>
  <%!
  /**
   * Create a JMX Query that match the ContextRoot attribute.
   */
  private static QueryExp getContextRootQuery(final String contextName) {
    return Query.eq(Query.attr("ContextRoot"), Query.value(contextName));
  }

  /**
   * Create a JMX Query that match the name attribute.
   */
  private static QueryExp getJ2EEApplicationQuery(final String appName) {
    return Query.eq(Query.attr("name"), Query.value(appName));
  }
  %>
</title>
</head>

    <body>
    <div><a href="http://www.ow2.org"><img src="logoOW2.png" alt="logo"/></a></div>
      <div class="logos">
        <%
            if (isTomcat) {
                  out.print("<a href=\"http://tomcat.apache.org\"><img title=\"Apache Tomcat\" alt=\"Apache Tomcat\" src=\"tomcat.gif\" /></a>");
            }
            if (isJetty) {
                  out.print("<a href=\"http://jetty.mortbay.org/jetty/\"><img title=\"Mortbay Jetty\" alt=\"Mortbay Jetty\" src=\"jetty.gif\" /></a>");
            }
        %>
        <a href="http://jonas.objectweb.org"><img title="JOnAS WebSite" alt="JOnAS WebSite" src="ow_jonas_logo.gif" /></a>
      </div>

      <div class="titlepage">
        <%
        out.print(title);
        %>
      </div>

      <div class="links">
      <ul>
        <%
                   if (useJavaEEEarSample) {
                       out.println("<li>");
                       out.println("<a href=\"/javaee5-earsample\">Test the Java EE 5 ear example.</a>");
                       out.println("</li>");
                   }
        %>

        <%
                    if (useEarSample) {
                        out.println("<li>");
                        out.println("<a href=\"/j2ee-1.4\">Test the J2EE 1.4 example.</a>");
                        out.println("Use the login/password jonas/jonas");
                        out.println("</li>");
                    }
        %>

        <li>
          <a href="/jonasAdmin">Go to the JOnAS administration web application.</a>
          Use the login/password jonas/jonas
        </li>
        <%
                    if (isDocumentationAvailable) {
                        out.println("<li>");
                        out.println("<a href=\"/jonas-doc-en\">Browse JOnAS documentation</a>");
                        out.println("(Up-to-date documentation can be found on <a href=\"http://wiki.jonas.objectweb.org/xwiki/bin/view/Main/Documentation\">JOnAS Web Site</a>)");
                        out.println("</li>");
                    }
                    if (isJavaDocAvailable) {
                        out.println("<li>");
                        out.println("<a href=\"/jonas-javadoc\">Browse JOnAS Javadoc</a>");
                        out.println("</li>");
                    }
        %>
      </ul>
    </div>

    <div class="footer">
      <p>
        <a href="http://validator.w3.org/check/referer"><img
           src="valid-xhtml11.png"
           alt="Valid XHTML 1.1!" title="Valid XHTML 1.1!" height="31" width="88" />
        </a>
        <a href="http://jigsaw.w3.org/css-validator/"><img
           style="border:0;width:88px;height:31px" src="vcss.png" title="Valid CSS!" alt="Valid CSS!" />
        </a>
      </p>
    </div>
  </body>
</html>
