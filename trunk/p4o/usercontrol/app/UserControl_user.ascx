<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_user.pas" Inherits="UserControl_user.TWebUserControl_user"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td valign="top">Username:</td>
    <td valign="top">
      <ASP:TextBox id="TextBox_username" runat="server" columns="40" maxlength="40"></ASP:TextBox>
      &nbsp;&nbsp;&nbsp;
      <ASP:LinkButton id="LinkButton_search" runat="server" causesvalidation="False">Lookup</ASP:LinkButton>
      &nbsp;&nbsp;&nbsp;
      <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False">Reset</ASP:LinkButton><br>
      <ASP:DropDownList id="DropDownList_username" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br>
    </td>
    <td valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_username" runat="server" errormessage="Please enter Username." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Encoded password:</td>
    <td>
      <ASP:TextBox id="TextBox_encoded_password" runat="server" enabled="False" columns="40" maxlength="40"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Be stale password:</td>
    <td>
      <ASP:CheckBox id="CheckBox_be_stale_password" runat="server"></ASP:CheckBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Password reset email address:</td>
    <td>
      <ASP:TextBox id="TextBox_password_reset_email_address" runat="server" columns="60" maxlength="255"></ASP:TextBox>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_password_reset_email_address" runat="server" errormessage="Please enter Password reset email address." font-bold="True" controltovalidate="TextBox_password_reset_email_address">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Be active:</td>
    <td>
      <ASP:CheckBox id="CheckBox_be_active" runat="server"></ASP:CheckBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Num unsuccessful login attempts:</td>
    <td>
      <ASP:TextBox id="TextBox_num_unsuccessful_login_attempts" runat="server" enabled="False"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Last login:</td>
    <td>
      <ASP:TextBox id="TextBox_last_login" runat="server" enabled="False"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>
