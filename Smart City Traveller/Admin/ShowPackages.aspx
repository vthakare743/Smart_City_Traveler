<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ShowPackages.aspx.cs" Inherits="Admin_ShowPackages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td class="inner-head">
                <asp:Label ID="Label1" runat="server"  Text="Packages List"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                    DataSourceID="SqlDataGetData" ForeColor="#333333" GridLines="None" 
                    Width="100%" onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" 
                            SortExpression="id" />
                        <asp:BoundField DataField="pname" HeaderText="Package Name" 
                            SortExpression="pname" />
                        <asp:BoundField DataField="duration" HeaderText="Duration" 
                            SortExpression="duration" />
                        <asp:BoundField DataField="location" HeaderText="Location" 
                            SortExpression="location" />
                        <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                        

                        <asp:TemplateField>
                            <ItemTemplate>
                                <img src='package_photos/<%#Eval("photo") %>' width="100px" height="100px" style="border: thin solid #FFCC00" />
                                <br />
                                <a href="PackageDetails.aspx?id=<%#Eval("id") %>" >View Details</a>
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
                    
                    
                    SelectCommand="SELECT [id], [pname], [location], [duration], [cost], [photo] FROM [Packages] WHERE [username] = @username and status='Active'" 
                    DeleteCommand="DELETE FROM [Packages] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Packages] ([id], [pname], [location], [duration], [cost], [photo]) VALUES (@id, @pname, @location, @duration, @cost, @photo)" 
                    
                    UpdateCommand="UPDATE [Packages] SET [pname] = @pname, [location] = @location, [duration] = @duration, [cost] = @cost, [photo] = @photo WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="pname" Type="String" />
                        <asp:Parameter Name="location" Type="String" />
                        <asp:Parameter Name="duration" Type="Int32" />
                        <asp:Parameter Name="cost" Type="Int32" />
                        <asp:Parameter Name="photo" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="username" SessionField="userid" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="pname" Type="String" />
                        <asp:Parameter Name="location" Type="String" />
                        <asp:Parameter Name="duration" Type="Int32" />
                        <asp:Parameter Name="cost" Type="Int32" />
                        <asp:Parameter Name="photo" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
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

