<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditPackage.aspx.cs" Inherits="Admin_EditPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr class="tbl-header">
            <td class="inner-head">
                <asp:Label ID="Label1" runat="server"  Text="Update Packages Information"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="10" CellSpacing="5" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" GridLines="None" Height="50px" Width="312px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#009999" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                            SortExpression="id" />
                        <asp:BoundField DataField="pname" HeaderText="Package Name" 
                            SortExpression="pname" />
                        <asp:BoundField DataField="duration" HeaderText="Duration" 
                            SortExpression="duration" />
                        <asp:BoundField DataField="location" HeaderText="Location" 
                            SortExpression="location" />
                        <asp:BoundField DataField="details" HeaderText="Details" 
                            SortExpression="details" />
                        <asp:BoundField DataField="subpack" HeaderText="Subpack" 
                            SortExpression="subpack" />
                        <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                        <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" 
                            Visible="False" />
                        <asp:BoundField DataField="username" HeaderText="username" 
                            SortExpression="username" Visible="False" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                            ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    DeleteCommand="DELETE FROM [Packages] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Packages] ([id], [pname], [duration], [location], [details], [subpack], [cost]) VALUES (@id, @pname, @duration, @location, @details, @subpack, @cost)" 
                    SelectCommand="SELECT [id], [pname], [duration], [location], [details], [subpack], [cost] FROM [Packages] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [Packages] SET [pname] = @pname, [duration] = @duration, [location] = @location, [details] = @details, [subpack] = @subpack, [cost] = @cost WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="pname" Type="String" />
                        <asp:Parameter Name="duration" Type="String" />
                        <asp:Parameter Name="location" Type="String" />
                        <asp:Parameter Name="details" Type="String" />
                        <asp:Parameter Name="subpack" Type="String" />
                        <asp:Parameter Name="cost" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="pname" Type="String" />
                        <asp:Parameter Name="duration" Type="String" />
                        <asp:Parameter Name="location" Type="String" />
                        <asp:Parameter Name="details" Type="String" />
                        <asp:Parameter Name="subpack" Type="String" />
                        <asp:Parameter Name="cost" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

