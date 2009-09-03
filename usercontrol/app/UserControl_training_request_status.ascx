<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_training_request_status.ascx.cs" Inherits="UserControl_training_request_status.TWebUserControl_training_request_status"%>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td bgcolor="gainsboro" valign="top"><font class="compact">Code:</font></td>
          <td valign="top">
            <font class="compact">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
              <ASP:TextBox id="TextBox_id" runat="server" columns="3" maxlength="3" cssclass="compact"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP"></ASP:Button>
                        </td>
                        <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full ID</asp:Label></em></small></small></td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False">New lookup</ASP:LinkButton>
                    </small>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False">Enter brand new Training request status</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton>
      <ASP:DropDownList id="DropDownList_spec" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br>
            </font>
          </td>
          <td valign="top">
            <asp:RegularExpressionValidator id="RegularExpressionValidator_code" runat="server" errormessage="Please enter a valid Code." font-bold="True" display="Dynamic" controltovalidate="TextBox_id" validationexpression="\d+">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td><font class="compact">Description:</font></td>
          <td>
            <font class="compact">
              <ASP:TextBox id="TextBox_description" runat="server" columns="63" maxlength="63" cssclass="compact" enabled="False"></ASP:TextBox>
            </font>
          </td>
          <td>
            <ASP:RequiredFieldValidator id="RequiredFieldValidator_description" runat="server" errormessage="Please enter Description." font-bold="True" controltovalidate="TextBox_description" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>
