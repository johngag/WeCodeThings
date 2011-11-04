<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfif thisTag.executionMode EQ "start">
<mangox:PodGroup locationId="sidebar">
	<!--- search box --->
	<mangox:TemplatePod id="search">
	<div id="searchBlock">
	<form id="searchForm" method="get" action="<mango:Blog searchUrl />">
	<fieldset>
	<legend>Search Site</legend>
		<label for="term">Search</label><input type="text" name="term" value="" id="term" />
		<button type="submit" id="searchBTN">Search</button>
	</fieldset>
	</form>
	</div>
	</mangox:TemplatePod>

	

	<!---------------- All Categories ---------------->
	<mangox:TemplatePod id="categories">
		<div id="categoryPod"><h2>Categories</h2>
			<ul class="list-cat"><mango:Categories parent=""><mango:Category>
				<li><a href="<mango:CategoryProperty link />" title="<mango:CategoryProperty title />"><mango:CategoryProperty title /> (<mango:CategoryProperty postCount />)</a></li></mango:Category>
			</mango:Categories></ul>
		</div>
	</mangox:TemplatePod>
	
	<!---------------- All Archives By Month ---------------->
	<mangox:TemplatePod id="monthly-archives">
	<div id="monthlyArchivesPod"><h2>Archives By Month</h2>
		<ul class="list-archives"><mango:Archives type="month" count="12"><mango:Archive>
        	<li><a href='<mango:ArchiveProperty link />' title='<mango:ArchiveProperty title dateformat="mmmm yyyy" />'><mango:ArchiveProperty title dateformat="mmmm yyyy" /></a></li>
		</mango:Archive></mango:Archives></ul>
	</div>
	</mangox:TemplatePod>
	
	<!---------------- All Links By Category ---------------->
	<mangox:TemplatePod id="links-by-category">
	<div id="linksPod">
		<mangox:LinkCategories>
		<mangox:LinkCategory>
		
			<h2><mangox:LinkCategoryProperty name /></h2>
			<ul class="list-blogroll"><mangox:Links><mangox:Link>
			<li><a href="<mangox:LinkProperty address />"><mangox:LinkProperty title /></a></li></mangox:Link></mangox:Links>
			</ul>
		
		</mangox:LinkCategory>
		</mangox:LinkCategories>
	</div>
	</mangox:TemplatePod>
	
	<!---------------- Category  Tag Cloud ---------------->
	<mangox:TemplatePod id="category-cloud">
	<div id="cloudTagPod"><h2>Tag Cloud</h2>
		<mangox:CategoryCloud />
	</div>
	</mangox:TemplatePod>
	
	<!---------------- output all the pods, including the ones added by plugins ---------------->
	<mangox:Pods>
		<mangox:Pod>
			<mangox:PodProperty ifHasTitle>
				<h2><mangox:PodProperty title /></h2>
				<mangox:PodProperty content />
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