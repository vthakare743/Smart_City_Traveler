<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="ShareUser.aspx.cs" Inherits="user_ShareUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr  class="tbl-header">
            <td class="inner-head">
                <asp:Label ID="Label1" runat="server" Text="Mutual Package"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" 
                    Text="List of All Users Having Your Profession" Font-Bold="True" 
                    ForeColor="#339966"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 28px">
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Height="500px" ScrollBars="Both" 
                    Width="100%">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id" DataSourceID="SqlDataSource1" 
    AllowPaging="True" CellPadding="4" ForeColor="#333333" 
    GridLines="None" Width="95%" 
    onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                            SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:BoundField DataField="occupation" HeaderText="occupation" 
                            SortExpression="occupation" />
                            <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                            <asp:BoundField DataField="mobile" HeaderText="mobile" 
                            SortExpression="mobile" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <img src='photos/<%#Eval("photo") %>' width="100px" height="100px" style="border: thin solid #FFCC00" />
                                    <br />
                                    <a href='ViewProfile.aspx?id=<%#Eval("username") %>'>View</a>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                        ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                        ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" 
                        HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" 
                        ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    
                    SelectCommand="SELECT id, name, occupation, address, mobile, photo,username FROM Registration WHERE (occupation = @occupation) AND (username <> @username)">
                    <SelectParameters>
                        <asp:SessionParameter Name="occupation" SessionField="profession" 
                            Type="String" />
                        <asp:SessionParameter Name="username" SessionField="userid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

