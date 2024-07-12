<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="user_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>

     <asp:Image ID="Image1" runat="server" Height="20px" 
           ImageUrl="~/web_img/blinking.gif" Width="36px" />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    ForeColor="#006666" Text="Recomended Travel Package"></asp:Label>
            <br />
<hr colo="Orange" />
         <asp:Panel ID="Panel2" runat="server" Height="600px" ScrollBars="Both" 
            Width="95%">
            <asp:Repeater ID="Repeater2" runat="server" 
    DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <div align="center">
                        <div id="box">
                            <asp:Label ID="Label2" runat="server" Text= <%#Eval("pname") %> 
                        ForeColor="#339933" Font-Size="Large" Font-Bold="True"></asp:Label>
                            <div id="lay">
                                <img src='../Admin/package_photos/<%#Eval("photo") %>' width="180px" height="110px" style="border: thin solid #FFFFFF" />
                            </div>
                            <asp:Label ID="Label3" runat="server" Text="Cost Rs."></asp:Label>
                            <asp:Label ID="Label4"
                        runat="server" Text=<%#Eval("cost") %> ForeColor="#FF3300"></asp:Label>
                            <br />
                            <a href='ViewDetails.aspx?id=<%#Eval("id") %>' >View Details </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <br />
        </asp:Panel>
   
   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
           ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
           SelectCommand="">
       </asp:SqlDataSource>

    </div>

    <div id="outer">
   
   
       <asp:Image ID="Image2" runat="server" Height="20px" 
           ImageUrl="~/web_img/blinking.gif" Width="36px" />
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    ForeColor="#006666" Text="All Travel Packages"></asp:Label>
            <br />
   <br />
   
        <asp:Panel ID="Panel1" runat="server" Height="600px" ScrollBars="Both" 
            Width="95%">
            <asp:Repeater ID="Repeater1" runat="server" 
    DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div align="center">
                        <div id="box">
                            <asp:Label ID="Label2" runat="server" Text= <%#Eval("pname") %> 
                        ForeColor="#339933" Font-Size="Large" Font-Bold="True"></asp:Label>
                            <div id="lay">
                                <img src='../Admin/package_photos/<%#Eval("photo") %>' width="180px" height="110px" style="border: thin solid #FFFFFF" />
                            </div>
                            <asp:Label ID="Label3" runat="server" Text="Cost Rs."></asp:Label>
                            <asp:Label ID="Label4"
                        runat="server" Text=<%#Eval("cost") %> ForeColor="#FF3300"></asp:Label>
                            <br />
                            <a href='ViewDetails.aspx?id=<%#Eval("id") %>' >View Details </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <br />
        </asp:Panel>
   
   
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
           SelectCommand="SELECT [id], [pname], [season], [cost], [photo], [username] FROM [Packages] where status='Active'">
       </asp:SqlDataSource>
   
   
   </div>
   <hr colo="Orange" />

</asp:Content>

