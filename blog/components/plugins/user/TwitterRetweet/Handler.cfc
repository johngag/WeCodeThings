<cfcomponent extends="BasePlugin">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="mainManager" type="any" required="true" />
		<cfargument name="preferences" type="any" required="true" />
		
			<cfset setManager(arguments.mainManager) />
			<cfset setPreferencesManager(arguments.preferences) />
			<cfset setPackage("com/wris/mango/plugins/TwitterRetweet") />
			
			<cfset initSettings(
					type = "none",
					referrer = "",
					tweetTxt =''
				) />
                
		<cfreturn this/>
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="setup" hint="This is run when a plugin is activated" access="public" output="false" returntype="any">
		
		<cfreturn "Retweet plugin activated. Check out the <a href='generic_settings.cfm?event=showTwitterRetweetSettings&amp;owner=twitterRetweet&amp;selected=showTwitterRetweetSettings'>configuration options</a> for customization." />
	</cffunction>
	
<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="unsetup" hint="This is run when a plugin is de-activated" access="public" output="false" returntype="any">
		<cfreturn "Deactivated Plugin." />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="handleEvent" hint="Asynchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />		
		<cfreturn />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="processEvent" hint="Synchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />
			
			<cfset var data =  "" />
			<cfset var eventName = arguments.event.name />
			<cfset var pod = "" />
			<cfset var link = "" />
			<cfset var page = "" />		
			
			<cfif eventName EQ "beforeHtmlHeadEnd">	
				<cfsavecontent variable="retweetJS"><cfoutput>
					<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
				</cfoutput></cfsavecontent>
				
				<cfset data = arguments.event.outputData />
				<cfset data = data & retweetJS />
				<cfset arguments.event.outputData = data />
			
			
			<cfelseif eventName EQ "beforePostContentEnd">
				
					<cfsavecontent variable="retweetBtn"><cfoutput>
                    	<a href="http://twitter.com/share" class="twitter-share-button" data-count="#getSetting('type')#" <cfif getSetting('referrer') neq ''>data-via="#getSetting('referrer')#"</cfif> <cfif getSetting('tweetTxt') neq ''>data-text="#getSetting('tweetTxt')#"</cfif> >Tweet</a>
					</cfoutput></cfsavecontent>	
					
					<cfset data = arguments.event.outputData />
					<cfset data = data & retweetBtn />
					<cfset arguments.event.outputData = data />	
				
			
			<!--- admin nav event --->
			<cfelseif eventName EQ "settingsNav">
				<cfset link = structnew() />
				<cfset link.owner = "twitterRetweet">
				<cfset link.page = "settings" />
				<cfset link.title = "Twitter Retweet" />
				<cfset link.eventName = "showTwitterRetweetSettings" />
				<cfset arguments.event.addLink(link)>
			
			
			<!--- admin event --->
			<cfelseif eventName EQ "showTwitterRetweetSettings" AND getManager().isCurrentUserLoggedIn()>
				<cfset data = arguments.event.data />				
				<cfif structkeyexists(data.externaldata,"apply")>
					
					<cfset setSettings(
							type = data.externaldata.type,
							referrer = data.externaldata.referrer,
							tweetTxt = data.externaldata.tweetTxt
						) />
					
					<cfset persistSettings() />
					<cfset data.message.setstatus("success") />
					<cfset data.message.setType("settings") />
					<cfset data.message.settext("Twitter Retweet Settings Updated") />
				</cfif>
				
				<cfsavecontent variable="page">
					<cfinclude template="admin/settingsForm.cfm">
				</cfsavecontent>
					
					<!--- change message --->
					<cfset data.message.setTitle("Twitter Retweet Settings") />
					<cfset data.message.setData(page) />
			
			</cfif>
		
		<cfreturn arguments.event />
	</cffunction>

</cfcomponent>