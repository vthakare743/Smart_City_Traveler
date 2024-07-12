<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainAdmin.aspx.cs" Inherits="MainAdmin" %>

<!doctype html>

<head>

	<!-- Basics -->
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<script>
    function validateForm() {
        var x = document.forms["myForm"]["txtuser"].value;
        if (x == null || x == "") {
            alert("Name must be filled out");
            return false;
        }
    }
</script>

	<title>Login</title>

	<!-- CSS -->
	
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/animate.css" />
	<link rel="stylesheet" href="css/styles_x.css" />
	
</head>

	<!-- Main HTML -->
	
<body>

    <form id="form1" runat="server" name="myForm" onsubmit="return validateForm()">

	<!-- Begin Page Content -->
	
	<div id="container">
		
		<form>
    <asp:Label ID="Label1" runat="server" Text="Main Admin Login" Font-Bold="True" 
            Font-Names="Pristina" Font-Size="XX-Large" ForeColor="#9900CC"></asp:Label>
		<br />
		<label for="name">Username:</label>
		
		<input type="name" name="txtuser">
		
		<label for="username">Password:</label>
		
		<p>&nbsp;<input type="password" name="txtpwd">
		
		<div id="lower">
		
		<%--<input type="checkbox"><label class="check" for="checkbox">Keep me logged in</label>&nbsp;--%>
        
		
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
                SelectCommand="SELECT [username], [pwd] FROM [AdminReg] WHERE (([username] = @username) AND ([pwd] = @pwd))">
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
	
