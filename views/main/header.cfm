<cfoutput>
<div id="header">
<div class="header_wrapper">
    <!-- logo -->
    <div id="logo" style="padding-top:15px;"><a href="#buildURL(action='main.default')#"><img src="images/orange/wecode-logo.png" alt="WeCodeThings.com homepage"></a></div>
    <!-- logo -->
    
    <!-- main menu -->
    <div id="navigation">
        <ul class="nav">
        <li <cfif rc.action eq 'main.default'>class="current"</cfif>><a href="#buildURL(action='main.default')#"><span>Home</span></a></li>
		<li <cfif rc.action eq 'main.webhosting'>class="current"</cfif>><a href="#buildURL(action='main.webhosting')#"><span>Hosting</span></a></li>
		<li <cfif rc.action eq 'main.portfolio'>class="current"</cfif>><a href="#buildURL(action='main.portfolio')#"><span>Portfolio</span></a></li>
        <li <cfif rc.action eq 'main.services'>class="current"</cfif>><a href="#buildURL(action='main.services')#"><span>Services</span></a></li>
        <li <cfif rc.action eq 'main.about'>class="current"</cfif>><a href="#buildURL(action='main.about')#"><span>About Us</span></a></li>
		<!---<li <cfif rc.action eq 'main.blog'>class="current"</cfif>><a href="#buildURL(action = 'main.blog')#"><span>Blog</span></a></li>--->
        <li <cfif rc.action eq 'main.contact'>class="current"</cfif>><a href="#buildURL(action = 'main.contact')#"><span>Contact</span></a></li> 
        </ul> 
    </div>
    <!-- end of main menu -->
</div><!-- End of header_wrapper -->
</div><!-- End of header -->
</cfoutput>