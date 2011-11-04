<cfcomponent extends="BasePlugin">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="mainManager" type="any" required="true" />
		<cfargument name="preferences" type="any" required="true" />
        
        	<cfset setManager(arguments.mainManager) />
			<cfset setPreferencesManager(arguments.preferences) />
			<cfset setPackage("com/cftips/feedMe") />
		
			<cfset path = getManager().getBlog().getBasePath() />
			<cfset variables.feedMefeed = getPreferencesManager().get(path,"feedMefeed","") />
            <cfset variables.feedMeNumber = getPreferencesManager().get(path,"feedMeNumber","") />
            <cfset variables.feedMeTitle = getPreferencesManager().get(path,"feedMeTitle","") />
			<cfset variables.title = getPreferencesManager().get(path,"podTitle","") />
		
			
		<cfreturn this/>
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="setup" hint="This is run when a plugin is activated" access="public" output="false" returntype="any">
		<cfset path = getManager().getBlog().getBasePath() />
		<cfset getPreferencesManager().put(path,"feedMefeed","") />
        <cfset getPreferencesManager().put(path,"feedMeNumber","") />
        <cfset getPreferencesManager().put(path,"feedMeTitle","") />
		
		<cfreturn "The feedMe plugin activated. Would you like to <a href='generic_settings.cfm?event=showfeedMeSettings&amp;owner=feedMe&amp;selected=showfeedMeSettings'>configure it now</a>?" />
	</cffunction>
	
	<cffunction name="unsetup" hint="This is run when a plugin is de-activated" access="public" output="false" returntype="any">
		<cfreturn />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="handleEvent" hint="Asynchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />		
		<cfreturn />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="processEvent" hint="Synchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />

			<cfset var feedMefeed = "" />
            <cfset var feedMeTitle = "RSS Feed" />
            <cfset var feedMeNumber = 3 />
			<cfset var outputData = "" />
			<cfset var link = "" />
			<cfset var page = "" />
			<cfset var data = ""/>
			<cfset var path = "" />
			<cfset var admin = "" />
			<cfset var eventName = arguments.event.name />
			
			<cfif eventName EQ "getPods">
				<cfset outputData =  arguments.event.getOutputData() />
				<cfset feedurl = #variables.feedMefeed#>
				<cffeed action="read" source="#feedurl#" properties="meta" query="entries">	
				<cfsavecontent variable="content">
				<cfoutput>
				<cfif variables.feedMefeed neq "">
               <cfloop query="entries" startrow="1" endrow="#variables.feedMeNumber#">
                <p>
                <b><a href="#rsslink#">#title#</a></b>
                </p>
				 </cfloop>
				</cfif>
				</cfoutput></cfsavecontent>
				<cfset arguments.event.setOutputData(outputData & variables.content) />
				
				<cfset pod = structnew() />
				<cfset pod.title = variables.feedMeTitle />
				<cfset pod.content = variables.content />
				<cfset pod.id = "feedMe" />
				<cfset arguments.event.addPod(pod)>
			
			
			<!--- admin nav event --->
			<cfelseif eventName EQ "settingsNav">
				<cfset link = structnew() />
				<cfset link.owner = "feedMe">
				<cfset link.page = "settings" />
				<cfset link.title = "feedMe" />
				<cfset link.eventName = "showfeedMeSettings" />
				
				<cfset arguments.event.addLink(link)>
			
			<!--- admin event --->
			<cfelseif eventName EQ "showfeedMeSettings">
				<cfset data = arguments.event.getData() />				
				<cfif structkeyexists(data.externaldata,"apply")>
					<cfset variables.feedMefeed = data.externaldata.feedMefeed />
                    <cfset variables.feedMeNumber = data.externaldata.feedMeNumber />
                    <cfset variables.feedMeTitle = data.externaldata.feedMeTitle />
					
					<cfset path = getManager().getBlog().getBasePath() />
					<cfset getPreferencesManager().put(path,"feedMefeed",variables.feedMefeed) />
                    <cfset getPreferencesManager().put(path,"feedMeNumber",variables.feedMeNumber) />
                    <cfset getPreferencesManager().put(path,"feedMeTitle",variables.feedMeTitle) />
					<cfset data.message.setstatus("success") />
					<cfset data.message.setType("settings") />
					<cfset data.message.settext("feedMe updated successfully")/>
				</cfif>
				
				<cfsavecontent variable="page">
					<cfinclude template="admin/settingsForm.cfm">
				</cfsavecontent>
					
					<!--- change message --->
					<cfset data.message.setTitle("feedMe Settings") />
					<cfset data.message.setData(page) />
			
			<cfelseif eventName EQ "getPodsList"><!--- no content, just title and id --->
				<cfset pod = structnew() />
				<cfset pod.title = "feedMe" />
				<cfset pod.id = "feedMe" />
				<cfset arguments.event.addPod(pod)>
			</cfif>
		
		<cfreturn arguments.event />
	</cffunction>

</cfcomponent>