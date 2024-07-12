<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="user_Feedback" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .Star
        {
            background-image: url(../images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(../images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(../images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
    <table style="width:100%;">
        <tr>
            <td colspan="2">
    <asp:Image ID="Image2" runat="server" Height="20px" 
           ImageUrl="~/web_img/blinking.gif" Width="36px" />
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="Large" 
                    ForeColor="#006666" Text="Feedback Form"></asp:Label>
                </td>
        </tr>
        <tr>
            <td>
                ID</td>
            <td>
                <asp:TextBox ID="txtid" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Package Name</td>
            <td>
                <asp:TextBox ID="txtpackname" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Feedback</td>
            <td>
                <asp:TextBox ID="txtDetails" runat="server" Height="91px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
          <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Large" 
                    ForeColor="#990000" Text="Rating"></asp:Label>
            </td>
            <td>
                  <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                  <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#3366CC" 
                      Text="Location"></asp:Label>
                </td>
            <td>
    <cc1:Rating ID="Rating1" AutoPostBack="true" OnChanged="OnRatingChanged" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar">
    </cc1:Rating>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#3366CC" 
                    Text="Cost"></asp:Label>
            </td>
            <td>
                <cc1:Rating ID="Rating2" runat="server" AutoPostBack="true" 
                    EmptyStarCssClass="Star" FilledStarCssClass="FilledStar" 
                    OnChanged="OnRatingChanged" StarCssClass="Star" 
                    WaitingStarCssClass="WaitingStar">
                </cc1:Rating>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="#3366CC" 
                    Text="Service"></asp:Label>
            </td>
            <td>
                <cc1:Rating ID="Rating3" runat="server" AutoPostBack="true" 
                    EmptyStarCssClass="Star" FilledStarCssClass="FilledStar" 
                    OnChanged="OnRatingChanged" StarCssClass="Star" 
                    WaitingStarCssClass="WaitingStar">
                </cc1:Rating>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Submit" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:HiddenField ID="hfusername" runat="server" />
                <asp:HiddenField ID="hfStatus" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#339933"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataGetData" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    SelectCommand="SELECT [pname], [username] FROM [Packages] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataInsert" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                    DeleteCommand="DELETE FROM [Feedback] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Feedback] ([id], [details], [username], [travel_username], [pid]) VALUES (@id, @details, @username, @travel_username, @pid)" 
                    SelectCommand="SELECT * FROM [Feedback]" 
                    UpdateCommand="UPDATE [Feedback] SET [details] = @details, [username] = @username, [travel_username] = @travel_username, [pid] = @pid WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtid" Name="id" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtDetails" Name="details" PropertyName="Text" 
                            Type="String" />
                        <asp:SessionParameter Name="username" SessionField="userid" Type="String" />
                        <asp:ControlParameter ControlID="hfusername" Name="travel_username" 
                            PropertyName="Value" Type="String" />
                        <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="details" Type="String" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="travel_username" Type="String" />
                        <asp:Parameter Name="pid" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

