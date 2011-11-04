<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head profile="http://gmpg.org/xfn/11">
<mango:Author>
	<title><mango:Blog title /> &raquo;  <mango:AuthorProperty name /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
	<meta name="generator" content="Mango <mango:Blog version />" />
	<meta name="description" content="<mango:Blog description />" />
	<meta name="robots" content="index, follow" />

	<link rel="alternate" type="application/atom+xml" title="Atom" href="<mango:Blog atomurl />" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<mango:Blog rssurl />" />	
	<link rel="EditURI" type="application/rsd+xml" title="RSD" href="<mango:Blog apiurl />" />
	<link rel="stylesheet" type="text/css" href="<mango:Blog skinurl />assets/styles/main.css"  media="all" />
	<link rel="stylesheet" type="text/css" href="<mango:Blog skinurl />assets/styles/print.css" media="print" />
	<link rel="stylesheet" type="text/css" href="<mango:Blog skinurl />assets/styles/custom.css"  media="all" />
	<mango:Event name="beforeHtmlHeadEnd" />
</head>
<body><mango:Event name="beforeHtmlBodyStart" />
<div id="page">
  <div id="header">
    <div id="headerimg">
	  <h1><a href="<mango:Blog basePath />"><mango:Blog title /></a></h1>
	  <div class="description"><mango:Blog tagline /></div>
	</div>

	<ul id="nav">
	  <li class="page_item"><a href="<mango:Blog basePath />" title="Home">Home</a></li>
	  <mango:Pages  parentPage=""><mango:Page>
		<li class="page_item"><a href="<mango:PageProperty link>" title="<mango:PageProperty title />"><mango:PageProperty title /></a></li></mango:Page></mango:Pages>
	</ul>
  </div>
  <!--/header -->
   <div id="content">
	<div class="post">
			<h2>About <mango:AuthorProperty name /></h2>
	        <div class="post-content"><mango:AuthorProperty description />
			</div>
  			
	</div><!--/post -->
  </div><!--/content -->
<div id="sidebar">
<ul><mango:Event name="afterSideBarStart" number="1" />
	<template:sidebar />
	<mango:Event name="beforeSideBarEnd" number="1" />
 </ul>
</div>
<!--/sidebar -->  
  <div id="footer">

  <!--recent comments start -->
   <div class="footer-recent-posts">
    <h4>Recent Posts</h4>
	<ul><mango:Posts count="5">
	<mango:Post>
		<li><strong><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to <mango:PostProperty title />"><mango:PostProperty title /></a></strong><br />
	<small><mango:PostProperty date dateformat="m-d-yyyy" /></small>
	</li>
	</mango:Post>
	</mango:Posts>
	</ul>
  </div>
  <!--recent comments start -->

  <!--recent comments start -->
  <div class="footer-recent-comments">
  <h4>Recent Comments</h4>
<ul>
	<mango:Comments recent count="4">
		<mango:Comment>
	<li><strong><a href="<mango:CommentProperty entryLink />#comment-<mango:CommentProperty id />" title="on <mango:CommentProperty entryTitle />"><mango:CommentProperty name /></a></strong>: <mango:CommentProperty excerptChars="80" /></li>
	</mango:Comment>
	</mango:Comments>
</ul></div>
  <!--recent comments end -->
  
	<!--about text start -->
	<div class="footer-about">
		<h4>About</h4>
		<p><mango:Blog description descriptionParagraphFormat /></p>
	</div>
	<!--about text end -->
	
  <hr class="clear" />
  </div><!--/footer -->
</div><!--/page -->

<!--credits start -->
<div id="credits"><mango:Event name="afterFooterStart" />
<div class="alignleft">Powered by <a href="http://www.mangoblog.org" title="Mango Blog - A ColdFusion blog engine">Mango Blog</a>. Design and <a href="http://www.ndesign-studio.com/stock-icons/">Icons</a> by <a href="http://www.ndesign-studio.com">N.Design Studio</a>
<mango:Event name="beforeFooterEnd" />
</div>
</mango:Author>
<!--credits end -->
<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>
