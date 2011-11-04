<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
			<cfthrow message="Missing COMMENTFORM end tag" detail="The COMMENTFORM tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="fusion" taglib=".">

		<cfparam name="attributes.type" type="string" default="Post" />

	</cfcase>

	<cfcase value="end">

		<div id="respond">
			<mango:Message ifMessageExists type="comment" status="error">
				<p class="error">There was a problem: <mango:Message text /></p>
			</mango:Message>
			<mango:Message ifMessageExists type="comment" status="success">
				<p class="message"><mango:Message text /></p>
			</mango:Message>
			<form action="#respond" method="post" id="commentform" name="commentform">
				<input type="hidden" name="action" value="addComment" />
				<input type="hidden" id="comment_post_id" name="comment_post_id" value="<cfif attributes.type EQ "Post"><mango:PostProperty id /><cfelseif attributes.type EQ "Page" ><mango:PageProperty id /></cfif>" />
				<input type="hidden" id="comment_parent" name="comment_parent" value="" />
				<div id="author_info">
					<div class="row">
						<input type="text" id="author" name="comment_name" tabindex="1" value="<mango:RequestVar name="comment_name" />" size="30" />
						<label for="author" class="small">Name (required)</label>
					</div>
					<div class="row">
						<input type="text" id="email" name="comment_email" tabindex="2" value="<mango:RequestVar name="comment_email" />" size="30" />
						<label for="email" class="small">Email (required)</label>
						<em>(will not be published)</em>
					</div>
					<div class="row">
						<input type="text" id="url" name="comment_website" tabindex="3" value="<mango:RequestVar name="comment_website" />" size="30"  />
						<label for="url" class="small">Website</label>
					</div>
				</div>
				<div class="row">
					<textarea id="comment" name="comment_content" tabindex="4" rows="8" cols="85%" ><mango:RequestVar name="comment_content" /></textarea>
				</div>
				<div class="row">
					<input type="checkbox" id="subscribe" name="comment_subscribe" value="1" />
					<label for="subscribe">Subscribe to this comment thread</label>
				</div>
				<div class="row">
					<mango:Event name="beforeCommentFormEnd" />
				</div>
				<div id="submitbox" class="left">
					<span class="button submit">
						<a title="Submit Content" href="javascript:document.commentform.submit();"><span><span>Submit Content</span></span></a>
					</span>
				</div>
				<div class="clear"></div>
			</form>
		</div>

	</cfcase>

</cfswitch>

</cfprocessingdirective>