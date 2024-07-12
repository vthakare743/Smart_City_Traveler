<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="BookedPackageList.aspx.cs" Inherits="user_BookedPackageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td class="inner-head">
                <asp:Label ID="Label6" runat="server" Text="Booked Pakage List"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataBookedList" 
                    ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                            SortExpression="id" />
                        <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
                        <asp:BoundField DataField="season" HeaderText="season" 
                            SortExpression="season" />
                        <asp:BoundField DataField="duration" HeaderText="duration" 
                            SortExpression="duration" />
                        <asp:BoundField DataField="cost" HeaderText="cost" SortExpression="cost" />
                        <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" 
                            Visible="False" />

                          <asp:TemplateField>
                            <ItemTemplate>
                                <img src="../Admin/package_photos/<%#Eval("photo") %>" width="100px" height="100px" style="border: thin solid #FFCC00" />
                                <br />
                                <a href="ViewBookedDetails.aspx?id=<%#Eval("id") %>" >View Details</a>
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
                <asp:SqlDataSource ID="SqlDataBookedList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    SelectCommand="SELECT Packages.id, Packages.pname, Packages.season, Packages.duration, Packages.cost, Packages.photo FROM Packages INNER JOIN Booking ON Packages.id = Booking.pid INNER JOIN Registration ON Booking.username = Registration.username WHERE (Booking.username = @username)">
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
    </table>
</asp:Content>

