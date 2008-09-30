<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_member.pas" Inherits="UserControl_member.TWebUserControl_member"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td valign="top"><font class="">Registration&nbsp;code:</font></td>
    <td valign="top"><font class="">
      <ASP:TextBox id="TextBox_registration_code" runat="server" columns="15" maxlength="15" cssclass=""></ASP:TextBox>&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_search" runat="server" causesvalidation="False">Lookup</ASP:LinkButton>&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False">Reset</ASP:LinkButton><br>
      <ASP:DropDownList id="DropDownList_registration_code" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br>
    </font>
    </td>
    <td valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_registration_code" runat="server" errormessage="Please enter Registration&nbsp;code." font-bold="True" controltovalidate="TextBox_registration_code" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
                  <asp:RegularExpressionValidator id="RegularExpressionValidator_registration_code" runat="server" errormessage="Please enter a valid registration code." font-bold="True" controltovalidate="TextBox_registration_code" validationexpression="[0-9a-zA-Z]+"
                                                  display="Dynamic">!ERR!</asp:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Last&nbsp;name:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_last_name" runat="server" columns="31" maxlength="31" cssclass=""></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_last_name" runat="server" errormessage="Please enter Last&nbsp;name." font-bold="True" controltovalidate="TextBox_last_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
                  <asp:RegularExpressionValidator id="RegularExpressionValidator_last_name" runat="server" errormessage="Please enter a valid Last name." font-bold="True" controltovalidate="TextBox_last_name" display="Dynamic" validationexpression="[a-zA-Z\-. ']+">!ERR!</asp:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">First&nbsp;name:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_first_name" runat="server" columns="31" maxlength="31" cssclass=""></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_first_name" runat="server" errormessage="Please enter First&nbsp;name." font-bold="True" controltovalidate="TextBox_first_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
                  <asp:RegularExpressionValidator id="RegularExpressionValidator_first_name" runat="server" errormessage="Please enter a valid First name." font-bold="True" controltovalidate="TextBox_first_name" validationexpression="[a-zA-Z\-. ']+" display="Dynamic">!ERR!</asp:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Email&nbsp;address:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_email_address" runat="server" columns="72" maxlength="255" cssclass=""></ASP:TextBox>
    </font>
    </td>
    <td>
                  <asp:RegularExpressionValidator id="RegularExpressionValidator_email_address" runat="server" errormessage="Please enter a valid Email address." font-bold="True" controltovalidate="TextBox_email_address" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                  display="Dynamic">!ERR!</asp:RegularExpressionValidator>
                  <asp:CustomValidator id="CustomValidator_email_address" runat="server" errormessage='Please enter a valid Email address domain name (the part after the "@").' display="Dynamic" font-bold="True" controltovalidate="TextBox_email_address">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Squad:</font></td>
    <td><font class="">
                    <asp:DropDownList id="DropDownList_squad" runat="server"></asp:DropDownList>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_squad" runat="server" errormessage="Please select a Squad." font-bold="True" controltovalidate="DropDownList_squad" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>
