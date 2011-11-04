<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
			<cfthrow message="Missing COMMENTLAYOUT end tag" detail="The COMMENTLAYOUT tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="fusion" taglib=".">

		<cfparam name="attributes.type" type="string" default="Post" />

		<div id="secondary-tabs">
			<ul class="menu">
				<li><a href="#tab-1" class="current"><span><span>Comments (<cfif attributes.type EQ "Post"><mango:PostProperty commentCount /><cfelseif attributes.type EQ "Page"><mango:PageProperty commentCount /></cfif>)</span></span></a></li>
			</ul>
			<div id="tab-1">

	</cfcase>

	<cfcase value="end">

			</div>
		</div>

	</cfcase>

</cfswitch>

</cfprocessingdirective>