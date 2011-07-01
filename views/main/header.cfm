<cfoutput>
<div id="header">
<div class="header_wrapper">
    <!-- logo -->
    <div id="logo"><a href="index.html"><img src="images/green_grey/logo.png" alt="WeCodeThings.com homepage"></a></div>
    <!-- logo -->
    
    <!-- main menu -->
    <div id="navigation">
        <ul class="nav">
        <li <cfif rc.action eq 'main.default'>class="current"</cfif>><a href="/"><span>Home</span></a></li>
        <li <cfif rc.action eq 'main.about'>class="current"</cfif>><a href="#buildURL(action = 'main.about')#"><span>About Us</span></a></li>
        <li <cfif rc.action eq 'main.porfolio'>class="current"</cfif>><a href=#buildURL(action = 'main.porfolio')#"><span>Portfolio</span></a></li>
        <li <cfif rc.action eq 'main.blog'>class="current"</cfif>><a href="#buildURL(action = 'main.blog')#"><span>Blog</span></a></li>
        <li <cfif rc.action eq 'main.contact'>class="current"</cfif>><a href="#buildURL(action = 'main.contact')#"><span>Contact</span></a></li> 
        </ul> 
    </div>
    <!-- end of main menu -->
</div><!-- End of header_wrapper -->
</div><!-- End of header -->
</cfoutput>