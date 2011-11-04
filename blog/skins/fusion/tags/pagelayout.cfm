<cfprocessingdirective suppressWhiteSpace="Yes">

<cfswitch expression="#thisTag.ExecutionMode#">

	<cfcase value="start">

		<cfif NOT thisTag.hasEndTag >
		  <cfthrow message="Missing PAGELAYOUT end tag" detail="The PAGELAYOUT tag requires an end tag.">
		</cfif>

		<cfimport prefix="mango" taglib="../../../tags/mango">
		<cfimport prefix="fusion" taglib=".">

		<cfparam name="attributes.type" type="string" default="Home" />

		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
		<head profile="http://gmpg.org/xfn/11">
		<title><cfif attributes.type EQ "Post" ><mango:PostProperty title /><cfelseif attributes.type EQ "Page"><mango:Page><mango:PageProperty title /></mango:Page><cfelseif attributes.type EQ "Author"><mango:AuthorProperty name /><cfelseif attributes.type EQ "Generic"><mango:Message title /><cfelseif attributes.type EQ "Archives">Archives<cfelseif attributes.type EQ "Error">Error</cfif><cfif attributes.type NEQ "Home" > &raquo; </cfif><mango:Blog title /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
		<meta name="generator" content="Mango <mango:Blog version />" />
		<meta name="description" content="<mango:Blog description />" />
		<meta name="robots" content="index, follow" />
		<link rel="alternate" type="application/atom+xml" title="Atom" href="<mango:Blog atomurl />" />
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<mango:Blog rssurl />" />
		<link rel="EditURI" type="application/rsd+xml" title="RSD" href="<mango:Blog apiurl />" />
		<style type="text/css" media="all">@import "<mango:Blog skinurl />assets/styles/style.css";</style>
		<!--[if lte IE 6]>
		<script type="text/javascript">
		/* <![CDATA[ */
			blankimgpath = '<mango:Blog skinurl />assets/images/blank.gif';
		 /* ]]> */
		</script>
		<style type="text/css" media="screen">
			@import "<mango:Blog skinurl />assets/styles/ie6.css";
			body{ behavior:url("<mango:Blog skinurl />assets/js/ie6hoverfix.htc"); }
			img{ behavior: url("<mango:Blog skinurl />assets/js/ie6pngfix.htc"); }
		</style>
		<![endif]-->
		<style type="text/css" media="all">@import "<mango:Blog skinurl />assets/styles/custom.css";</style>
		<script type="text/javascript" src="<mango:Blog skinurl />assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="<mango:Blog skinurl />assets/js/fusion.js"></script>
		<script type="text/javascript">
			/* <![CDATA[ */
			jQuery(document).ready(function() {
		      if (jQuery.browser.safari) jQuery('body').addClass('safari');
		      jQuery("#layoutcontrol a").click(function() {
		        switch (jQuery(this).attr("class")) {
		          case 'setFont' : setFontSize();	break;
		          case 'setLiquid'	: setPageWidth();	break;
		        }
		        return false;
		      });
		      var font_size = jQuery.cookie('fontSize');
		      if (font_size == '.85em') { jQuery('body').css("font-size",".85em"); }
		      if (font_size == '.95em') { jQuery('body').css("font-size",".95em"); }
		      if (font_size == '1.1em') { jQuery('body').css("font-size","1.1em"); }
		      var page_width = jQuery.cookie('pageWidth');
		      if (page_width) jQuery('#page').css('width', page_width);
		      jQuery('#secondary-tabs').minitabs(333, 'slide');
		      if (document.all && !window.opera && !window.XMLHttpRequest && jQuery.browser.msie) {
		        var isIE6 = true;
		      } else {
		      	var isIE6 = false;
		      }
		      jQuery.browser.msie6 = isIE6;
		      if (!isIE6) {
		        initTooltips({
		          timeout: 6000
		        });
		      }
		      tabmenudropdowns();
		      jQuery('#sidebar ul.nav li ul li a').mouseover(function () {
		        jQuery(this).animate({ marginLeft: "4px" }, 100 );
		      });
		      jQuery('#sidebar ul.nav li ul li a').mouseout(function () {
		        jQuery(this).animate({ marginLeft: "0px" }, 100 );
		      });
		      jQuery("a#toplink").click(function(){
		        jQuery('html, body').animate({scrollTop:0}, 'slow');
		      });
		    });
		  /* ]]> */
		</script>
		<mango:Event name="beforeHtmlHeadEnd" />
		</head>
		<body>
		<mango:Event name="afterHtmlBodyStart" />
		<div id="page-wrap1">
			<div id="page-wrap2">
				<div id="page" class="with-sidebar">
					<div id="main-wrap">
						<div id="mid-wrap">
							<div id="side-wrap">
								<div id="mid">
									<div id="header">
										<div id="topnav" class="description">
											<mango:Blog tagline />
										</div>
										<h1 id="title"><a href="<mango:Blog basePath />"><mango:Blog title /></a></h1>
										<div id="tabs">
											<ul>
												<li<cfif attributes.type EQ "Home"> class="current_page_item"</cfif>><a href="<mango:Blog basePath />"><span><span>Home</span></span></a></li>
												<mango:Pages>
													<mango:Page>
														<li<mango:PageProperty ifiscurrentpage> class="current_page_item"</mango:PageProperty>>
															<a href="<mango:PageProperty link>" title="<mango:PageProperty title />"><span><span><mango:PageProperty title /></span></span></a>
															<fusion:pagechildren />
														</li>
													</mango:Page>
												</mango:Pages>
											</ul>
										</div>
									</div>
									<div id="mid-content">

	</cfcase>

	<cfcase value="end">

									</div>
								</div>
								<fusion:sidebar />
							</div>
						</div>
					</div>
					<div class="clearcontent"></div>
					<div id="footer">
						<mango:Event name="afterFooterStart" />
						<p><a href="http://www.mangoblog.org" title="Mango Blog - A ColdFusion blog engine">Powered by Mango Blog</a> | Original design by <a href="http://www.digitalnature.ro/">digitalnature</a> ported by <a href="http://www.donbellamy.com/" title="Don Bellamy">Don Bellamy</a><br />&copy; Copyright <cfoutput>#year(now())#</cfoutput> <a href="<mango:Blog url />"><mango:Blog title /></a> | <a class="rss" href="<mango:Blog rssurl />" title="Entries (RSS)">Entries (RSS)</a> <a href="#" id="toplink" title="Back to top">&#94;</a></p>
						<mango:Event name="beforeFooterEnd" />
					</div>
					<div id="layoutcontrol">
						<a href="javascript:void(0);" class="setFont" title="Increase/Decrease text size"><span>SetTextSize</span></a>
						<a href="javascript:void(0);" class="setLiquid" title="Switch between full and fixed width"><span>SetPageWidth</span></a>
					</div>
				</div>
			</div>
		</div>
		<mango:Event name="beforeHtmlBodyEnd" />
		</body>
		</html>

	</cfcase>

</cfswitch>

</cfprocessingdirective>