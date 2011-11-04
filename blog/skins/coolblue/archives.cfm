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
	<mango:Archive pageSize="3">
	<mango:ArchiveProperty ifIsType="category"><h3>Entries Tagged as '<mango:ArchiveProperty title />'</h3></mango:ArchiveProperty>
	<mango:ArchiveProperty ifIsType="month"><h3>Entries for month: <mango:ArchiveProperty title dateformat="mmmm yyyy"  /></h3></mango:ArchiveProperty>
	<mango:ArchiveProperty ifIsType="day"><h3>Entries for day: <mango:ArchiveProperty title dateformat="dd mmmm yyyy" /></h3></mango:ArchiveProperty>
	<mango:ArchiveProperty ifIsType="year"><h3>Entries for year: <mango:ArchiveProperty title dateformat="yyyy" /></h3></mango:ArchiveProperty>
	<mango:ArchiveProperty ifIsType="search"><h3>Search Results for <mango:ArchiveProperty title /></h3></mango:ArchiveProperty>
	<mango:ArchiveProperty ifIsType="author"><h3>Entries by '<mango:ArchiveProperty title />'</h3></mango:ArchiveProperty>
	<mango:ArchiveProperty ifIsType="unknown"><h3>No archives</h3></mango:ArchiveProperty>
	
	<mango:Posts count="3">
	<mango:Post>
		<div class="post">
			<h1 class="title"><a href="<mango:PostProperty link />"><mango:PostProperty title /></a></h1>
			<p class=" byline fl">Posted by <mango:PostProperty author /> on <mango:PostProperty date dateformat="mmmm dd, yyyy" /></p>
			<p class=" byline fr"><a href="<mango:PostProperty link />#comments" class="comments"><mango:PostProperty commentCount /> comments</a></p>
			
			<div class="entry clearFix">
				<mango:PostProperty ifhasExcerpt excerpt>
				<p><a href="<mango:PostProperty link />" class="more">Read more...</a></p>
				</mango:PostProperty>
				<mango:PostProperty ifnothasExcerpt body />
			</div>
			<!-- End entry -->
		</div>
		
	</mango:Post>
	</mango:Posts>

		<mango:Archive pageSize="3"><mango:ArchiveProperty ifHasNextPage>
		<div id="nextN">
		<mango:ArchiveProperty ifHasNextPage><span class="fl"><a href="<mango:ArchiveProperty link pageDifference="1" />" class="older">Older Topics</a></span></mango:ArchiveProperty>
		<mango:ArchiveProperty ifHasPreviousPage><span class="fr"><a href="<mango:ArchiveProperty link pageDifference="-1" />" class="newer">Newer Topics</a></span></mango:ArchiveProperty>
		</div><!--End prevNext-->
		</mango:ArchiveProperty></mango:Archive>
		<!-- End nextN -->
		
	</mango:Archive>
	
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
