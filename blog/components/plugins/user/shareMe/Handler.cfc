<cfcomponent extends="BasePlugin">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="mainManager" type="any" required="true" />
		<cfargument name="preferences" type="any" required="true" />
		
			<cfset setManager(arguments.mainManager) />
			<cfset setPreferencesManager(arguments.preferences) />
			<cfset setPackage("com/cftips/shareMe") />
            
            <cfset path = getManager().getBlog().getBasePath() />
            <cfset variables.shareMeSelected = getPreferencesManager().get(path,"shareMeSelected","") />

			
		<cfreturn this/>
	</cffunction>


<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="setup" hint="This is run when a plugin is activated" access="public" output="false" returntype="any">
    	<cfset path = getManager().getBlog().getBasePath() />
		<cfset getPreferencesManager().put(path,"shareMeSelected","") />
    	
        <cfreturn "The shareMe plugin activated! Would you like to <a href='generic_settings.cfm?event=showshareMeSettings&amp;owner=shareMe&amp;selected=showshareMeSettings'>configure it now</a>?" />
	</cffunction>
	
	<cffunction name="unsetup" hint="This is run when a plugin is de-activated" access="public" output="false" returntype="any">
		<cfreturn "shareMe plugin de-activated"/>
	</cffunction>
    <cffunction name="upgrade" hint="This is run when upgrading from a previous version with auto-install" output="false" returntype="any">
		<cfreturn "Upgrade complete." />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="handleEvent" hint="Asynchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />		
		<cfreturn />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="processEvent" hint="Synchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />
			
            <cfset var shareMeSelected = "" />
			<cfset var outputData = "" />
			<cfset var link = "" />
			<cfset var page = "" />
			<cfset var data = ""/>
			<cfset var path = "" />
			<cfset var admin = "" />
			<cfset var eventName = arguments.event.name />
            
			<cfif eventName EQ "beforePostContentEnd">
				<cfset outputData =  arguments.event.getOutputData() />
                <cfset blog = request.blogManager.getBlog() />
                <cfset shareMeArray = ListToArray(variables.shareMeSelected)>
				<cfsavecontent variable="content"><cfoutput>
                <div id="shareThis"><span></span>
               	
                <cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i">
                	<cfif #shareMeArray[i]# EQ "delicious">
                	<a href="http://del.icio.us/post?url=#arguments.event.contextData.currentPost.getPermalink()#&title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/delicious.png" alt="del.icio.us" /></a>
                    <cfelseif #shareMeArray[i]# EQ "digg">
                   <a href="http://digg.com/submit?phase=2&url=#arguments.event.contextData.currentPost.getPermalink()#&title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/digg.png" alt="Digg" /></a>
                    <cfelseif #shareMeArray[i]# EQ "stumbleupon">
                   	<a href="http://www.stumbleupon.com/submit?url=#arguments.event.contextData.currentPost.getPermalink()#"><img src="#blog.Url#assets/plugins/shareMe/stumble.png" alt="StumbleUpon" /></a>
                    <cfelseif #shareMeArray[i]# EQ "facebook">
                    <a href="http://www.facebook.com/sharer.php?u=#arguments.event.contextData.currentPost.getPermalink()#"><img src="#blog.Url#assets/plugins/shareMe/facebook.png" alt="Facebook" /></a>
                    <cfelseif #shareMeArray[i]# EQ "technorati">
                    <a href="http://technorati.com/faves?sub=addfavbtn&amp;add=#arguments.event.contextData.currentPost.getPermalink()#"><img src="#blog.Url#assets/plugins/shareMe/technorati.png" alt="Technorati Fav" /></a>
                    <cfelseif #shareMeArray[i]# EQ "mixx">
                    <a href="http://www.mixx.com/submit?page_url=#arguments.event.contextData.currentPost.getPermalink()#"><img src="#blog.Url#assets/plugins/shareMe/mixx.png" alt="Mixx" /></a>
                    <cfelseif #shareMeArray[i]# EQ "spurl">
                    <a href="http://www.spurl.net/spurl.php?url=#arguments.event.contextData.currentPost.getPermalink()#"><img src="#blog.Url#assets/plugins/shareMe/spurl.png" alt="Spurl"/></a>
                    <cfelseif #shareMeArray[i]# EQ "newsvine">
                    <a href="http://www.newsvine.com/_tools/seed&amp;save?u=#arguments.event.contextData.currentPost.getPermalink()#&amp;h=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/newsvine.png" alt="newsvine"/></a>
                    <cfelseif #shareMeArray[i]# EQ "reddit">
                    <a href="http://reddit.com/submit?url=#arguments.event.contextData.currentPost.getPermalink()#&title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/reddit.png" alt="reddit"/></a>
                    <cfelseif #shareMeArray[i]# EQ "yahoo">
                    <a href="http://myweb2.search.yahoo.com/myresults/bookmarklet?u=#arguments.event.contextData.currentPost.getPermalink()#&amp;t=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/yahoo.png" alt="Yahoo! My Web"/></a>
                    <cfelseif #shareMeArray[i]# EQ "fark">
                    <a href="http://cgi.fark.com/cgi/fark/edit.pl?new_url=#arguments.event.contextData.currentPost.getPermalink()#&amp;new_comment=#arguments.event.contextData.currentPost.getTitle()#&amp;linktype="><img src="#blog.Url#assets/plugins/shareMe/fark.png" alt="FARK"/></a>
                    <cfelseif #shareMeArray[i]# EQ "wists">
                    <a href="http://wists.com/r.php?c=&amp;r=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/wists.png" alt="Wists"/></a>
                    <cfelseif #shareMeArray[i]# EQ "simpy">
                    <a href="http://www.simpy.com/simpy/LinkAdd.do?href=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/simpy.png" alt="Simpy"/></a>
                    <cfelseif #shareMeArray[i]# EQ "blinklist">
                    <a href="http://www.blinklist.com/index.php?Action=Blink/addblink.php&amp;Description=&amp;Url=#arguments.event.contextData.currentPost.getPermalink()#&amp;Title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/blinklist.png" alt="BlinkList"/></a>
                    <cfelseif #shareMeArray[i]# EQ "blogmarks">
                    <a href="http://blogmarks.net/my/new.php?mini=1&amp;simple=1&amp;url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/blogmarks.png" alt="BlogMarks"/></a>
                    <cfelseif #shareMeArray[i]# EQ "smarking">
                    <a href="http://smarking.com/editbookmark/?url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/smarking.png" alt="smarking"/></a>
                    <cfelseif #shareMeArray[i]# EQ "magnolia">
                    <a href="http://ma.gnolia.com/bookmarklet/add?url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/magnolia.png" alt="Ma.gnolia"/></a>
                    <cfelseif #shareMeArray[i]# EQ "msn">
                    <a href="https://favorites.live.com/quickadd.aspx?marklet=1&mkt=en-us&url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/msn.png" alt="MSN Live"/></a>
                    <cfelseif #shareMeArray[i]# EQ "google">
                    <a href="http://www.google.com/bookmarks/mark?op=add&bkmk=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/google.png" alt="Google Bookmarks"/></a>
                    <cfelseif #shareMeArray[i]# EQ "segnalo">
                    <a href="http://segnalo.com/post.html.php?url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/segnalo.png" alt="Segnalo"/></a>
                    <cfelseif #shareMeArray[i]# EQ "diigo">
                    <a href="http://www.diigo.com/post?url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/diigo.png" alt="diigo"/></a>
                    <cfelseif #shareMeArray[i]# EQ "excites">
                    <a href="http://www.excites.com/save_link/?url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/excites.png" alt="excites"/></a>
                    <cfelseif #shareMeArray[i]# EQ "netvouz">
                    <a href="http://www.netvouz.com/action/submitBookmark?url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/netvouz.png" alt="Netvouz"/></a>
                    <cfelseif #shareMeArray[i]# EQ "dzone">
                    <a href="http://www.dzone.com/links/add.html?url=#arguments.event.contextData.currentPost.getPermalink()#&amp;title=#arguments.event.contextData.currentPost.getTitle()#"><img src="#blog.Url#assets/plugins/shareMe/dzone.png" alt="DZone"/></a>
                    </cfif>
                </cfloop>


</div>
				</cfoutput></cfsavecontent>
				<cfset arguments.event.setOutputData(outputData & variables.content) />
                
            <!--- admin nav event --->
			<cfelseif eventName EQ "settingsNav">
				<cfset link = structnew() />
				<cfset link.owner = "shareMe">
				<cfset link.page = "settings" />
				<cfset link.title = "shareMe" />
				<cfset link.eventName = "showshareMeSettings" />
				
				<cfset arguments.event.addLink(link)>
                
            <!--- admin event --->
			<cfelseif eventName EQ "showshareMeSettings">
				<cfset data = arguments.event.getData() />				
				<cfif structkeyexists(data.externaldata,"apply")>
					<cfset variables.shareMeSelected = data.externaldata.shareMeSelected />
					
					<cfset path = getManager().getBlog().getBasePath() />
					<cfset getPreferencesManager().put(path,"shareMeSelected",variables.shareMeSelected) />

					<cfset data.message.setstatus("success") />
					<cfset data.message.setType("settings") />
					<cfset data.message.settext("shareMe updated successfully")/>
				</cfif>
				
				<cfsavecontent variable="page">
					<cfinclude template="admin/settingsForm.cfm">
				</cfsavecontent>
					
					<!--- change message --->
					<cfset data.message.setTitle("shareMe Settings") />
					<cfset data.message.setData(page) />
			</cfif>
		
		<cfreturn arguments.event />
	</cffunction>

</cfcomponent>