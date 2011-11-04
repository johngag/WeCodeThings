<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
	<title>Login &#8212; <mango:Blog title /></title>
	
	<meta name="generator" content="Mango <mango:Blog version />" />
	
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/styles/style.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/styles/custom.css" type="text/css" media="screen" />
	<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="<mango:Blog skinurl />assets/styles/ie7.css" media="screen" />
	<![endif]-->
	<!--[if lte IE 6]>
	<link rel="stylesheet" type="text/css" href="<mango:Blog skinurl />assets/styles/ie6.css" media="screen" />
	<![endif]-->
	
	<meta name="robots" content="noindex, nofollow" />
	<mango:Event name="beforeHtmlHeadEnd" />
</head>
<body class="custom">
<mango:Event name="beforeHtmlBodyStart" />
<div id="container">
	<div id="masthead">
		<h1><a href="<mango:Blog url />"><mango:Blog title /></a></h1>
		<h3><mango:Blog tagline /></h3>
	</div>

	<ul id="nav">
	</ul>
	
	<div id="header_img">
		<img src="<mango:Blog skinurl />assets/images/header_4.jpg" width="770" height="140" />
	</div>
	<div id="content_box">
		<div id="content" class="pages">
		
		<h2>Login</h2>
		<div class="entry">
			<mango:RequestVar ifExists="errormsg">
				<p class="error"><mango:RequestVar name="errormsg" /></p>
			</mango:RequestVar>
		<cfoutput><form action="<mangox:Environment selfUrl />" method="post" id="login_form"></cfoutput>
	
				<label for="username">Username:</label>
				<p>
				<input name="username" id="username" value="" size="22" type="text" class="text_input">
				</p>
				<p>
				<label for="password">Password:</label><br />
				<input name="password" id="password" value="" size="22" type="password" class="text_input">
				</p>
				<input name="login" class="form_submit" type="submit" id="submit" 
						src="<mango:Blog skinurl />assets/images/submit_comment.gif" value="Login" />
			</form>
		
		</div>
		<div class="clear"></div>

		</div>

	</div>

	<div id="footer"><mango:Event name="afterFooterStart" />
		<p><mango:Blog title /> &mdash; <a href="http://www.mangoblog.org" title="Mango Blog - A ColdFusion blog engine">Powered by Mango Blog</a> &mdash; Design by <a href="http://www.tubetorial.com">Chris Pearson</a> ported by <a href="http://www.asfusion.com">AsFusion</a></p>
	<mango:Event name="beforeFooterEnd" />
	</div>
</div>
<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>