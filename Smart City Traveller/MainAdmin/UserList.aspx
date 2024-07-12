<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin/MainAdminMasterPage.master" AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="MainAdmin_UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td class="inner-head">
                <asp:Image ID="Image2" runat="server" Height="20px" 
           ImageUrl="~/web_img/blinking.gif" Width="36px" />
                <asp:Label ID="Label1" runat="server"  Text="User List"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Height="500px" ScrollBars="Both" 
                            Width="95%">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataGetData" 
                        ForeColor="#333333" GridLines="None" Width="95%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" 
                                SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="occupation" HeaderText="Occupation" 
                                SortExpression="occupation" />
                            <asp:BoundField DataField="mobile" HeaderText="Mobile" 
                                SortExpression="mobile" />
                            <asp:BoundField DataField="photo" HeaderText="photo" 
                                SortExpression="photo" Visible="False" />

                                 <asp:TemplateField HeaderText="Photo">
                            <ItemTemplate>
                                <img src="../user/photos/<%#Eval("photo") %>" width="100px" height="100px" style="border: thin solid #FFCC00" />
                                
                                
                            </ItemTemplate>

                        </asp:TemplateField>

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
                    <asp:SqlDataSource ID="SqlDataGetData" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                        
                        SelectCommand="SELECT [id], [name], [occupation], [mobile], [photo] FROM [Registration]">
                    </asp:SqlDataSource>
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
           
            
                    SelectCommand="SELECT [id], [pname], [duration], [location], [cost], [photo], [username] FROM [Packages] ORDER BY [cost]">
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
    </table>
</asp:Content>

