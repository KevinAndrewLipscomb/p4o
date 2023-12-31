<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_precontent.ascx.cs" Inherits="UserControl_precontent.TWebUserControl_precontent"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_bread_crumb_trail" Src="~/usercontrol/ki/UserControl_bread_crumb_trail.ascx" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="~/usercontrol/app/UserControl_app_level_announcement.ascx" TagPrefix="uc1" TagName="UserControl_app_level_announcement" %>

<asp:ScriptManager ID="ScriptManager_control" runat="server"><Scripts><asp:ScriptReference Path="~/js/ErrorHandler.js" /></Scripts></asp:ScriptManager>
<table width="100%" bgcolor="Gold" border="1" bordercolor="Gold" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="100%" cellspacing="0" cellpadding="5">
        <tr>
          <td align="left"><small><a href="#ReferenceMaterial">Reference material</a></small></td>
          <td align="center"><ASP:Label id="Label_application_name" runat="server" font-bold="True"></ASP:Label></td>
          <td align="right"><small><a href="#ProcessImprovement">Process improvement</a></small></td>
        </tr>
        <tr id="TableRow_account_control" runat="server">
          <td align="left" colspan="3">
            <hr align="center" noshade="true" width="100%" size="1">
            <small>
              <ASP:Label id="Label_username" runat="server"></ASP:Label>:&nbsp;&nbsp;<ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False" onclick="LinkButton_logout_Click">logout</ASP:LinkButton>&nbsp;|&nbsp;<ASP:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False" onclick="LinkButton_change_password_Click">password</ASP:LinkButton>&nbsp;|&nbsp;<ASP:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False" onclick="LinkButton_change_email_address_Click">email&nbsp;address</ASP:LinkButton>
            </small>
            <hr align="center" noshade="true" width="100%" size="1">
            <small><i><uc1:UserControl_bread_crumb_trail id="UserControl_bread_crumb_trail" runat="server"></uc1:UserControl_bread_crumb_trail></i></small>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr>
    <td valign="top">
      <asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Always">
        <ContentTemplate>
          <ASP:ValidationSummary id="ValidationSummary_control" runat="server"></ASP:ValidationSummary>
        </ContentTemplate>
      </asp:UpdatePanel>
      <uc1:usercontrol_app_level_announcement runat="server" id="UserControl_app_level_announcement" />
      