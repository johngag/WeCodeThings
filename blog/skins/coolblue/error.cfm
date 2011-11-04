<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--- //----------------- Header for author information, css and rss -----------------// --->
  <title><mango:Blog title /> | <mango:Blog tagline /></title>
  <cfinclude template="header.cfm">
  <mango:Event name="beforeHtmlHeadEnd" />
</head>

<body>
<mango:Event name="beforeHtmlBodyStart" />
<!--- //----------------- Heading And Branding -----------------// --->
<div id="header">
	<div id="logo">
		<h1><a href="<mango:Blog basePath />"><mango:Blog title /></a></h1>
		<p><a href="<mango:Blog basePath />"><mango:Blog tagline /></a></p>
	</div>
	<div id="menu">
		<ul class="lavaLamp">
			<li><a href="<mango:Blog basePath />">Home</a></li>
			<mango:Pages><mango:Page>
			<li<mango:PageProperty ifiscurrentpage> class="current"</mango:PageProperty>><a href="<mango:PageProperty link>" title="<mango:PageProperty title />"><mango:PageProperty title /></a></li>
			</mango:Page></mango:Pages>
		</ul>
	</div>
</div>
<!-- end header -->



<!--- //----------------- Start Page Content -----------------// --->
<div id="page">
	
	<div id="content">
	
		<div class="post">
			<h1 class="title"><mango:Message title /></h1>
			
			
			<div class="entry clearFix">
				
				<mango:Message text />
				<mango:Message data />
	
			</div>
			<!-- End entry -->
		</div>
		
	</div>
	<!-- end content -->
	<!-- start sidebar -->


<!--- //----------------- Sidebar Items -----------------// --->
<div id="sidebar">
<mango:Event name="afterSideBarStart" number="1" />
<template:sidebar />
<mango:Event name="beforeSideBarEnd" number="1" />	
</div><!--End Sidebar-->
	
	
</div>
<!-- end page -->


<!--- //----------------- Footer Content -----------------// --->
<cfinclude template="footer.cfm">
<mango:Event name="beforeHtmlBodyEnd" />

</body>
</html>
