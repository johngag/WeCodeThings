<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="fusion" taglib="tags">
<cfset variables.commentsAllowed = false />
<cfset variables.commentCount = false />
<mango:Post>
	<mango:PostProperty ifcommentsAllowed>
		<cfset variables.commentsAllowed = true />
	</mango:PostProperty>
	<mango:PostProperty ifcommentCountGT="0">
		<cfset variables.commentCount = true />
	</mango:PostProperty>
	<fusion:pagelayout type="Post">
		<div id="post-<mango:PostProperty id />" class="post hentry">
			<h2><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent Link to <mango:PostProperty title />"><mango:PostProperty title /></a></h2>
			<div class="postheader">
				<div class="postinfo">
					<p>Posted by <mango:PostProperty author /> in <mango:Categories><mango:Category><a href="<mango:CategoryProperty link />" title="View all posts in <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a> <mango:Category ifCurrentIsNotLast>, </mango:Category></mango:Category></mango:Categories> on <mango:PostProperty date dateformat="mmmm d, yyyy" /></p>
				</div>
			</div>
			<div class="entry">
				<div class="postbody entry clearfix">
					<mango:PostProperty body />
					<mango:Event name="beforePostContentEnd" />
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<cfif variables.commentsAllowed OR variables.commentCount >
			<fusion:commentlayout type="post">
				<cfif variables.commentCount >
					<fusion:commentlist commentsAllowed="#variables.commentsAllowed#" />
				<cfelseif NOT variables.commentCount AND variables.commentsAllowed >
					<p>No comments yet.</p>
				</cfif>
				<cfif variables.commentCount AND NOT variables.commentsAllowed >
					<p>Comments are closed.</p>
				<cfelseif variables.commentsAllowed >
					<fusion:commentform type="post" />
				</cfif>
			</fusion:commentlayout>
		</cfif>
	</fusion:pagelayout>
</mango:Post>