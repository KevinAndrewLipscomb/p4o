<!DOCTYPE html>
<%@ Page language="c#" Debug="true" Codebehind="login.aspx.cs" AutoEventWireup="True" Inherits="login.TWebForm_login" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <title></title>
    <link href="css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "css/standard-overrides-for-ie6.css";</style><![endif]-->
    <script type="text/javascript" src="js/sha1.js"></script>
  </head>

  <body bgcolor="white">
  <form id="Form_control" runat="server">
<uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			  <tr>
				<td>
				  <table cellspacing="0" cellpadding="5" border="0">
					  <tr>
						<td bgcolor="#f5f5f5">
						<table cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
							  <td><strong>Log in</strong></td>
							  <td>
								<div align="right">
							  <ASP:CustomValidator id="CustomValidator_account_exists" runat="server" errormessage="Invalid user/password combination. Please try again." font-bold="True" onservervalidate="CustomValidator_account_exists_ServerValidate">!ERR!</ASP:CustomValidator>
								</div></td>
							</tr>
						</table></td>
					  </tr>
					  <tr>
						<td>
			<table cellspacing="0" cellpadding="5">
			  <tbody>
				<tr>
				  <td>
					<p align="right">Username:</p>
				  </td>
				  <td><small>
					<ASP:TextBox id="TextBox_username" runat="server" maxlength="40" tabindex="1"></ASP:TextBox></small>
				  </td>
				  <td>
					<p>
					  <small>
						<ASP:LinkButton id="LinkButton_new_user" runat="server" causesvalidation="False" tabindex="5" onclick="LinkButton_new_user_Click">New user?</ASP:LinkButton><br />
						<ASP:LinkButton id="LinkButton_forgot_username" runat="server" causesvalidation="False" tabindex="6" onclick="LinkButton_forgot_username_Click">Forgot username?</ASP:LinkButton>
					  </small>
					</p>
				  </td>
				  <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_username" runat="server" errormessage="Please enter a username." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:RequiredFieldValidator>
					<ASP:RegularExpressionValidator id="RegularExpressionValidator_username" runat="server" errormessage='Please use only letter, number, hyphen ("-"), and underscore ("_") characters (or local equivalents) in your username.' font-bold="True" controltovalidate="TextBox_username" validationexpression="[\w-]+">!ERR!</ASP:RegularExpressionValidator>
				  </td>
				</tr>
				<tr>
				  <td>
					<p align="right">Password:</p>
				  </td>
				  <td>
					<asp:textbox id="TextBox_password" runat="server" textmode="Password" tabindex="2" autocomplete="off"></asp:textbox>
				  </td>
                            <td><small><ASP:LinkButton id="LinkButton_forgot_password" runat="server" causesvalidation="False" tabindex="7" onclick="LinkButton_forgot_password_Click">Forgot password?</ASP:LinkButton></small></td>
                            <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_password" runat="server" errormessage="Please enter a password." font-bold="True" controltovalidate="TextBox_password">!ERR!</ASP:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
				  <td>
				  </td>
				  <td>
					<asp:checkbox id="CheckBox_keep_me_logged_in"
								  runat="server"
								  text="Keep me logged in on this computer" enabled="False" visible="False" tabindex="3">
					</asp:checkbox>
				  </td>
                            <td></td>
                            <td></td>
				</tr>
				<tr>
				  <td valign="top">
				  </td>
				  <td><asp:button id="Button_log_in"
								runat="server" text="Log in" font-bold="True" tabindex="4" onclick="Button_log_in_Click">
					</asp:button>
				  </td>
                            <td></td>
                            <td></td>
				</tr>
			  </tbody>
			</table>
						</td>
					  </tr>
				  </table>
				</td>
			  </tr>
		  </table>
      <br />
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td style="border-top:2px dashed gold; border-bottom:2px dashed gold;" valign="top">
            <small>
              <strong><asp:Literal ID="Literal_application_name" runat="server"></asp:Literal></strong> is
              <asp:HyperLink ID="HyperLink_open_source_software_definition" runat="server" NavigateUrl="http://en.wikipedia.org/wiki/Open_source_software" Target="_blank">open source software</asp:HyperLink>.&nbsp;
              Its <asp:HyperLink ID="HyperLink_software_repository_definition" runat="server" NavigateUrl="http://en.wikipedia.org/wiki/Software_repository" Target="_blank">repository</asp:HyperLink> is
              <asp:HyperLink ID="HyperLink_repository_here" runat="server" NavigateUrl="http://sourceforge.net/p/kveo-it-project/code/HEAD/tree/trunk/p4o/" Target="_blank">HERE</asp:HyperLink>.&nbsp;
              <asp:HyperLink ID="HyperLink_Frompaper2webDotCom" runat="server" NavigateUrl="http://frompaper2web.com" Target="_blank">FromPaper2Web.com</asp:HyperLink> provides development, hosting, and maintenance.
            </small>
          </td>
        </tr>
      </table>
    <input id="Hidden_client_timezone_offset" runat="server" type="hidden" />
    <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></form>
  </body>
</html>
