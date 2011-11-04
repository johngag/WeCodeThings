<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
			<cfthrow message="Missing COMMENTLIST end tag" detail="The COMMENTLIST tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="mangox" taglib="../../../tags/mangoextras">
		<cfimport prefix="fusion" taglib=".">

		<cfparam name="attributes.commentsAllowed" type="boolean" default="true" />

	</cfcase>

	<cfcase value="end">

		<ol id="comments">
			<mango:Comments>
				<mango:Comment>
					<li class="comment <mango:CommentProperty ifCurrentIsOdd>even thread-even</mango:CommentProperty><mango:CommentProperty ifCurrentIsEven>odd alt thread-odd thread-alt</mango:CommentProperty> depth-1 with-avatars" id="comment-<mango:CommentProperty id />">
						<div class="wrap<cfif attributes.commentsAllowed > tiptrigger</cfif>">
							<div class="avatar">
								<a class="gravatar" <mango:CommentProperty ifhasurl>href="<mango:CommentProperty url />"</mango:CommentProperty> ><mangox:Gravatar size="64" defaultimg="assets/images/nogravatar.png" class="avatar avatar-64" /></a>
							</div>
							<div class="details <mango:CommentProperty ifIsAuthor>admincomment</mango:CommentProperty><mango:CommentProperty ifNotIsAuthor>regularcomment</mango:CommentProperty>">
								<p class="head">
									<span class="info">
										<a href="#comment-<mango:CommentProperty id />">#<mango:CommentProperty currentCount /></a> by <mango:CommentProperty ifhasurl><a id="commentauthor-<mango:CommentProperty id />" href="<mango:CommentProperty url />" rel="external nofollow"></mango:CommentProperty><mango:CommentProperty ifnothasurl><strong id="commentauthor-<mango:CommentProperty id />"></mango:CommentProperty><mango:CommentProperty name /><mango:CommentProperty ifnothasurl></strong></mango:CommentProperty><mango:CommentProperty ifhasurl></a></mango:CommentProperty> - <mango:CommentProperty date dateformat="mmmm d, yyyy" /> at <mango:CommentProperty time />
									</span>
								</p>
								<div class="text">
									<div id="commentbody-<mango:CommentProperty id />"><mango:CommentProperty content /></div>
								</div>
							</div>
							<cfif attributes.commentsAllowed >
								<div class="act tip">
									<span class="button reply">
										<a title="Reply" href="javascript:void(0);" onclick="MGJS_CMT.quote('commentauthor-<mango:CommentProperty id />', 'comment-<mango:CommentProperty id />', 'commentbody-<mango:CommentProperty id />', 'comment');"><span><span>Reply</span></span></a>
									</span>
								</div>
							</cfif>
							<span class="editlink"></span>
						</div>
					</li>
				</mango:Comment>
			</mango:Comments>
		</ol>

	</cfcase>

</cfswitch>

</cfprocessingdirective>