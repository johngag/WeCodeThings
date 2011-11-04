<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfif thisTag.executionMode EQ "start">
<mangox:PodGroup locationId="sidebar">
	<!--- search box --->
	<mangox:TemplatePod id="search">
	<li>
	<form name="searchForm" id="searchform" method="get" action="<mango:Blog searchUrl />">
		<div><input type="text" value="" name="term" id="s" /><input type="submit" id="searchsubmit" value="Search" /></div>
	</form>
	</li>
	</mangox:TemplatePod>

	<!--- all categories --->
	<mangox:TemplatePod id="categories" title="Categories">
		<ul class="list-cat"><mango:Categories parent=""><mango:Category>
		<li><a href="<mango:CategoryProperty link />" title="<mango:CategoryProperty title />"><mango:CategoryProperty title /></a> (<mango:CategoryProperty postCount />)</li></mango:Category>
		</mango:Categories>
		</ul>
	</mangox:TemplatePod>
	
	<!--- all archives by month --->
	<mangox:TemplatePod id="monthly-archives" title="Archives">
		<ul class="list-archives"><mango:Archives type="month" count="12"><mango:Archive>
        	<li><a href='<mango:ArchiveProperty link />' title='<mango:ArchiveProperty title dateformat="mmmm yyyy" />'><mango:ArchiveProperty title dateformat="mmmm yyyy" /></a></li>
</mango:Archive></mango:Archives>
      </ul>
	</mangox:TemplatePod>
	
	<!--- all links by category --->
	<mangox:TemplatePod id="links-by-category">
		<!--- Links --->
		<mangox:LinkCategories>
		<mangox:LinkCategory>
		<li>
			<h2 class="sidebartitle"><mangox:LinkCategoryProperty name /></h2>
			<ul class="list-blogroll"><mangox:Links><mangox:Link>
			<li><a href="<mangox:LinkProperty address />"><mangox:LinkProperty title /></a></li></mangox:Link></mangox:Links>
			</ul>
		</li>
		</mangox:LinkCategory>
		</mangox:LinkCategories>
	</mangox:TemplatePod>
	
	<!--- category cloud --->
	<mangox:TemplatePod id="category-cloud" title="Tag Cloud">
		<mangox:CategoryCloud />
	</mangox:TemplatePod>
	
	<!--- output all the pods, including the ones added by plugins --->
	<mangox:Pods>
		<mangox:Pod>
			<mangox:PodProperty ifHasTitle>
			<li>
				<h2 class="sidebartitle"><mangox:PodProperty title /></h2>
				<mangox:PodProperty content />
			</li>
			</mangox:PodProperty>
		</mangox:Pod>
		<mangox:Pod><!--- output the content as is, good for "templatePods" --->
			<mangox:PodProperty ifNotHasTitle>
				<mangox:PodProperty content />
			</mangox:PodProperty>
		</mangox:Pod>
	</mangox:Pods>
</mangox:PodGroup>
</cfif>