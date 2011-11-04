<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="fusion" taglib="tags">
<cfset variables.commentsAllowed = false />
<cfset variables.commentCount = false />
<fusion:pagelayout type="Page">
	<mango:Page>
		<mango:PageProperty ifcommentsAllowed>
			<cfset variables.commentsAllowed = true />
		</mango:PageProperty>
		<mango:PageProperty ifcommentCountGT="0">
			<cfset variables.commentCount = true />
		</mango:PageProperty>
		<div id="post-<mango:PageProperty id />" class="page">
			<h2 class="left"><mango:PageProperty title /></h2>
			<div class="clear"></div>
			<div class="entry clearfix">
				<mango:PageProperty body />
				<mango:Event name="beforePageContentEnd" />
			</div>
		</div>
		<cfif variables.commentsAllowed OR variables.commentCount >
			<fusion:commentlayout type="page">
				<cfif variables.commentCount >
					<fusion:commentlist commentsAllowed="#variables.commentsAllowed#" />
				<cfelseif NOT variables.commentCount AND variables.commentsAllowed >
					<p>No comments yet.</p>
				</cfif>
				<cfif variables.commentCount AND NOT variables.commentsAllowed >
					<p>Comments are closed.</p>
				<cfelseif variables.commentsAllowed >
					<fusion:commentform type="page" />
				</cfif>
			</fusion:commentlayout>
		</cfif>
	</mango:Page>
</fusion:pagelayout>