<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
	<title><mango:Message title /> &#8212; Error</title>
	
	<link rel="stylesheet" href="skins/cutline/assets/styles/style.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="skins/cutline/assets/styles/custom.css" type="text/css" media="screen" />
	<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="skins/cutline/assets/styles/ie7.css" media="screen" />
	<![endif]-->
	<!--[if lte IE 6]>
	<link rel="stylesheet" type="text/css" href="skins/cutline/assets/styles/ie6.css" media="screen" />
	<![endif]-->
	
	<meta name="robots" content="noindex, nofollow" />
</head>
<body class="custom">
<div id="container">

	<div id="masthead">
		<h1>Error</h1>
	</div>

	<ul id="nav">
	
	</ul>
	
	<div id="header_img">
		<img src="skins/cutline/assets/images/header_4.jpg" width="770" height="140" />
	</div>
	<div id="content_box">
	
		<div id="content" class="pages">
			<h2><mango:Message title /></h2>
			<div class="entry">
			<mango:Message text />
			<mango:Message data />
			</div>
			<div class="clear"></div>

<div class="clear flat"></div>
</div>

	</div>
	<div id="footer">
		<p><a href="http://www.mangoblog.org" title="Mango Blog - A free ColdFusion blog engine">Powered by Mango Blog</a> &mdash; Design by <a href="http://www.tubetorial.com">Chris Pearson</a> ported by <a href="http://www.asfusion.com">AsFusion</a></p>
	</div>
</div>
</body>
</html>