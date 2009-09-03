<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_new_binder.ascx.cs" Inherits="UserControl_new_binder.TWebUserControl_new_binder"%>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="Time & attendance record" id="TabPanel_time_and_attendance_record"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Training request" id="TabPanel_training_request"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Internal requisition" id="TabPanel_internal_requisition"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Lateral transfer request" id="TabPanel_lateral_transfer_request"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td style="PADDING:8px; BORDER-BOTTOM:thin solid silver; BORDER-LEFT:thin solid silver; BORDER-RIGHT:thin solid silver;">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>