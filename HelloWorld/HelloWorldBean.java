package helloWorld;

import java.rmi.RemoteException;

import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;

public class HelloWorldBean implements SessionBean
{
  protected SessionContext ctx;
  private static final long serialVersionUID = 1132123154514L;
  public String sayHello()
  {
    return "Hello, world !";
  }
  
  public void ejbCreate() {}
  public void ejbActivate() throws EJBException, RemoteException {}
  public void ejbPassivate() throws EJBException, RemoteException {}
  public void ejbRemove() throws EJBException, RemoteException {}
  public void setSessionContext(SessionContext arg0) 
    throws EJBException, RemoteException
  {
    ctx = arg0;
  }
}
