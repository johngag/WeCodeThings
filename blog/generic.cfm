<cfset blog = request.blogManager.getBlog() />
<cfset pluginQueue = request.blogManager.getPluginQueue() />
<cfset pluginQueue.broadcastEvent(pluginQueue.createEvent("beforeGenericTemplate",request)) />
<cfcontent reset="true" /><cfinclude template="#blog.getSetting('skins').path##blog.getSkin()#/generic.cfm">