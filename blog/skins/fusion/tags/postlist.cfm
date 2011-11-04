<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
			<cfthrow message="Missing POSTLIST end tag" detail="The POSTLIST tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="fusion" taglib=".">

	</cfcase>

	<cfcase value="end">

		<mango:Posts count="5">
			<mango:Post>
				<div class="post hentry" id="post-<mango:PostProperty id />">
					<h2><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent Link to <mango:PostProperty title />"><mango:PostProperty title /></a></h2>
					<div class="postheader">
						<div class="postinfo">
							<p>Posted by <mango:PostProperty author /> in <mango:Categories><mango:Category><a href="<mango:CategoryProperty link />" title="View all posts in <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a> <mango:Category ifCurrentIsNotLast>, </mango:Category></mango:Category></mango:Categories> on <mango:PostProperty date dateformat="mmmm d, yyyy" /></p>
						</div>
					</div>
					<div class="postbody entry clearfix">
						<mango:PostProperty ifnothasExcerpt body />
						<mango:PostProperty ifhasExcerpt excerpt>
							<p><a href="<mango:PostProperty link />">Read more...</a></p>
						</mango:PostProperty>
					</div>
					<p class="postcontrols">
						<mango:PostProperty ifcommentsallowed>
							<a class="<mango:PostProperty ifCommentCountLT="1">no </mango:PostProperty>comments" href="<mango:PostProperty link />#comments" title="Comment on <mango:PostProperty title />"><mango:PostProperty ifCommentCountGT="0"><mango:PostProperty commentCount /> Comment<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty></mango:PostProperty><mango:PostProperty ifCommentCountLT="1">No Comments</mango:PostProperty></a>
						</mango:PostProperty>
						<mango:PostProperty ifnotcommentsallowed>
							<mango:PostProperty ifCommentCountGT="0">
								<a class="<mango:PostProperty ifCommentCountLT="1">no </mango:PostProperty>comments" href="<mango:PostProperty link />#comments" title="Comment on <mango:PostProperty title />"><mango:PostProperty ifCommentCountGT="0"><mango:PostProperty commentCount /> Comment<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty></mango:PostProperty><mango:PostProperty ifCommentCountLT="1">No Comments</mango:PostProperty></a>
							</mango:PostProperty>
						</mango:PostProperty>
					</p>
					<div class="clear"></div>
				</div>
			</mango:Post>
		</mango:Posts>

	</cfcase>

</cfswitch>

</cfprocessingdirective>