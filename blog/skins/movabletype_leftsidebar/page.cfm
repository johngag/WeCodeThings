<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" id="sixapart-standard">
<head>
<mango:Page>
<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
   <meta name="generator" content="Mango <mango:Blog version />" />
   
   <link rel="stylesheet" href="<mango:Blog skinurl />assets/styles/styles-site.css" type="text/css" />
   <link rel="alternate" type="application/atom+xml" title="Atom" href="<mango:Blog atomurl />" />
   <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<mango:Blog rssurl />" />
   
   <title><mango:Blog title />: <mango:PageProperty title /> - </title>

   <link rel="start" href="<mango:Blog url />" title="Home" />
  <mango:Event name="beforeHtmlHeadEnd" />
</head>
</mango:Page>
<body class="layout-two-column-left">
	<mango:Event name="beforeHtmlBodyStart" />
   <div id="container">
      <div id="container-inner" class="pkg">
         <div id="banner">
 			<div id="banner-inner" class="pkg">
               <h1 id="banner-header"><a href="<mango:Blog url />" accesskey="1"><mango:Blog title /></a></h1>
            </div>
         </div>

         <div id="pagebody">
            <div id="pagebody-inner" class="pkg">

         	<div id="alpha">
               <div id="alpha-inner" class="pkg">
				<mango:Event name="afterSideBarStart" number="1" />
				<mangox:PodGroup locationId="sidebar-page" template="page">
                    <mangox:TemplatePod id="page-menu">
						<div class="module-categories module">
					      <h2 class="module-header">Pages</h2>
							<div class="module-content">
					       		<template:PageMenu />
					        </div>
						</div>
						</mangox:TemplatePod>
                    	<template:sidebar />
					</mangox:PodGroup>
						
                  <div class="module-powered module">
                     <div class="module-content">
                           Powered by <a href="http://www.mangoblog.org" title="Mango Blog - A ColdFusion blog engine">Mango Blog</a>
                     </div>
                  </div>
				<mango:Event name="beforeSideBarEnd" number="1" />
               </div>
            </div>
               <div id="beta">

                  <div id="beta-inner" class="pkg">

                     <p class="content-nav"></p>
					<mango:Page>
                     <a id="a<mango:PageProperty id />"></a>
                     <div class="entry" id="entry-<mango:PageProperty id />">

                        <h3 class="entry-header"><mango:PageProperty title /></h3>
                        <div class="entry-content">
                           <div class="entry-body">					
                              <mango:PageProperty body />
							
								<div class="entry-footer">
								<mango:Event name="beforePageContentEnd" />
								</div>
      						</div>
                       </div>
                     </div>
<mango:PageProperty ifCommentsAllowed>
                     <div id="comments" class="comments">
                        <div class="comments-content">
                        	<h3 class="comments-header">Comments</h3>
							<mango:Comments>
							<mango:Comment>
                           	<a id="c<mango:CommentProperty id />"></a>
                           	<div class="comment" id="comment-<mango:CommentProperty id />">
                              	<div class="comment-content">
<div class="comment-userpic"><mangox:Gravatar size="40" /></div>
                                 	<mango:CommentProperty content />
                              	
                              	<p class="comment-footer">
                                 	Posted by: <a href="<mango:CommentProperty url />" rel="nofollow"><mango:CommentProperty name /></a> | <a href="#comment-<mango:CommentProperty id />"><mango:CommentProperty date dateformat="mmmm d, yyyy" /> <mango:CommentProperty time /></a>

                              	</p>
                              	</div>
                           	</div>
							</mango:Comment>
							</mango:Comments>
            

                        </div>
						
                        <form method="post" action="#commentForm" name="comments_form">
                          <input type="hidden" name="action" value="addComment" />
							<input type="hidden" name="comment_post_id" value="<mango:PageProperty id />" />
							<input type="hidden" name="comment_parent" value="" />
                           <div class="comments-open" id="comments-open">
                              <h2 class="comments-open-header">Post a comment</h2>
                             
                              <div class="comments-open-content">
								<mango:Message ifMessageExists type="comment" status="error">
									<p class="error">There was a problem: <mango:Message text /></p>
								</mango:Message>
								<mango:Message ifMessageExists type="comment" status="success">
									<p class="message"><mango:Message text /></p>
								</mango:Message>
                                 <p class="comments-open-moderated">
                                    (If you haven't left a comment here before, you may need to be approved by the site owner before your comment will appear. Until then, it won't appear on the entry. Thanks for waiting.)
                                 </p>
                                 <div id="comments-open-data">
                                    <div id="name-email">
                                       <p>
                                          <label for="comment-author">Name:</label>
                                          <input id="comment-author" name="comment_name" size="30" value="<mango:RequestVar name="comment_name" />" />
                                       </p>
                                       <p>
                                          <label for="comment-email">Email Address (it will not be displayed):</label>
                                          <input id="comment-email" name="comment_email" size="30" value="<mango:RequestVar name="comment_email" />" />
                                       </p>
                                    </div>

                                    <p>
                                       <label for="comment-url">URL:</label>
                                       <input id="comment-url" name="comment_website" size="30" value="<mango:RequestVar name="comment_website" />" />
                                    </p>
                                    <p>

                                       <label for="subscribe"><input type="checkbox"
                                          id="subscribe" name="comment_subscribe" value="1" />
                                         Subscribe to this comment thread</label>
                                    </p>
                                 </div>

                                 <p id="comments-open-text">
                                    <label for="comment-text">Comments:</label>
                                    <textarea id="comment-text" name="comment_content" rows="10" cols="30"><mango:RequestVar name="comment_content" /></textarea>

                                 </p>
								<mango:Event name="beforeCommentFormEnd" />
                                 <div id="comments-open-footer" class="comments-open-footer">
                                    <input type="submit" accesskey="s" name="submit_comment" id="comment-Page" value="Post" />
                                 </div>
                              </div>
                           </div>
                        </form>
                      </div>
					</mango:PageProperty>
</mango:Page>
                   </div>
<mango:Event name="afterFooterStart" /><mango:Event name="beforeFooterEnd" />
               </div>
			</div>
         </div>
      </div>
   </div>
<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>