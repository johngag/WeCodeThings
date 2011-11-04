<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head profile="http://gmpg.org/xfn/11">
	<title><mango:Message title /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
	<meta name="robots" content="noindex, follow" />
	<link rel="stylesheet" type="text/css" href="skins/glossyblue/assets/styles/main.css"  media="all" />
	<link rel="stylesheet" type="text/css" href="skins/glossyblue/assets/styles/print.css" media="print" />
	<link rel="stylesheet" type="text/css" href="skins/glossyblue/assets/styles/custom.css"  media="all" />
</head>
<body>
<div id="page">
  <div id="header">
    <div id="headerimg">
	  <h1>Error</h1>
	  <div class="description"></div>
	</div>
  </div>
  <!--/header -->
   <div id="content">
	<div class="post">
			<h2><mango:Message title /></h2>
	        <div class="post-content"><mango:Message text />
		<mango:Message data />
			</div>
  			
	</div><!--/post -->
  </div><!--/content -->


  <div id="footer">	
  <hr class="clear" />
  </div><!--/footer -->
</div><!--/page -->

<!--credits start -->
<div id="credits">
<div class="alignleft">Powered by <a href="http://www.mangoblog.org" title="Mango Blog - A ColdFusion blog engine">Mango Blog</a>. Design and <a href="http://www.ndesign-studio.com/stock-icons/">Icons</a> by <a href="http://www.ndesign-studio.com">N.Design Studio</a>
</div>
<!--credits end -->
<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>
