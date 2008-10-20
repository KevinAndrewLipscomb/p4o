<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_role.pas" Inherits="UserControl_role.TWebUserControl_role"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td bgcolor="gainsboro" valign="top"><font class="">Title:</font></td>
          <td valign="top"><font class="">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
              <ASP:TextBox id="TextBox_name" runat="server" cssclass="" maxlength="63" columns="63"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP"></ASP:Button>
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
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False">Enter brand new Role</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False"></asp:LinkButton>
      <ASP:DropDownList id="DropDownList_name" runat="server" autopostback="True" visible="False"></ASP:DropDownList><br>
            </font></td>
          <td nowrap="True" valign="top">
            <ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_name" errormessage="Please enter Name.">!ERR!</ASP:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator_name" runat="server" errormessage="Please enter a valid Role title." font-bold="True" controltovalidate="TextBox_name" validationexpression="[a-zA-Z\-. ']+">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr id="TableRow_pecking_order" runat="server" visible="False">
          <td><font class="">Pecking order:</font></td>
          <td><font class="">
              <ASP:TextBox id="TextBox_pecking_order" runat="server" cssclass="" maxlength="10" columns="10" enabled="False"></ASP:TextBox>
            </font></td>
          <td>
            <asp:RequiredFieldValidator id="RequiredFieldValidator_pecking_order" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_pecking_order" errormessage="Please enter Pecking order.">!ERR!</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator_pecking_order" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_pecking_order" errormessage="Please enter a valid Pecking order." validationexpression="\d{1,10}">!ERR!</asp:RegularExpressionValidator></td>
        </tr>
        <tr id="TableRow_soft_hyphenation_text" runat="server" visible="False">
          <td><font class="">Soft hyphenation text:</font></td>
          <td><font class="">
              <ASP:TextBox id="TextBox_soft_hyphenation_text" runat="server" cssclass="" maxlength="127" columns="72" enabled="False"></ASP:TextBox>
            </font></td>
          <td>
            <ASP:RequiredFieldValidator id="RequiredFieldValidator_soft_hyphenation_text" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_soft_hyphenation_text" errormessage="Please enter Soft hyphenation text.">!ERR!</ASP:RequiredFieldValidator></td>
        </tr>
      </table></td>
  </tr>
</table>
<ASP:Button id="Button_submit" runat="server" enabled="False" text="Submit"></ASP:Button>&nbsp;&nbsp;
<ASP:Button id="Button_delete" runat="server" enabled="False" text="Delete"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a id="Anchor_quick_message_shortcut" runat="server" visible="False">QuickMessage</a>
<p>
  <table id="Table_holders" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" runat="server" visible="False">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" border="0">
          <tr>
            <td bgcolor="whitesmoke"><strong>Holders&nbsp;(
                <asp:Label id="Label_num_rows" runat="server"></asp:Label>)
              </strong></td>
          </tr>
          <tr>
            <td>
              <asp:GridView id="GridView_holders" runat="server" borderstyle="None" cellpadding="5" allowsorting="True" gridlines="None" autogeneratecolumns="False">
                <Columns>
                  <asp:BoundField datafield="member_name" headertext="Name" sortexpression="member_name%">
                    <ItemStyle wrap="False" font-size="X-Small"></ItemStyle>
                  </asp:BoundField>
                  <asp:BoundField datafield="email_address"></asp:BoundField>
                </Columns>
              </asp:GridView></td>
          </tr>
        </table></td>
    </tr>
  </table>
</p>
<p>
  <table id="Table_quick_message" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1" runat="server" visible="False">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" width="100%" border="0">
          <tr>
            <td bgcolor="#f5f5f5"><a id="QuickMessage"><strong>QuickMessage</strong>
              </a></td>
          </tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr>
                  <td>To:</td>
                  <td>The parties shown in the adjacent table (see below for resolution)</td>
                  <td></td>
                </tr>
                <tr>
                  <td>Bcc:</td>
                  <td>
                    <ASP:Label id="Label_author_email_address" runat="server"></ASP:Label></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Subject:</td>
                  <td>
                    <ASP:TextBox id="TextBox_quick_message_subject" runat="server" maxlength="255" columns="72"></ASP:TextBox></td>
                  <td></td>
                </tr>
                <tr>
                  <td valign="top">Body:</td>
                  <td>
                    <ASP:TextBox id="TextBox_quick_message_body" runat="server" columns="72" textmode="MultiLine" rows="18"></ASP:TextBox></td>
                  <td valign="top" nowrap="true">
                    <ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_quick_message_body" errormessage="Please enter a message body." validationgroup="QuickMessage">!ERR!</ASP:RequiredFieldValidator></td>
                </tr>
                <tr>
                  <td></td>
                  <td>
                    <ASP:Button id="Button_send" runat="server" text="Send" validationgroup="QuickMessage" enabled="False"></ASP:Button></td>
                  <td></td>
                </tr>
                <tr>
                  <td valign="top">
                    <small><font color="#c0c0c0">Resolves to:
                    </small></font></td>
                  <td valign="top">
                    <small>
                      <ASP:Label id="Label_distribution_list" runat="server" forecolor="Silver"></ASP:Label>
                    </small></td>
                  <td></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</p>

