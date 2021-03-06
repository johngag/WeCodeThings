<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" id="sixapart-standard">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
   <meta name="generator" content="Mango <mango:Blog version />" />
   
   <link rel="stylesheet" href="<mango:Blog skinurl />assets/styles/styles-site.css" type="text/css" />
   <link rel="alternate" type="application/atom+xml" title="Atom" href="<mango:Blog atomurl />" />
   <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<mango:Blog rssurl />" />
   
   <title><mango:Blog title /></title>
<mango:Event name="beforeHtmlHeadEnd" />
</head>
<body class="layout-two-column-left">
	<mango:Event name="beforeHtmlBodyStart" />
   <div id="container">
      <div id="container-inner" class="pkg">
      
         <div id="banner">
            <div id="banner-inner" class="pkg">
               <h1 id="banner-header"><a href="<mango:Blog url />" accesskey="1"><mango:Blog title /></a></h1>
               <h2 id="banner-description"><mango:Blog tagline /></h2>
            </div>
         </div>
         
         <div id="pagebody">
            <div id="pagebody-inner" class="pkg">
               <div id="alpha">
                  <div id="alpha-inner" class="pkg">
				<mango:Event name="afterSideBarStart" number="1" />
                     <mangox:PodGroup locationId="sidebar" template="generic">
                    <mangox:TemplatePod id="pages">
						<div class="module-categories module">
					      <h2 class="module-header">Pages</h2>
							<div class="module-content">
					        <ul class="module-list">
								<li class="module-list-item"><a href="<mango:Blog basepath />">Home</a></li>
							<mango:Pages parentPage=""><mango:Page>
							<li class="module-list-item"><a href="<mango:PageProperty link />"><mango:PageProperty title /></a></li>
					        </mango:Page>
					        </mango:Pages>
					        </ul>
					        </div>
						</div>
						</mangox:TemplatePod>
                    	<template:sidebar />
					</mangox:PodGroup>
                     <div class="module-powered module">
                       <div class="module-content">
                           Powered by <a href="http://www.mangoblog.org" title="Mango Blog - A ColdFusion blog engine">Mango Blog</a>
                    	</div>
                     </div>
					<mango:Event name="beforeSideBarEnd" number="1" />
                  </div>
               </div>
               <div id="beta">
                  <div id="beta-inner" class="pkg">
                     <div class="entry">

                        <h3 class="entry-header"><mango:Message title /></h3>
                        <div class="entry-content">
						   <div class="entry-body">
                             <mango:Message text />
							<mango:Message data />

                           </div>
                           
                        </div>
                     </div>         
                  </div>
				<mango:Event name="afterFooterStart" /><mango:Event name="beforeFooterEnd" />
               </div>  	
            </div>
         </div>
      </div>
   </div>
<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>
