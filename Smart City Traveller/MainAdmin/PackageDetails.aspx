<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin/MainAdminMasterPage.master" AutoEventWireup="true" CodeFile="PackageDetails.aspx.cs" Inherits="MainAdmin_PackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td class="inner-head">
                <asp:Label ID="Label1" runat="server"  Text="Packages Details"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" GridLines="None" Height="309px" Width="274px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="pname" HeaderText="Package Name" 
                            SortExpression="pname" />
                        <asp:BoundField DataField="season" HeaderText="Season" 
                            SortExpression="season" />
                        <asp:BoundField DataField="theme" HeaderText="Theme" SortExpression="theme" />
                        <asp:BoundField DataField="duration" HeaderText="Duration" 
                            SortExpression="duration" />
                        <asp:BoundField DataField="location" HeaderText="Location" 
                            SortExpression="location" />
                        <asp:BoundField DataField="details" HeaderText="Details" 
                            SortExpression="details" />
                        <asp:BoundField DataField="subpack" HeaderText="Subpack" 
                            SortExpression="subpack" />
                        <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                            SortExpression="id" />
                              <asp:BoundField DataField="username" HeaderText="Agency" ReadOnly="True" 
                            SortExpression="username" />

                        <asp:CommandField ShowEditButton="True" />
                       
                        
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    DeleteCommand="DELETE FROM [Packages] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Packages] ([pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [id]) VALUES (@pname, @season, @theme, @duration, @location, @details, @subpack, @cost, @id)" 
                    SelectCommand="SELECT [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [id],username FROM [Packages] WHERE ([id] = @id)" 
                    
                    UpdateCommand="UPDATE [Packages] SET [pname] = @pname, [season] = @season, [theme] = @theme, [duration] = @duration, [location] = @location, [details] = @details, [subpack] = @subpack, [cost] = @cost WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="pname" Type="String" />
                        <asp:Parameter Name="season" Type="String" />
                        <asp:Parameter Name="theme" Type="String" />
                        <asp:Parameter Name="duration" Type="Int32" />
                        <asp:Parameter Name="location" Type="String" />
                        <asp:Parameter Name="details" Type="String" />
                        <asp:Parameter Name="subpack" Type="String" />
                        <asp:Parameter Name="cost" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="pname" Type="String" />
                        <asp:Parameter Name="season" Type="String" />
                        <asp:Parameter Name="theme" Type="String" />
                        <asp:Parameter Name="duration" Type="Int32" />
                        <asp:Parameter Name="location" Type="String" />
                        <asp:Parameter Name="details" Type="String" />
                        <asp:Parameter Name="subpack" Type="String" />
                        <asp:Parameter Name="cost" Type="Int32" />
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
                <asp:Button ID="btnDelete" runat="server" onclick="btnDelete_Click" 
                    Text="Delete" class="btn-style hvr-shrink"/>
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

