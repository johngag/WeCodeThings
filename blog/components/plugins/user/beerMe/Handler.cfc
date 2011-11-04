<cfcomponent extends="BasePlugin">

	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="mainManager" type="any" required="true" />
		<cfargument name="preferences" type="any" required="true" />
        
        	<cfset setManager(arguments.mainManager) />
			<cfset setPreferencesManager(arguments.preferences) />
			<cfset setPackage("uk.co.placona.beerMe") />
		
			<cfset path = getManager().getBlog().getBasePath() />
			<cfset variables.beerMeUsername = getPreferencesManager().get(path,"beerMeUsername","") />			
		<cfreturn this/>
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="setup" hint="This is run when a plugin is activated" access="public" output="false" returntype="any">
		<cfset path = getManager().getBlog().getBasePath() />
		<cfset getPreferencesManager().put(path,"beerMeUsername","") />
		
		<cfreturn "The beerMe plugin is activated. Would you like to <a href='generic_settings.cfm?event=showBeerMeSettings&amp;owner=beerMe&amp;selected=showBeerMeSettings'>configure it now</a>?" />
	</cffunction>

	<cffunction name="unsetup" hint="This is run when a plugin is de-activated" access="public" output="false" returntype="any">
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>
	
	
	<cffunction name="handleEvent" hint="Asynchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />
		<cfreturn />
	</cffunction>

	<cffunction name="processEvent" hint="Synchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />

			<cfset var data = arguments.event.data />
			<cfset var eventName = arguments.event.name />
			<cfset var pod = "" />
			<cfset var outputData = "" />
			<cfset var link = "" />
			<cfset var page = "" />
			<cfset var path = "" />
			<cfset var local = StructNew() />
			
			<cfif eventName EQ "beforePostContentEnd">
				<cfset strMessageBeer = "Buy me a beer for: ">
				<cfset strTitleBeer = arguments.event.contextData.currentPost.getTitle()>
				<cfset strURLBeer = strMessageBeer & strTitleBeer>
				<cfset strURLBeer = replace(strURLBeer," ","+","ALL")>
				
				<cfset outputData =  arguments.event.getOutputData() />
                <cfset blog = request.blogManager.getBlog() />
				<cfsavecontent variable="local.beerContent"><cfoutput>			
					<link rel="stylesheet" href="#blog.Url#assets/plugins/beerMe/beerMe.css" type="text/css" />
					<div id="beerContainer" class="beerContainer" style="background: url(#blog.Url#assets/plugins/beerMe/beerMe.png);background-repeat:no-repeat;">
						<div id="beerMe" class="beerMe"></div>
						<h4>
							<br />
							<div>
								Did you like this post? Then
								<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=#variables.beerMeUsername#&currency_code=&amount=&return=&item_name=#strURLBeer#" target="_blank">
									<span class="beerTextLink">buy me a beer</span>	
								</a>
							</div>
						</h4>
							
					</div>
				</cfoutput></cfsavecontent>
				<cfset arguments.event.setOutputData(outputData & local.beerContent)/>
			<!--- admin nav event --->
			<cfelseif eventName EQ "settingsNav">
				<cfset link = structnew() />
				<cfset link.owner = "beerMe">
				<cfset link.page = "settings" />
				<cfset link.title = "beerMe" />
				<cfset link.eventName = "showBeerMeSettings" />
				
				<cfset arguments.event.addLink(link)>
				
			<!--- admin event --->
			<cfelseif eventName EQ "showBeerMeSettings">
				<cfset data = arguments.event.getData() />		
				<cfif structkeyexists(data.externaldata,"apply")>
					<cfset variables.beerMeUsername = data.externaldata.beerMeUsername />
					
					<cfset path = getManager().getBlog().getBasePath() />
					<cfset getPreferencesManager().put(path,"beerMeUsername",variables.beerMeUsername) />
					<cfset data.message.setstatus("success") />
					<cfset data.message.setType("settings") />
					<cfset data.message.settext("beerMe updated successfully")/>
				</cfif>
				<cfsavecontent variable="page">
					<cfinclude template="admin/settingsForm.cfm">
				</cfsavecontent>
					
					<!--- change message --->
					<cfset data.message.setTitle("beerMe Settings") />
					<cfset data.message.setData(page) />	
				
			</cfif>
		
		<cfreturn arguments.event />
	</cffunction>
	


</cfcomponent>