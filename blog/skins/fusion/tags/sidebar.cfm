<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
			<cfthrow message="Missing SIDEBAR end tag" detail="The SIDEBAR tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="mangox" taglib="../../../tags/mangoextras">
		<cfimport prefix="fusion" taglib=".">

	</cfcase>

	<cfcase value="end">

		<div id="sidebar">
			<div id="sidebar-wrap1">
				<div id="sidebar-wrap2">
					<mango:Event name="afterSideBarStart" number="1" />
					<ul id="sidelist">
						<mangox:PodGroup locationId="sidebar">
							<mangox:TemplatePod id="search">
								<li>
									<div id="searchtab">
										<div class="inside">
											<form method="get" id="searchform" action="<mango:Blog searchUrl />">
												<input type="text" name="term" id="searchbox" size="16" class="searchfield" value="Search For..." onfocus="if(this.value == 'Search For...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search For...';}" />
												<input type="submit" value="Go" class="searchbutton" />
											</form>
										</div>
									</div>
								</li>
							</mangox:TemplatePod>
							<mangox:TemplatePod id="categories">
								<li>
									<ul id="categories" class="nav">
										<mango:Categories parent="">
											<mango:Category>
												<li class="cat-item cat-item-<mango:CategoryProperty id />"><a href="<mango:CategoryProperty link />" title="View all posts filed under <mango:CategoryProperty title />"><span><mango:CategoryProperty title /></span></a><a class="rss tip" href="<mango:CategoryProperty rssUrl />" title="RSS feed for all posts filed under <mango:CategoryProperty title />"></a></li>
											</mango:Category>
										</mango:Categories>
									</ul>
								</li>
							</mangox:TemplatePod>
							<mangox:TemplatePod id="monthly-archives">
								<li>
									<div id="monthly-archives" class="widget widget_archive">
										<h2>Archives</h2>
										<ul>
											<mango:Archives type="month">
												<mango:Archive>
													<li><a href="<mango:ArchiveProperty link />" title="<mango:ArchiveProperty title dateformat="mmmm yyyy" />"><mango:ArchiveProperty title dateformat="mmmm yyyy" /> (<mango:ArchiveProperty postcount />)</a></li>
												</mango:Archive>
											</mango:Archives>
										</ul>
									</div>
								</li>
							</mangox:TemplatePod>
							<mangox:TemplatePod id="links-by-category">
								<mangox:LinkCategories>
									<mangox:LinkCategory>
										<li>
											<div id="links-by-category" class="widget widget_links">
												<h2><mangox:LinkCategoryProperty name /></h2>
												<ul>
													<mangox:Links>
														<mangox:Link>
															<li><a href="<mangox:LinkProperty address />" title="<mangox:LinkProperty title />"><mangox:LinkProperty title /></a></li>
														</mangox:Link>
													</mangox:Links>
												</ul>
											</div>
										</li>
									</mangox:LinkCategory>
								</mangox:LinkCategories>
							</mangox:TemplatePod>
							<mangox:TemplatePod id="category-cloud" title="Tag Cloud">
								<fusion:categorycloud />
							</mangox:TemplatePod>
							<mangox:TemplatePod id="recent-posts">
								<li>
									<div id="recent-posts" class="widget widget_recent_entries">
										<h2>Recent Posts</h2>
										<ul>
											<mango:Posts count="5">
												<mango:Post>
													<li><a href="<mango:PostProperty link />"><mango:PostProperty title /></a></li>
												</mango:Post>
											</mango:Posts>
										</ul>
									</div>
								</li>
							</mangox:TemplatePod>
							<mangox:TemplatePod id="recent-comments">
								<li>
									<div id="recent-comments" class="widget widget_recent_comments">
										<h2>Recent Comments</h2>
										<ul id="recentcomments">
											<mango:Comments recent="true">
												<mango:Comment>
													<li class="recentcomments"><mango:CommentProperty ifhasurl><a href="<mango:CommentProperty url />" rel="external nofollow" class="url"></mango:CommentProperty><mango:CommentProperty name /><mango:CommentProperty ifhasurl></a></mango:CommentProperty>: <a href="<mango:CommentProperty entryLink />#comment-<mango:CommentProperty id />" title="on <mango:CommentProperty entryTitle />"><mango:CommentProperty excerptChars="80" /></a></li>
												</mango:Comment>
											</mango:Comments>
										</ul>
									</div>
								</li>
							</mangox:TemplatePod>
							<mangox:Pods>
								<mangox:Pod>
									<mangox:PodProperty ifHasTitle>
										<li>
											<div class="widget">
												<h2><mangox:PodProperty title /></h2>
												<mangox:PodProperty content />
											</div>
										</li>
									</mangox:PodProperty>
								</mangox:Pod>
								<mangox:Pod>
									<mangox:PodProperty ifNotHasTitle>
										<mangox:PodProperty content />
									</mangox:PodProperty>
								</mangox:Pod>
							</mangox:Pods>
						</mangox:PodGroup>
					</ul>
					<mango:Event name="beforeSideBarEnd" number="1" />
				</div>
			</div>
		</div>

	</cfcase>

</cfswitch>

</cfprocessingdirective>