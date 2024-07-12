<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="Book.aspx.cs" Inherits="user_Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td colspan="2" class="inner-head">
                <asp:Label ID="Label2" runat="server"  Text="Booking "></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 157px">
                Select Booking Date</td>
            <td>
                <asp:TextBox ID="txtBookDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtBookDate" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Please Select Booking Date</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 157px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    ForeColor="#006666" Text="Payment Mode"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                Select Bank Name</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Select Bank</asp:ListItem>
                    <asp:ListItem>State Bank of India</asp:ListItem>
                    <asp:ListItem>Bank of India</asp:ListItem>
                    <asp:ListItem>Bank of Maharashtra</asp:ListItem>
                    <asp:ListItem>Bank of Badoda</asp:ListItem>
                    <asp:ListItem>Axis Bank</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                Select Card Type</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>Select Card Type</asp:ListItem>
                    <asp:ListItem>Master card</asp:ListItem>
                    <asp:ListItem>Mastrov</asp:ListItem>
                    <asp:ListItem>Visa</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                Enter Card Number</td>
            <td>
                <asp:TextBox ID="txtcardno" runat="server" Width="300px" MaxLength="14"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtcardno" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Enter the card number</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtcardno" Display="Dynamic" 
                    ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" 
                    ValidationExpression="\d{14}">Must be 14 DigitNumber</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                Enter CVV Code</td>
            <td>
                <asp:TextBox ID="txtcvv" runat="server" Width="141px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtcvv" Display="Dynamic" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" 
                    SetFocusOnError="True">Enter the CVV Code</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 157px">
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="btnSubmit" runat="server" 
                    ImageUrl="~/web_img/pay_now.png" onclick="btnSubmit_Click" Height="33px" 
                    Width="91px" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    DeleteCommand="DELETE FROM [Booking] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Booking] ([username], [pid]) VALUES (@username, @pid)" 
                    SelectCommand="SELECT * FROM [Booking]" 
                    UpdateCommand="UPDATE [Booking] SET [username] = @username, [pid] = @pid WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="username" SessionField="userid" Type="String" />
                        <asp:QueryStringParameter Name="pid" QueryStringField="pid" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="pid" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 157px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

