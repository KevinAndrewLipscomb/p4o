using Class_biz_user;
using System;
using System.Web;

#pragma warning disable CA1716
namespace Global
  {
  public class TGlobal : System.Web.HttpApplication
    {
    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    //Constructor  Create()
    public TGlobal()
      : base()
      {
      // Required for Designer support
      InitializeComponent();
      // TODO: Add any constructor code after InitializeComponent call
      }

    protected void Application_Start(object sender, EventArgs e)
      {
      }

    protected void Session_Start(object sender, EventArgs e)
      {
      }

    protected void Application_BeginRequest(object sender, EventArgs e)
      {
      }

    protected void Application_EndRequest(object sender, EventArgs e)
      {
      }

    protected void Application_AuthenticateRequest(object sender, EventArgs e)
      {
        if (Request.IsAuthenticated)
          {
          HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(User.Identity, (new TClass_biz_user().Roles()));
          }
      }

    protected void Application_Error(object sender, EventArgs e)
      {
    Server.Transfer("~/exception.aspx");
      }

    protected void Session_End(object sender, EventArgs e)
      {
      }

    protected void Application_End(object sender, EventArgs e)
      {
      }

    } // end TGlobal

  }

namespace Global.Units
  {
  public class Global
    {
    } // end Global

  }

