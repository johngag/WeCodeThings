<cfsilent>
<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfparam name="attributes.start" default="root" />
</cfsilent>
<cfif thisTag.executionMode EQ "start">
	<cfsilent>
	<!--- get first parent --->
	<cfset ancestorlist = getbasetaglist() />
	<cfif attributes.start EQ "root">
		<cfset parent = "" />
	
	<cfelseif listfindnocase(ancestorlist,"cf_page") AND attributes.start EQ "parent">
		<cfset data = GetBaseTagData("cf_page")/> 
		<cfset currentPage = data.currentPage />
		<cfset parents = currentPage.getHierarchy() />
		<cfif len(parents)>
			<cfset parent = listgetat(parents,1,"/") />		
		<cfelse>
				<cfset parent = currentPage.getId() />
		</cfif>		
	<cfelse>
			<cfset parent = "-1" />
	</cfif>

	<cfset class="current_page_parent" />
	<cfif attributes.start EQ "context"><cfset class="current_page_item"></cfif>
</cfsilent>
<mango:Pages parentPage="#parent#">
	<ul class="list-page">
		<mango:Page>
			
			<mango:PageProperty><li class="page_item #class#"><a href="<mango:PageProperty link/>"><mango:PageProperty title /></a></mango:PageProperty>
			<template:pageMenu start="context">
			</li>
		</mango:Page></ul>
</mango:Pages>
</cfif>