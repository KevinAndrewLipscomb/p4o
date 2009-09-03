<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member.ascx.cs" Inherits="UserControl_member.TWebUserControl_member"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top"><font class="">Registration&nbsp;code:</font></td>
    <td valign="top"><font class="">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
      <ASP:TextBox id="TextBox_registration_code" runat="server" columns="15" maxlength="15" cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                        </td>
                        <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full ID</asp:Label></em></small></small></td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False" onclick="LinkButton_reset_Click">New lookup</ASP:LinkButton>
                    </small>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter brand new Member</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
      <ASP:DropDownList id="DropDownList_registration_code" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_registration_code_SelectedIndexChanged"></ASP:DropDownList><br>
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
      <ASP:TextBox id="TextBox_last_name" runat="server" columns="31" maxlength="31" cssclass="" enabled="False"></ASP:TextBox>
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
      <ASP:TextBox id="TextBox_first_name" runat="server" columns="31" maxlength="31" cssclass="" enabled="False"></ASP:TextBox>
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
      <ASP:TextBox id="TextBox_email_address" runat="server" columns="72" maxlength="255" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
                  <asp:RegularExpressionValidator id="RegularExpressionValidator_email_address" runat="server" errormessage="Please enter a valid Email address." font-bold="True" controltovalidate="TextBox_email_address" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                  display="Dynamic">!ERR!</asp:RegularExpressionValidator>
                  <asp:CustomValidator id="CustomValidator_email_address" runat="server" errormessage='Please enter a valid Email address domain name (the part after the "@").' display="Dynamic" font-bold="True" controltovalidate="TextBox_email_address" onservervalidate="CustomValidator_email_address_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Squad:</font></td>
    <td><font class="">
                    <asp:DropDownList id="DropDownList_squad" runat="server" enabled="False"></asp:DropDownList>
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
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>
