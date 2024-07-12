<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="user_ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr class="tbl-header">
            <td colspan="2" class="inner-head">
                <asp:Label ID="Label1" runat="server"
                Text="Change Password"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Old Password</td>
            <td>
                <asp:TextBox ID="txtOld" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtOld" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                New Password</td>
            <td>
                <asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtNew" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Confirm</td>
            <td>
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtConfirm" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtNew" ControlToValidate="txtConfirm" 
                    ErrorMessage="CompareValidator">Not Matching</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnChange" runat="server" onclick="btnChange_Click" 
                    Text="Change Password" class="btn-style hvr-shrink" />
            </td>
        </tr>
    </table>
    <hr color="orange" />
    <asp:Label ID="lblmsg" runat="server" Font-Names="Courier New" ForeColor="Red"></asp:Label>
    <asp:SqlDataSource ID="sqlpwd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
        DeleteCommand="DELETE FROM [Registration] WHERE [username] = @UserID" 
        InsertCommand="INSERT INTO [Registration] ([username], [Pwd]) VALUES (@UserID, @Pwd)" 
        SelectCommand="SELECT [username], [Pwd] FROM [Registration]" 
        UpdateCommand="UPDATE [Registration] SET [Pwd] = @Pwd WHERE [username] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtNew" Name="Pwd" PropertyName="Text" 
                Type="String" />
            <asp:SessionParameter Name="UserID" SessionField="userid" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" Type="String" />
            <asp:Parameter Name="Pwd" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    </asp:Content>

