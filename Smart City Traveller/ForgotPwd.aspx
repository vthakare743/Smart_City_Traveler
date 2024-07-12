<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPwd.aspx.cs" Inherits="ForgotPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="login-tbl">
        <tr>
            <td align="center" bgcolor="#006666" colspan="2">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White" 
                    Text="Forgot Password"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 30px">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#339933" 
                    Text="Enter Your Username"></asp:Label>
            </td>
            <td style="height: 30px">
                <asp:TextBox ID="txtUsername" runat="server" ValidationGroup="A" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUsername" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300" SetFocusOnError="True" ValidationGroup="A">Please Enter the Username</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnOtp" runat="server" onclick="btnOtp_Click" Text="Send OTP" 
                    ValidationGroup="A" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#339933" 
                    Text="Enter OTP"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOtp" runat="server" Enabled="False" ValidationGroup="B" 
                    Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtOtp" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300" SetFocusOnError="True" ValidationGroup="B">Please Enter the OTP</asp:RequiredFieldValidator>
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
                <asp:Button ID="btnpwd" runat="server" class="hvr-wobble-vertical btn-style" 
                    onclick="btnpwd_Click" Text="Get Password" ValidationGroup="B" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

