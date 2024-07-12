<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="user_ViewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td class="inner-head">
                <asp:Label ID="Label1" runat="server" Text="Travel History"></asp:Label>
            </td>
        </tr>
        <tr valign="top">
            <td style="height: 592px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                    GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="pname" HeaderText="Package" SortExpression="pname" />
                        <asp:BoundField DataField="season" HeaderText="Season" 
                            SortExpression="season" />
                        <asp:BoundField DataField="theme" HeaderText="Theme" SortExpression="theme" />
                        <asp:BoundField DataField="duration" HeaderText="Duration" 
                            SortExpression="duration" />
                        <asp:BoundField DataField="location" HeaderText="Location" 
                            SortExpression="location" />
                        <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                        <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" 
                            Visible="False" />
                          <asp:TemplateField>
                                <ItemTemplate>
                                    <img src='../Admin/package_photos/<%#Eval("photo") %>' width="100px" height="100px" style="border: thin solid #FFCC00" />
                                <br />
                                <a href='PackageDetails.aspx?id=<%#Eval("id") %>' >More Details</a>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    
                    SelectCommand="SELECT Packages.id,Packages.pname, Packages.season, Packages.theme, Packages.duration, Packages.location, Packages.cost, Packages.photo FROM Booking INNER JOIN Packages ON Booking.pid = Packages.id WHERE (Booking.username = @username)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="username" QueryStringField="id" />
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

