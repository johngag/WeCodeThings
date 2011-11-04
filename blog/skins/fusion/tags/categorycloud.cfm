<cfprocessingdirective suppressWhiteSpace="Yes">
<!--- Code based on Steven Erat's code at:
http://www.talkingtree.com/blog/index.cfm/2005/11/15/TagCloudPod
--->
<cfparam name="attributes.includeStyle" default="true">

<cfif thisTag.executionMode EQ "start">

	<cfset items = request.blogManager.getCategoriesManager().getCategories("count") />

	<cfif arraylen(items) >

		<cfset max = items[arraylen(items)].getPostCount() />
		<cfset min = items[1].getPostCount() />
		<cfset diff = max - min />
		<cfset scaleFactor = 25 />
		<cfset distribution = diff / scaleFactor />

		<cfif attributes.includeStyle >
			<cfhtmlhead text="<style type=""text/css"">.smallestTag { font-size: xx-small; } .smallTag { font-size: small; } .mediumTag { font-size: medium; } .largeTag { font-size: large; } .largestTag { font-size: xx-large; }</style>" />
		</cfif>

		<cfloop index="i" from="#arraylen(items)#" to="1" step="-1">

			<cfset count = items[i].getPostCount() />

			<cfif count EQ min >
				<cfset class="smallestTag" />
			<cfelseif count EQ max >
				<cfset class="largestTag" />
			<cfelseif count GT (min + (distribution*2)) >
				<cfset class="largeTag" />
			<cfelseif count GT (min + distribution) >
				<cfset class="mediumTag" />
			<cfelse>
				<cfset class="smallTag" />
			</cfif>

			<cfoutput>
				<a href="#request.blogManager.getBlog().getBasePath()##items[i].getUrl()#"><span class="#class#">#lcase(items[i].getTitle())#</span></a>
			</cfoutput>

		</cfloop>

	</cfif>

</cfif>

</cfprocessingdirective>