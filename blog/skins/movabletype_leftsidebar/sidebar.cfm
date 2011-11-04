<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfif thisTag.executionMode EQ "start">	
	<mangox:TemplatePod id="search">
	<div class="module-search module">
        <h2 class="module-header">Search</h2>
		<div class="module-content">
        <form method="get" action="<mango:Blog searchUrl />">
        	<label for="search" accesskey="4">Search this blog:</label><br />
        	<input id="search" name="term" size="20" />
        	<input type="submit" value="Search" />
        </form>
    	</div>
	</div>
	</mangox:TemplatePod>
	
	<mangox:TemplatePod id="categories">
	<div class="module-categories module">
        <h2 class="module-header">Categories</h2>
        <div class="module-content">
        <ul class="module-list">
			<mango:Categories parent="">
			<mango:Category>
	    	    <li class="module-list-item"><a href="<mango:CategoryProperty link />" title="<mango:CategoryProperty title>"><mango:CategoryProperty title /></a></li>
				</mango:Category>
			</mango:Categories>
        </ul>
    	</div>
	</div>
	</mangox:TemplatePod>
		
	<mangox:TemplatePod id="monthly-archives">
	 <div class="module-archives module">
		<h2 class="module-header">Archives</h2>
		<div class="module-content">
        	<ul class="module-list">
			<mango:Archives type="month"><mango:Archive>
       			<li class="module-list-item"><a href="<mango:ArchiveProperty link />"><mango:ArchiveProperty title dateformat="mmmm yyyy" /></a></li>
			</mango:Archive></mango:Archives>
           	</ul>
       	</div>
    </div>
	</mangox:TemplatePod>
	
	<mangox:TemplatePod id="posts">
	<div class="module-archives module">
                        <h2 class="module-header">Recent Posts</h2>
                        <div class="module-content">
                           <ul class="module-list">
							<mango:Posts count="5"><mango:Post>
							<li class="module-list-item"><a href="<mango:PostProperty link />"><mango:PostProperty title /></a></li>
                           </mango:Post>
                   		</mango:Posts>
                           </ul>
                        </div>
          </div>
	</mangox:TemplatePod>
	
	<mangox:TemplatePod id="links-by-category">
		<!--- Links --->
			<mangox:LinkCategories>
			<div class="module-archives module">
				<mangox:LinkCategory>
					<h2 class="module-header"><mangox:LinkCategoryProperty name /></h2>
				</mangox:LinkCategory>
				<div class="module-content">
					<ul class="module-list">
						<mangox:Links>
							<mangox:Link>
							<li class="module-list-item"><a href="<mangox:LinkProperty address />" title="<mangox:LinkProperty title />"><mangox:LinkProperty title /></a></li>
	                      	 </mangox:Link>
						</mangox:Links>
					</ul>
				</div>
			</div>
			</mangox:LinkCategories> 
	</mangox:TemplatePod>
	
	<mangox:TemplatePod id="feeds">
	<div class="module-syndicate module">
        <div class="module-content">
        <a href="<mango:Blog rssurl />">Subscribe to this blog's feed</a><br /><br />
    	</div>
	</div>
	
	</mangox:TemplatePod>

	<!--- output all the pods, including the ones added by plugins --->
	<mangox:Pods>		
		<mangox:Pod>
		<div class="module">
			<mangox:PodProperty ifHasTitle>
				<h2 class="module-header"><mangox:PodProperty title /></h2>
				<div class="module-content"><mangox:PodProperty content /></div>
			</mangox:PodProperty>
		
		<!--- output the content as is, good for "templatePods" --->
			<mangox:PodProperty ifNotHasTitle>
				<div class="module-content"><mangox:PodProperty content /></div>
			</mangox:PodProperty>
		</div>
		</mangox:Pod>		
	</mangox:Pods>
</cfif>