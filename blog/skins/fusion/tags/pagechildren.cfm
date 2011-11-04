<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
			<cfthrow message="Missing PAGECHILDREN end tag" detail="The PAGECHILDREN tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="fusion" taglib=".">

		<!--- Make sure we are nested under a page tag --->
		<cfset variables.ancestorList = GetBaseTagList() />
			<cfif ListFindNoCase( variables.ancestorList, "cf_page") EQ 0 >
			<cfexit method="exittag">
		</cfif>

		<!--- Grab the child pages --->
		<cfset variables.data = GetBaseTagData( "cf_page" )/>
		<cfset variables.pageId = data.currentPage.getId() />
		<cfset variables.childPages = REQUEST.blogManager.getPagesManager().getPagesbyParent( variables.pageId ) />

	</cfcase>

	<cfcase value="end">

		<!--- Output the child pages --->
		<cfif ArrayLen( variables.childPages ) GT 0 >
			<ul>
				<mango:Pages>
					<mango:Page>
						<li class="page_item page-item-<mango:PageProperty id>"><a href="<mango:PageProperty link>" title="<mango:PageProperty title />"><span><span><mango:PageProperty title /></span></span></a></li>
					</mango:Page>
				</mango:Pages>
			</ul>
		</cfif>

	</cfcase>

</cfswitch>

</cfprocessingdirective>