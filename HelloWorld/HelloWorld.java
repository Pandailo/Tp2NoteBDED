package helloWorld;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface HelloWorld extends EJBObject
{
  public String sayHello() throws RemoteException;
}
