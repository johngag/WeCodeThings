<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
			<cfthrow message="Missing NAVIGATION end tag" detail="The NAVIGATION tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="fusion" taglib=".">

	</cfcase>

	<cfcase value="end">

		<div class="navigation" id="pagenavi">
			<mango:ArchiveProperty ifHasNextPage>
				<div class="alignleft"><a href="<mango:ArchiveProperty link pageDifference="1" />">&laquo; Older Entries</a></div>
			</mango:ArchiveProperty>
			<mango:ArchiveProperty ifHasPreviousPage>
				<div class="alignright"><a href="<mango:ArchiveProperty link pageDifference="-1" />">Newer Entries &raquo;</a></div>
			</mango:ArchiveProperty>
			<div class="clear"></div>
		</div>

	</cfcase>

</cfswitch>

</cfprocessingdirective>