<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head profile="http://gmpg.org/xfn/11">
<mango:Post>
	<title><mango:PostProperty title /> &raquo; <mango:Blog title /></title>
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
	  <mango:Pages><mango:Page>
		<li class="page_item"><a href="<mango:PageProperty link>" title="<mango:PageProperty title />"><mango:PageProperty title /></a></li></mango:Page></mango:Pages>
	</ul>
  </div>
  <!--/header -->
  <div id="content">
	<div class="post" id="post-<mango:PostProperty id />">
	<div class="post-date"><span class="post-month"><mango:PostProperty date dateformat="mmm" /></span> <span class="post-day"><mango:PostProperty date dateformat="d" /></span></div>
	<div class="post-title">
	  <h2><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent Link to <mango:PostProperty title />"><mango:PostProperty title /></a></h2>
			<span class="post-cat"><mango:Categories><mango:Category><a href="<mango:CategoryProperty link />" title="View all posts in  <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a> <mango:Category ifCurrentIsNotLast>, </mango:Category></mango:Category></mango:Categories></span> <mango:PostProperty ifcommentsallowed> <span class="mini-add-comment"><a href="#respond">Add comments</a></span></mango:PostProperty>
	</div>
	<div class="entry">
		<mango:PostProperty body />
		<div class="entry-footer"><mango:Event name="beforePostContentEnd" /></div>
	</div>
	
<!-- You can start editing here. -->
<mango:PostProperty ifNotcommentsallowed ifCommentCountGT="0">
	<h3 id="comments"><mango:PostProperty commentCount /> response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty><mango:PostProperty ifCommentCountLT="1">s</mango:PostProperty> to &#8220;<mango:PostProperty title />&#8221;</h3> 
	<ol class="commentlist">
		<mango:Comments>
			<mango:Comment>
			<li class="<mango:CommentProperty ifCurrentIsOdd>alt</mango:CommentProperty>" id="comment-<mango:CommentProperty id />">
			<cite><mango:CommentProperty ifhasurl><a href='<mango:CommentProperty url />' rel='external nofollow'></mango:CommentProperty><mango:CommentProperty name /><mango:CommentProperty ifhasurl></a></mango:CommentProperty></cite> Says:
			<br />
			<small class="commentmetadata"><a href="#comment-<mango:CommentProperty id />" title=""><mango:CommentProperty date dateformat="mmm d, yyyy" /> at <mango:CommentProperty time /></a> </small>
			<mango:CommentProperty content />
			</li>
			</mango:Comment>
		</mango:Comments>
</ol>
<p>Comments now closed</p>
</mango:PostProperty>
<mango:PostProperty ifcommentsallowed>
	
<!-- You can start editing here. -->
	<h3 id="comments"><mango:PostProperty commentCount /> response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty><mango:PostProperty ifCommentCountLT="1">s</mango:PostProperty> to &#8220;<mango:PostProperty title />&#8221;</h3> 
	<ol class="commentlist">
		<mango:Comments>
			<mango:Comment>
			<li class="<mango:CommentProperty ifCurrentIsOdd>alt</mango:CommentProperty>" id="comment-<mango:CommentProperty id />">
			<cite><mango:CommentProperty ifhasurl><a href='<mango:CommentProperty url />' rel='external nofollow'></mango:CommentProperty><mango:CommentProperty name /><mango:CommentProperty ifhasurl></a></mango:CommentProperty></cite> Says:
			<br />
			<small class="commentmetadata"><a href="#comment-<mango:CommentProperty id />" title=""><mango:CommentProperty date dateformat="mmm d, yyyy" /> at <mango:CommentProperty time /></a> </small>
			<mango:CommentProperty content />
			</li>
			</mango:Comment>
		</mango:Comments>
</ol>

	<h3 id="respond">Leave a Reply</h3>
	<mango:Message ifMessageExists type="comment" status="error">
		<p class="error">There was a problem: <mango:Message text /></p>
	</mango:Message>
	<mango:Message ifMessageExists type="comment" status="success">
		<p class="message"><mango:Message text /></p>
	</mango:Message>
	
	<form method="post" action="#respond" id="commentform">
		<input type="hidden" name="action" value="addComment" />
		<input type="hidden" name="comment_post_id" value="<mango:PostProperty id />" />
		<input type="hidden" name="comment_parent" value="" />
		<p><input type="text" name="comment_name" id="author" value="<mango:RequestVar name="comment_name" />" size="22" />
<label for="author"><strong>Name</strong> (required)</label></p>
		<p><input type="text" name="comment_email" id="email" value="<mango:RequestVar name="comment_email" />" size="22" />
<label for="email"><strong>Mail</strong> (will not be published) (required)</label></p>
		<p><input type="text" name="comment_website" id="url" value="<mango:RequestVar name="comment_website" />" size="22"  />
<label for="url"><strong>Website</strong></label></p>
		<p><textarea name="comment_content" id="comment" cols="100%" rows="10" ><mango:RequestVar name="comment_content" /></textarea></p>
		<p><input type="checkbox" id="subscribe" name="comment_subscribe" value="1" /> <label for="subscribe">Subscribe to this comment thread</label></p>
		<p><mango:Event name="beforeCommentFormEnd" /></p>
		<p><input name="submit" type="submit" id="submit" value="Submit Comment" />
</p>
</form>
</mango:PostProperty>			
	</div><!--/post -->
  </div><!--/content -->
<div id="sidebar">
<ul><mango:Event name="afterSideBarStart" number="1" />
	<ul><template:sidebar /></ul>
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
		<mango:Author>
		<h4>About <mango:AuthorProperty name /></h4>
		<p><mango:AuthorProperty shortdescription descriptionParagraphFormat />
				<a href="<mango:AuthorProperty link />">More ...</a></p>
		</mango:Author>
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
</mango:Post>
<!--credits end -->
<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>
