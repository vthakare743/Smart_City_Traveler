<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Reg.aspx.cs" Inherits="Admin_Reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table bgcolor="White" class="tbl-style">
        <tr class="tbl-header">
            <td align="left"  class="style4">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/web_img/registration.png" 
                    Width="50px" />
            </td>
            <td align="left" >
                <asp:Label ID="Label3" runat="server" Font-Size="X-Large" ForeColor="White" 
                    Text="Travels Registration"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4" style="height: 28px">
                Name</td>
            <td align="left" style="height: 28px">
                <asp:TextBox ID="txtname" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtname" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Fill Up The Field</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtname" ErrorMessage="RegularExpressionValidator" 
                    ForeColor="#FF3300" ValidationExpression="[a-zA-Z ]*$">Must be in Alphabets</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                Address</td>
            <td align="left">
                <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                Mobile No.</td>
            <td align="left">
                <asp:TextBox ID="txtmob" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtmob" Display="Dynamic" 
                    ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" 
                    ValidationExpression="\d{10}">Must be proper format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                Email ID</td>
            <td align="left">
                <asp:TextBox ID="txtemail" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtemail" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Fill Up The Field</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtemail" Display="Dynamic" 
                    ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Must be in Proper Format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4" style="height: 28px">
            </td>
            <td align="left" class="style1" style="height: 28px">
            </td>
        </tr>
        <tr>
            <td align="left" class="style4" style="height: 28px">
                Username</td>
            <td align="left" class="style1" style="height: 28px">
                <asp:TextBox ID="txtuser" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                Password</td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4" style="height: 28px">
            </td>
            <td align="left" class="style1" style="height: 28px">
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                Choose Photo</td>
            <td align="left" class="style1">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                &nbsp;</td>
            <td align="left" class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" class="style4">
                <a href=Home.aspx>
                <asp:Image ID="Image5" runat="server" ImageUrl="~/web_img/home.png" 
                    Width="50px" />
                </a>
            </td>
            <td align="left" class="style1">
                <asp:Button ID="Button1" runat="server"  onclick="Button1_Click" Text="Submit" class="btn-style hvr-shrink"/>
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                &nbsp;</td>
            <td align="left" class="style1">
                <asp:HiddenField ID="hfid" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="left" class="style4">
                &nbsp;</td>
            <td align="left" class="style1">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#339933"></asp:Label>
            </td>
        </tr>
    </table>
</center>
</asp:Content>

