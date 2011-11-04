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
	
	
	<mango:Post>
		<div class="post">
			<h1 class="title"><a href="<mango:PostProperty link />"><mango:PostProperty title /></a></h1>
			<p class=" byline fl">Posted by <mango:PostProperty author /> on <mango:PostProperty date dateformat="mmmm dd, yyyy" /></p>
			<p class=" byline fr"><a href="<mango:PostProperty link />#comments" class="comments"><mango:PostProperty commentCount /> comments</a></p>
			
			<div class="entry clearFix">
				<mango:PostProperty body />
				<mango:Event name="beforePostContentEnd" />
				
				<!--- //----------------- Comments Section -----------------// --->
<mango:PostProperty ifcommentsallowed>
  <h3 id="comments">Comments</h3>


<!--- //----------------- Errors -----------------// ---> 
 <mango:Message ifMessageExists type="comment" status="error">
		<p class="error">There was a problem: <mango:Message text /></p>
</mango:Message>
<mango:Message ifMessageExists type="comment" status="success">
		<p class="succss"><mango:Message text /></p>
</mango:Message> 

  
<mango:Comments>
<mango:Comment><a name="comment-<mango:CommentProperty id />"></a>
	<div class="commentblock<mango:CommentProperty ifIsAuthor> highlighted</mango:CommentProperty>">
	<a <mango:CommentProperty ifhasurl>href="<mango:CommentProperty url />"</mango:CommentProperty> class="thumb"><mangox:Gravatar size="40" defaultimg="assets/images/no_gravatar.gif" class="fl" /></a>
				
	<p><mango:CommentProperty ifhasurl><a href="<mango:CommentProperty url />"></mango:CommentProperty><mango:CommentProperty name /><mango:CommentProperty ifhasurl></a></mango:CommentProperty> wrote on <a href="#comment-<mango:CommentProperty id />"><mango:CommentProperty date dateformat="mm/dd/yy" /> <mango:CommentProperty time /></a></p>
	 
	 <mango:CommentProperty content />
</mango:Comment>
	</div>
</mango:Comments>
	
		



	<h2 id="respond">Leave a comment</h2>
	<mango:Message ifMessageExists type="comment" status="error">
		<p class="error">There was a problem: <mango:Message text /></p>
	</mango:Message>
	<mango:Message ifMessageExists type="comment" status="success">
		<p class="message"><mango:Message text /></p>
	</mango:Message>
	
	
	
	<form action="#respond" method="post" id="commentform">
	<input type="hidden" name="action" value="addComment" />
	<input type="hidden" name="comment_post_id" value="<mango:PostProperty id />" />
	<input type="hidden" name="comment_parent" value="" />
		<fieldset id="personalinfo">
		<legend><span>Tell us about yourself</span></legend>
			<div><label for="author">Your Name</label><input type="text" name="comment_name" id="author" class="required_Field" value="<mango:RequestVar name="comment_name" />" /> (required field)</div>
			<div><label for="email">Your Email Address</label><input type="text" name="comment_email" id="email" class="required_Field" value="<mango:RequestVar name="comment_email" />" /> (required field)</div>
			<div><label for="url">Website URL</label><input type="text" name="comment_website" id="url" value="<mango:RequestVar name="comment_website" />" /></div>
		</fieldset>
		<fieldset>
		<legend id="comPrefs"><span>Comment and preferences</span></legend>
			<div><label for="comment">Your Comment</label><textarea name="comment_content" id="comment" cols="62" rows="10" ><mango:RequestVar name="comment_content" /></textarea></div>
			<div><input type="checkbox" id="subscribe" name="comment_subscribe" value="1" /><label for="subscribe">Subscribe to this comment thread</label></div>
			<div><mango:Event name="beforeCommentFormEnd" /></div>
		</fieldset>
		<div><button type="submit" id="submit-go">Submit</button></div>
	</form>

</mango:PostProperty>

			</div>
			<!-- End entry -->
		</div>
		
	</mango:Post>
	

		
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
