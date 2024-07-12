<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ShowFeedback.aspx.cs" Inherits="Admin_ShowFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
    <tr class="tbl-header">
        <td class="inner-head">
            <asp:Label ID="Label1" runat="server"  Text="Show Feedback"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="gender" HeaderText="gender" 
                        SortExpression="gender" />
                    <asp:BoundField DataField="mobile" HeaderText="mobile" 
                        SortExpression="mobile" />
                    <asp:BoundField DataField="details" HeaderText="details" 
                        SortExpression="details" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                SelectCommand="SELECT Registration.name, Registration.gender, Registration.mobile, Feedback.details FROM Feedback INNER JOIN Registration ON Feedback.username = Registration.username WHERE (Feedback.travel_username = @username)">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="userid" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td>
                &nbsp;</td>
    </tr>
</table>
</asp:Content>

