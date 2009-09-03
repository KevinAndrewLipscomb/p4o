<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_unit.ascx.cs" Inherits="UserControl_unit.TWebUserControl_unit"%>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td valign="top"><font class="compact">Code:</font></td>
          <td valign="top">
            <font class="compact">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
              <ASP:TextBox id="TextBox_id" runat="server" columns="3" maxlength="3" cssclass="compact"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
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
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter brand new Unit</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
      <ASP:DropDownList id="DropDownList_spec" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_code_SelectedIndexChanged"></ASP:DropDownList><br>
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
        <tr>
          <td><font class="compact">Division:</font></td>
          <td>
            <font class="compact">
              <ASP:DropDownList id="DropDownList_division" runat="server" cssclass="compact" enabled="False"></ASP:DropDownList>
            </font>
          </td>
          <td>
            <ASP:RequiredFieldValidator id="RequiredFieldValidator_division" runat="server" errormessage="Please select a Division." font-bold="True" controltovalidate="DropDownList_division" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>
