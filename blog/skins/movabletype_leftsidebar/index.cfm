<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" id="sixapart-standard">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
	<meta name="generator" content="Mango <mango:Blog version />" />
	<meta name="description" content="<mango:Blog description />" />
	<meta name="robots" content="index, follow" />   

   <link rel="stylesheet" href="<mango:Blog skinurl />assets/styles/styles-site.css" type="text/css" />

	<link rel="alternate" type="application/atom+xml" title="Atom" href="<mango:Blog atomurl />" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<mango:Blog rssurl />" />	
	<link rel="EditURI" type="application/rsd+xml" title="RSD" href="<mango:Blog apiurl />" />
   
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
					<mangox:PodGroup locationId="sidebar" template="index">
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
					<mango:Posts count="5"><mango:Post>
                     <h2 class="date-header"><mango:PostProperty date dateformat="mmmm d, yyyy"></h2>
                     <a id="a<mango:PostProperty id />"></a>
                     <div class="entry" id="entry-<mango:PostProperty id />">

                        <h3 class="entry-header"><mango:PostProperty title /></h3>
                        <div class="entry-content">
						<mango:Author><mango:AuthorProperty ifHasPicture><div class="entry-userpic"><img src="<mango:AuthorProperty picture />" border="0" alt="<mango:AuthorProperty name />"/></div></mango:AuthorProperty></mango:Author>
                           <div class="entry-body">
                             <mango:PostProperty ifhasExcerpt excerpt>
						 <p><a href="<mango:PostProperty link />">Continue reading "<mango:PostProperty title />" &raquo;</a></p>
						</mango:PostProperty>
						<mango:PostProperty ifnothasExcerpt body />
                              
                              <p class="entry-footer">

                                 <span class="post-footers">Posted by <mango:PostProperty author /> at <mango:PostProperty time /></span> <span class="separator">|</span> <a class="permalink" href="<mango:PostProperty link />">Permalink</a>
                                 | <a href="<mango:PostProperty link />#comments">Comments (<mango:PostProperty commentCount />)</a>
                              </p>

                           </div>
                           
                        </div>
                     </div>
                     </mango:Post>
                    </mango:Posts>
					<p><mango:Archive pageSize="5">
		<mango:ArchiveProperty ifHasNextPage><a class="previous" href="<mango:ArchiveProperty link pageDifference="1" />">&lt; Previous Entries</a></mango:ArchiveProperty></mango:Archive></p>          
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
