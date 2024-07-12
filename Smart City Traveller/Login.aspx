<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!doctype html>

<head>

	<!-- Basics -->
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<title>Login</title>

	<!-- CSS -->
	
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/animate.css" />
	<link rel="stylesheet" href="css/styles_x.css" />
	
</head>

	<!-- Main HTML -->
	
<body>

    <form id="form1" runat="server">

	<!-- Begin Page Content -->
	
	<div id="container">
		
		<form>
    <asp:Label ID="Label1" runat="server" Text="Login Panel" Font-Bold="True" 
            Font-Names="Pristina" Font-Size="XX-Large" ForeColor="#9900CC"></asp:Label>
		<br />
		<label for="name">Username:</label>
		
		<input type="name" name="txtuser">
		
		<label for="username">Password:</label>
		
		<p>&nbsp;<input type="password" name="txtpwd">
		
		<div id="lower">
		
		<label class="check" for="checkbox"><a href="ForgotPwd.aspx?utype=user">Forgot Password</a></label>
		
    <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="btnLogin_Click" />
		</div>
		
		</form>
		
	</div>
	
	
	<!-- End Page Content -->
    <div>
    <asp:HiddenField ID="hfUser" runat="server" />
            <asp:HiddenField ID="hfPwd" runat="server" />
            <asp:SqlDataSource ID="SqlDataLogin" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TRAVEL_RECConnectionString %>" 
                SelectCommand="SELECT [username], [pwd],[occupation],interest_status FROM [Registration] WHERE (([username] = @username) AND ([pwd] = @pwd))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfUser" Name="username" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hfPwd" Name="pwd" PropertyName="Value" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    </div>

	</form>
</body>

</html>
	
	
	
	
	
		
	