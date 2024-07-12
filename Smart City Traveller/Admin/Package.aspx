<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Package.aspx.cs" Inherits="Admin_Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td colspan="2" class="inner-head">
                <asp:Label ID="Label1" runat="server" Text="Packages"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Package Name</td>
            <td>
                <asp:TextBox ID="txtpname" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtpname" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Fill Up The Field</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtpname" ErrorMessage="RegularExpressionValidator" 
                    ForeColor="#FF3300" ValidationExpression="[a-zA-Z ]*$">Must be in Alphabets</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 28px">
                Season</td>
            <td style="height: 28px">
                <asp:DropDownList ID="ddlSeason" runat="server" Width="150px">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Spring</asp:ListItem>
                    <asp:ListItem>Winter</asp:ListItem>
                    <asp:ListItem>Summer</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ddlSeason" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True" InitialValue="Select">Please Select Season</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Travel Theme</td>
            <td>
                <asp:DropDownList ID="ddlTheme" runat="server" Width="150px">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Historical</asp:ListItem>
                    <asp:ListItem>Jungle Safari</asp:ListItem>
                    <asp:ListItem>Adventure</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ddlTheme" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True" InitialValue="Select">Please Select Theme</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Duration</td>
            <td>
                <asp:TextBox ID="txtduration" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtduration" Display="Dynamic" 
                    ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" 
                    ValidationExpression="\d+">Must be in Integer format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Location</td>
            <td>
                <asp:TextBox ID="txtloc" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtloc" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Fill Up The Field</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Description</td>
            <td>
                <asp:TextBox ID="txtdesc" runat="server" Height="95px" TextMode="MultiLine" 
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Sub Packages</td>
            <td>
                <asp:TextBox ID="txtsub" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Package Cost</td>
            <td>
                <asp:TextBox ID="txtcost" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtcost" Display="Dynamic" 
                    ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" 
                    ValidationExpression="\d+">Must be in Integer format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Choose Location Photo</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="FileUpload1" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Please Select Location Photo</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Hotel Name</td>
            <td>
                <asp:TextBox ID="txtHotelName" runat="server" Width="300px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td>
                Hotel Details</td>
            <td>
                <asp:TextBox ID="txtHotelDetails" runat="server" Height="95px" TextMode="MultiLine" 
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="btnSubmit" runat="server" 
                    ImageUrl="~/web_img/confirm1.jpg" onclick="btnSubmit_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:HiddenField ID="hfid" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#339933"></asp:Label>
                </td>
        </tr>
    </table>
</asp:Content>

