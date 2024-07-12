<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script type="text/javascript">
    function DisableBack() {
        window.history.forward();
    }
    DisableBack();

    window.onload = DisableBack;

    window.onpageshow = function (evt) {
        if (evt.persisted) DisableBack();
    }
    window.onunload = function () { void (0); }

    </script>

<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Travel</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="css/hover.css" />
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="jquery.slidertron-1.1.js"></script>
<script type="text/javascript">
    $(function () {
        $('#menu > ul').dropotron({
            mode: 'fade',
            globalOffsetY: 11,
            offsetY: -15
        });
        $('#slider').slidertron({
            viewerSelector: '.viewer',
            indicatorSelector: '.indicator span',
            reelSelector: '.reel',
            slidesSelector: '.slide',
            speed: 'slow',
            advanceDelay: 4000
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h3><a href="#" style="font-size: xx-large">Smart City Traveller</a></h3>
		</div>
		<div id="slogan">
			<h2>
              </h2>
		</div>
	</div>
	<div id="menu">
		<ul>
			<li>

			<a href="Default.aspx">Home</a>
			
			</li>
			<li><a href="AboutUs.aspx">About us</a></li>
			
			<li>
				<span class="opener">Registration<b></b></span>
				<ul>
					<li><a href="Registration.aspx">User</a></li>
					<li><a href="Admin_Reg.aspx">Travel Admin</a></li>
					
				
				</ul>
			</li>
            <li>
				<span class="opener">Login<b></b></span>
				<ul>
					<li><a href="Login.aspx">User</a></li>
					<li><a href="AdminLogin.aspx">Travel Admin</a></li>
                    <li><a href="MainAdmin.aspx">Main Admin</a></li>
					
				
				</ul>
			</li>
			
            
		</ul>
		<br class="clearfix" />
	</div>
	   <div id="slider">
		<div class="viewer">
			<div class="reel">
				<div class="slide">
					<img src="images/slide01.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide02.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide03.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide04.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide05.jpg" alt="" />
				</div>
			</div>
		</div>
		<div class="indicator">
			<span>1</span>
			<span>2</span>
			<span>3</span>
			<span>4</span>
			<span>5</span>
		</div>
	</div>
	<div id="page">
   
	    <div id="mid">
        
        
       Welcome to project
        
        
            
            </div>
    </div>
	<div id="page-bottom">
		<br class="clearfix" />
	</div>
</div>
<div id="footer">
	Copyright (c) All rights reserved.
</div>
    </form>
</body>
</html>