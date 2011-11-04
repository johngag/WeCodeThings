<cfoutput>
<cfset blog = request.blogManager.getBlog() />
<cfset shareMeArray = ListToArray(variables.shareMeSelected)>
<cfset isChecked = "">
<form method="post" action="#cgi.script_name#">
<fieldset>
<legend>shareMe settings</legend>
	<p> 
      
	  <img src="#blog.Url#assets/plugins/shareMe/delicious.png" alt="del.icio.us" />
      delicious:<input type="checkbox" value="delicious" id="shareMeSelected" name="shareMeSelected" title="delicious" 
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "delicious">checked</cfif></cfloop> />
      
      
      <img src="#blog.Url#assets/plugins/shareMe/digg.png" alt="Digg" />
      digg:<input type="checkbox" value="digg" id="shareMeSelected" name="shareMeSelected" title="digg" 
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "digg">checked</cfif></cfloop> />
      
      <img src="#blog.Url#assets/plugins/shareMe/stumble.png" alt="StumbleUpon" />
      stumbleupon:<input type="checkbox" value="stumbleupon" id="shareMeSelected" name="shareMeSelected" title="stumbleupon" 
      					<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "stumbleupon">checked</cfif></cfloop> />
      
      
      <img src="#blog.Url#assets/plugins/shareMe/facebook.png" alt="Facebook" />
      facebook:<input type="checkbox" value="facebook" id="shareMeSelected" name="shareMeSelected" title="facebook" 
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "facebook">checked</cfif></cfloop> />
      
     
      <img src="#blog.Url#assets/plugins/shareMe/technorati.png" alt="Technorati Fav" />
      technorati:<input type="checkbox" value="technorati" id="shareMeSelected" name="shareMeSelected" title="technorati" 
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "technorati">checked</cfif></cfloop> />
      
      
      <img src="#blog.Url#assets/plugins/shareMe/mixx.png" alt="Mixx" />
      mixx:<input type="checkbox" value="mixx" id="shareMeSelected" name="shareMeSelected" title="mixx" 
      	   		<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "mixx">checked</cfif></cfloop>/>  
    </p>
    <p>
      <img src="#blog.Url#assets/plugins/shareMe/spurl.png" alt="Spurl"/>	
      spurl:<input type="checkbox" value="spurl" id="shareMeSelected" name="shareMeSelected" title="spurl"
      			<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "spurl">checked</cfif></cfloop> />
                
                
      <img src="#blog.Url#assets/plugins/shareMe/newsvine.png" alt="newsvine"/>
      newsvine:<input type="checkbox" value="newsvine" id="shareMeSelected" name="shareMeSelected" title="newsvine"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "newsvine">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/reddit.png" alt="reddit"/>
      reddit:<input type="checkbox" value="reddit" id="shareMeSelected" name="shareMeSelected" title="reddit"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "reddit">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/yahoo.png" alt="Yahoo! My Web"/>
      yahoo:<input type="checkbox" value="yahoo" id="shareMeSelected" name="shareMeSelected" title="yahoo"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "yahoo">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/fark.png" alt="FARK"/>
      fark:<input type="checkbox" value="fark" id="shareMeSelected" name="shareMeSelected" title="fark"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "fark">checked</cfif></cfloop> />
                    
      
      <img src="#blog.Url#assets/plugins/shareMe/wists.png" alt="Wists"/>
      wists:<input type="checkbox" value="wists" id="shareMeSelected" name="shareMeSelected" title="wists"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "wists">checked</cfif></cfloop> />
      
	</p>
    
    <p>
      <img src="#blog.Url#assets/plugins/shareMe/simpy.png" alt="simpy"/>	
      simpy:<input type="checkbox" value="simpy" id="shareMeSelected" name="shareMeSelected" title="simpy"
      			<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "simpy">checked</cfif></cfloop> />
                
                
      <img src="#blog.Url#assets/plugins/shareMe/blinklist.png" alt="blinklist"/>
      blinklist:<input type="checkbox" value="blinklist" id="shareMeSelected" name="shareMeSelected" title="blinklist"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "blinklist">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/blogmarks.png" alt="blogmarks"/>
      blogmarks:<input type="checkbox" value="blogmarks" id="shareMeSelected" name="shareMeSelected" title="blogmarks"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "blogmarks">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/smarking.png" alt="smarking"/>
      smarking:<input type="checkbox" value="smarking" id="shareMeSelected" name="shareMeSelected" title="smarking"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "smarking">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/magnolia.png" alt="magnolia"/>
      magnolia:<input type="checkbox" value="magnolia" id="shareMeSelected" name="shareMeSelected" title="magnolia"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "magnolia">checked</cfif></cfloop> />
                    
      
      <img src="#blog.Url#assets/plugins/shareMe/msn.png" alt="msn"/>
      msn:<input type="checkbox" value="msn" id="shareMeSelected" name="shareMeSelected" title="msn"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "msn">checked</cfif></cfloop> />
      
	</p>
    
    <p>
      <img src="#blog.Url#assets/plugins/shareMe/google.png" alt="google"/>	
      google:<input type="checkbox" value="google" id="shareMeSelected" name="shareMeSelected" title="google"
      			<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "google">checked</cfif></cfloop> />                             
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/segnalo.png" alt="segnalo"/>
      segnalo:<input type="checkbox" value="segnalo" id="shareMeSelected" name="shareMeSelected" title="segnalo"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "segnalo">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/diigo.png" alt="diigo"/>
      diigo:<input type="checkbox" value="diigo" id="shareMeSelected" name="shareMeSelected" title="diigo"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "diigo">checked</cfif></cfloop> />
                    
                    
      <img src="#blog.Url#assets/plugins/shareMe/excites.png" alt="excites"/>
      excites:<input type="checkbox" value="excites" id="shareMeSelected" name="shareMeSelected" title="excites"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "excites">checked</cfif></cfloop> />
                    
      
      <img src="#blog.Url#assets/plugins/shareMe/netvouz.png" alt="netvouz"/>
      netvouz:<input type="checkbox" value="netvouz" id="shareMeSelected" name="shareMeSelected" title="netvouz"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "netvouz">checked</cfif></cfloop> />
      
      <img src="#blog.Url#assets/plugins/shareMe/dzone.png" alt="dzone"/>
      dzone:<input type="checkbox" value="dzone" id="shareMeSelected" name="shareMeSelected" title="dzone"
      				<cfloop from="1" to="#ArrayLen(shareMeArray)#" index="i"><cfif #shareMeArray[i]# EQ "dzone">checked</cfif></cfloop> />
      
	</p>

</fieldset>
<div class="actions">
    <input type="submit" class="primaryAction" value="Submit"/>
	<input type="hidden" value="event" name="action" />
	<input type="hidden" value="showshareMeSettings" name="event" />
	<input type="hidden" value="true" name="apply" />
	<input type="hidden" value="shareMe" name="selected" />
  </div>
  
</form>

</cfoutput>