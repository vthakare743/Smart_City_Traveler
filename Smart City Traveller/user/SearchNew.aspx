<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="SearchNew.aspx.cs" Inherits="user_SearchNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td colspan="4" class="inner-head">
                <asp:Image ID="Image2" runat="server" Height="20px" 
           ImageUrl="~/web_img/blinking.gif" Width="36px" />
                <asp:Label ID="Label1" runat="server"  Text="Search By Cocktail Approch"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#3366CC" 
                    Text="Location"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#3366CC" 
                    Text="Cost"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#3366CC" 
                    Text="Season"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="#3366CC" 
                    Text="Days"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
            </td>
            <td>
                Min
                <asp:TextBox ID="txtMinCost" runat="server" Width="40px"></asp:TextBox>
            </td>
            <td>
                <asp:DropDownList ID="ddlSeason" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Winter</asp:ListItem>
                    <asp:ListItem>Summer</asp:ListItem>
                    <asp:ListItem>Spring</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                Min
                <asp:TextBox ID="txtMinDay" runat="server" Width="40px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                Max<asp:TextBox ID="txtMaxCost" runat="server" Width="40px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                Max<asp:TextBox ID="txtMaxDay" runat="server" Width="40px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="txtSearch" runat="server" onclick="txtSearch_Click" 
                    Text="Search" class="btn-style hvr-shrink" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Panel ID="Panel1" runat="server" Height="500px" ScrollBars="Both" 
                            Width="95%">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataGetData" 
                        ForeColor="#333333" GridLines="None" Width="95%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                                SortExpression="id" Visible="False" />
                            <asp:BoundField DataField="pname" HeaderText="Package" SortExpression="pname" />
                            <asp:BoundField DataField="season" HeaderText="Season" 
                                SortExpression="season" />
                            <asp:BoundField DataField="theme" HeaderText="Theme" SortExpression="theme" />
                            <asp:BoundField DataField="duration" HeaderText="Duration" 
                                SortExpression="duration" />
                            <asp:BoundField DataField="location" HeaderText="Location" 
                                SortExpression="location" />
                            <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                            <asp:BoundField DataField="username" HeaderText="username" 
                                SortExpression="username" Visible="False" />
                                   <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='ViewDetails.aspx?id=<%#Eval("id") %>' >View </a>
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
                        SelectCommand="">
                    </asp:SqlDataSource>
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
           
            
                    SelectCommand="SELECT [id], [pname], [duration], [location], [cost], [photo], [username] FROM [Packages] ORDER BY [cost]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

