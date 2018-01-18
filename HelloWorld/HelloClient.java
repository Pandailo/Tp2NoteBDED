package helloWorld;

import helloWorld.HelloWorld;
import helloWorld.HelloWorldHome;

import javax.naming.InitialContext;
import javax.naming.Context;
import javax.rmi.PortableRemoteObject;

public class HelloClient
{
	public static void main(String[] args)
	{
		Context initialContext = null;
		try
		{
			initialContext = new InitialContext();
		} catch (Exception e)
		{
			System.err.println("Cannot get initial context for JNDI: " + e);
			System.exit(2);
		}
		try
		{
			Object objref = initialContext.lookup("myHelloWorld");
			HelloWorldHome home = (HelloWorldHome)PortableRemoteObject.narrow(
		  	objref, 
		 	HelloWorldHome.class);
			HelloWorld myHelloWorld = home.create();
			String message = myHelloWorld.sayHello();
			System.out.println(message);
		} catch (Exception e)
		{
			System.err.println(" Erreur : " + e);
			System.exit(2);
		}
	}
}

