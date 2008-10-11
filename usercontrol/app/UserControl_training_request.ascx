<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_training_request.pas" Inherits="UserControl_training_request.TWebUserControl_training_request"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
<ASP:Panel id="Panel_detail_origination" runat="server">
  <tr>
    <td bgcolor="gainsboro" valign="top"><font class="">ID:</font></td>
    <td valign="top"><font class="">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
      <ASP:TextBox id="TextBox_id" runat="server"  cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP"></ASP:Button>
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
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False">Enter&nbsp;brand&nbsp;new&nbsp;Training&nbsp;request</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <ASP:DropDownList id="DropDownList_id" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br>
    </font>
    </td>
    <td valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_id" runat="server" errormessage="Please enter Id." font-bold="True" controltovalidate="TextBox_id" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_id" runat="server" errormessage="Please enter a valid Id." font-bold="True" controltovalidate="TextBox_id" validationexpression="(-?\d+)?" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Submitted by:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_member_id" runat="server" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Submission timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_submission_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_detail" runat="server">
  <tr>
    <td><font class="">Nature of training:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_nature" runat="server" columns="72" maxlength="127" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_nature" runat="server" errormessage="Please enter Nature." font-bold="True" controltovalidate="TextBox_nature" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Dates:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_dates" runat="server" columns="72" maxlength="255" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Conducting agency:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_conducting_agency" runat="server" columns="72" maxlength="127" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_conducting_agency" runat="server" errormessage="Please enter Conducting agency." font-bold="True" controltovalidate="TextBox_conducting_agency" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Location:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_location" runat="server" columns="72" maxlength="127" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Anticipated cost of enrollment:</font></td>
    <td><font class="">
      $<ASP:TextBox id="TextBox_cost_of_enrollment" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_cost_of_enrollment" runat="server" errormessage="Please enter Cost of enrollment." font-bold="True" controltovalidate="TextBox_cost_of_enrollment" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_cost_of_enrollment" runat="server" errormessage="Please enter a valid Cost of enrollment." font-bold="True" controltovalidate="TextBox_cost_of_enrollment" validationexpression="\d*\.?\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Anticipated cost of lodging:</font></td>
    <td><font class="">
      $<ASP:TextBox id="TextBox_cost_of_lodging" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_cost_of_lodging" runat="server" errormessage="Please enter Cost of lodging." font-bold="True" controltovalidate="TextBox_cost_of_lodging" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_cost_of_lodging" runat="server" errormessage="Please enter a valid Cost of lodging." font-bold="True" controltovalidate="TextBox_cost_of_lodging" validationexpression="\d*\.?\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Anticipated cost of meals:</font></td>
    <td><font class="">
      $<ASP:TextBox id="TextBox_cost_of_meals" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_cost_of_meals" runat="server" errormessage="Please enter Cost of meals." font-bold="True" controltovalidate="TextBox_cost_of_meals" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_cost_of_meals" runat="server" errormessage="Please enter a valid Cost of meals." font-bold="True" controltovalidate="TextBox_cost_of_meals" validationexpression="\d*\.?\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Anticipated cost of transportation:</font></td>
    <td><font class="">
      $<ASP:TextBox id="TextBox_cost_of_transportation" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_cost_of_transportation" runat="server" errormessage="Please enter Cost of transportation." font-bold="True" controltovalidate="TextBox_cost_of_transportation" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_cost_of_transportation" runat="server" errormessage="Please enter a valid Cost of transportation." font-bold="True" controltovalidate="TextBox_cost_of_transportation" validationexpression="\d*\.?\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Reason to attend:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_reason" runat="server" columns="60" maxlength="0" textmode="MultiLine" rows="4" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_training" runat="server">
  <tr>
    <td><font class="">Disposition training timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_training_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_training_timestamp" runat="server" errormessage="Please enter Disposition training timestamp." font-bold="True" controltovalidate="TextBox_disposition_training_timestamp" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition training member id:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_training_member_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_training_member_id" runat="server" errormessage="Please enter Disposition training member id." font-bold="True" controltovalidate="TextBox_disposition_training_member_id" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_disposition_training_member_id" runat="server" errormessage="Please enter a valid Disposition training member id." font-bold="True" controltovalidate="TextBox_disposition_training_member_id" validationexpression="\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition training funding source:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_training_funding_source" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_training_funding_source" runat="server" errormessage="Please enter Disposition training funding source." font-bold="True" controltovalidate="TextBox_disposition_training_funding_source" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_disposition_training_funding_source" runat="server" errormessage="Please enter a valid Disposition training funding source." font-bold="True" controltovalidate="TextBox_disposition_training_funding_source" validationexpression="(-?\d+)?" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition training comments:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_training_comments" runat="server" columns="0" maxlength="0" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_squad" runat="server">
  <tr>
    <td><font class="">Disposition squad timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_squad_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_squad_timestamp" runat="server" errormessage="Please enter Disposition squad timestamp." font-bold="True" controltovalidate="TextBox_disposition_squad_timestamp" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition squad member id:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_squad_member_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_squad_member_id" runat="server" errormessage="Please enter Disposition squad member id." font-bold="True" controltovalidate="TextBox_disposition_squad_member_id" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_disposition_squad_member_id" runat="server" errormessage="Please enter a valid Disposition squad member id." font-bold="True" controltovalidate="TextBox_disposition_squad_member_id" validationexpression="\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition squad be approved:</font></td>
    <td><font class="">
      <ASP:CheckBox id="CheckBox_disposition_squad_be_approved" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition squad comments:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_squad_comments" runat="server" columns="0" maxlength="0" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_unit" runat="server">
  <tr>
    <td><font class="">Disposition unit timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_unit_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_unit_timestamp" runat="server" errormessage="Please enter Disposition unit timestamp." font-bold="True" controltovalidate="TextBox_disposition_unit_timestamp" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition unit member id:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_unit_member_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_unit_member_id" runat="server" errormessage="Please enter Disposition unit member id." font-bold="True" controltovalidate="TextBox_disposition_unit_member_id" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_disposition_unit_member_id" runat="server" errormessage="Please enter a valid Disposition unit member id." font-bold="True" controltovalidate="TextBox_disposition_unit_member_id" validationexpression="\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition unit be approved:</font></td>
    <td><font class="">
      <ASP:CheckBox id="CheckBox_disposition_unit_be_approved" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition unit comments:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_unit_comments" runat="server" columns="0" maxlength="0" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_division" runat="server">
  <tr>
    <td><font class="">Disposition division timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_division_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_division_timestamp" runat="server" errormessage="Please enter Disposition division timestamp." font-bold="True" controltovalidate="TextBox_disposition_division_timestamp" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition division member id:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_division_member_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_division_member_id" runat="server" errormessage="Please enter Disposition division member id." font-bold="True" controltovalidate="TextBox_disposition_division_member_id" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_disposition_division_member_id" runat="server" errormessage="Please enter a valid Disposition division member id." font-bold="True" controltovalidate="TextBox_disposition_division_member_id" validationexpression="\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition division be approved:</font></td>
    <td><font class="">
      <ASP:CheckBox id="CheckBox_disposition_division_be_approved" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition division comments:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_division_comments" runat="server" columns="0" maxlength="0" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_assistant_chief" runat="server">
  <tr>
    <td><font class="">Disposition assistant chief timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_assistant_chief_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_assistant_chief_timestamp" runat="server" errormessage="Please enter Disposition assistant chief timestamp." font-bold="True" controltovalidate="TextBox_disposition_assistant_chief_timestamp" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition assistant chief member id:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_assistant_chief_member_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_disposition_assistant_chief_member_id" runat="server" errormessage="Please enter Disposition assistant chief member id." font-bold="True" controltovalidate="TextBox_disposition_assistant_chief_member_id" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_disposition_assistant_chief_member_id" runat="server" errormessage="Please enter a valid Disposition assistant chief member id." font-bold="True" controltovalidate="TextBox_disposition_assistant_chief_member_id" validationexpression="\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition assistant chief be approved:</font></td>
    <td><font class="">
      <ASP:CheckBox id="CheckBox_disposition_assistant_chief_be_approved" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Disposition assistant chief comments:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_disposition_assistant_chief_comments" runat="server" columns="0" maxlength="0" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_finance" runat="server">
  <tr>
    <td><font class="">Payment timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_payment_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_payment_timestamp" runat="server" errormessage="Please enter Payment timestamp." font-bold="True" controltovalidate="TextBox_payment_timestamp" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Payment member id:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_payment_member_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_payment_member_id" runat="server" errormessage="Please enter Payment member id." font-bold="True" controltovalidate="TextBox_payment_member_id" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_payment_member_id" runat="server" errormessage="Please enter a valid Payment member id." font-bold="True" controltovalidate="TextBox_payment_member_id" validationexpression="\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Payment be done:</font></td>
    <td><font class="">
      <ASP:CheckBox id="CheckBox_payment_be_done" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td><font class="">Payment actual amount:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_payment_actual_amount" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_payment_actual_amount" runat="server" errormessage="Please enter Payment actual amount." font-bold="True" controltovalidate="TextBox_payment_actual_amount" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_payment_actual_amount" runat="server" errormessage="Please enter a valid Payment actual amount." font-bold="True" controltovalidate="TextBox_payment_actual_amount" validationexpression="\d*\.?\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Payment comments:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_payment_comments" runat="server" columns="0" maxlength="0" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_status" runat="server">
  <tr>
    <td><font class="">Status code:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_status_code" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_status_code" runat="server" errormessage="Please enter Status code." font-bold="True" controltovalidate="TextBox_status_code" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_status_code" runat="server" errormessage="Please enter a valid Status code." font-bold="True" controltovalidate="TextBox_status_code" validationexpression="(-?\d+)?" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
</ASP:Panel>
<ASP:Panel id="Panel_disposition_finalization" runat="server">
  <tr>
    <td><font class="">Finalization timestamp:</font></td>
    <td><font class="">
      <ASP:TextBox id="TextBox_finalization_timestamp" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
    </font>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_finalization_timestamp" runat="server" errormessage="Please enter Finalization timestamp." font-bold="True" controltovalidate="TextBox_finalization_timestamp" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
</ASP:Panel>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>

