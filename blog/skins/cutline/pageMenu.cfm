<cfsilent>
<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfparam name="attributes.start" default="root">
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
</cfsilent>

<cfif thisTag.executionMode EQ "start">
<ul>
	<mango:Pages parentPage="#parent#">	
		<mango:Page>
				<mango:PageProperty ifiscurrentpage><li><a class="active"><mango:PageProperty title /></a>
					<template:pageMenu start="context">
				</mango:PageProperty>
				<mango:PageProperty ifisnotcurrentpage ifIsAncestorOfCurrentPage><li><a href="<mango:PageProperty link/>"><mango:PageProperty title /></a>
					<template:pageMenu start="context">
				</mango:PageProperty>
				<mango:PageProperty ifisnotcurrentpage ifIsNotAncestorOfCurrentPage><li><a href="<mango:PageProperty link/>"><mango:PageProperty title /></a></mango:PageProperty>
			</li>
		</mango:Page>
</mango:Pages></ul>
</cfif>