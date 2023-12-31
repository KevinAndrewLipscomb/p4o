<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_business_objects_binder.ascx.cs" Inherits="UserControl_business_objects_binder.TWebUserControl_business_objects_binder"%>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki" CssTheme="None">
            <cc1:TabPanel runat="server" headertext="Squads" id="TabPanel_squads"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Units" id="TabPanel_units"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Divisions" id="TabPanel_divisions"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Bureaus" id="TabPanel_bureaus"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td class="ki_tab_body">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>