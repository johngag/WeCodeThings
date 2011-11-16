<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<cfoutput>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
			<meta name="resource-type" content="document" />
			<meta name="distribution" content="global" />
			<meta name="robots" content="all" />
			<meta name="Author" content="Joel Hill, reno website design, www.wecodethings.com" />
			<meta name="keywords" content="reno website design,reno web design,wecodethings,coldfusion,reno web development,reno website design,reno,sparks,nevada,web developer,professional, flex,gantt,cftips,dashboards,dashboard,released,charts,advisor, CF,content management" />
			<meta name="description" content="Affordable Freelance Website Design. Web Design You Can Afford. Quality Website Design." />
			<title>Reno Website Design | Sparks Web Development | Professional ColdFusion Web Design | WeCodeThings</title>
			
			<link rel="stylesheet" type="text/css" href="#Application.cssDir#/reset.css">
			<link rel="stylesheet" type="text/css" href="#Application.cssDir#/default.css" media="screen">
			<link rel="stylesheet" type="text/css" href="#Application.cssDir#/prettyphoto.css">
			<!--[if IE 7]>
			        <link rel="stylesheet" type="text/css" href="#Application.cssDir#/ie7.css">
			<![endif]-->
			
			<script type="text/javascript" src="#Application.jsDir#/jquery.js"></script>
			<script type="text/javascript" src="#Application.jsDir#/cufon.js"></script>
			<script type="text/javascript" src="#Application.jsDir#/cufon_max.js"></script>
			<script type="text/javascript" src="#Application.jsDir#/3d_carousel.js"></script>
			<script type="text/javascript" src="#Application.jsDir#/custom.js"></script>
			<script type="text/javascript" src="#Application.jsDir#/jquery.prettyPhoto.js"></script>
			<script type="text/javascript">
				var _gaq = _gaq || [];
				_gaq.push(['_setAccount', 'UA-5577928-1']);
				_gaq.push(['_trackPageview']);
				(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
				})();
			</script>
		</head>
			
		<body>
			<!--- ***** HEADER START ***** --->
			#view('main/header')#
			<!--- ***** HEADER END ***** --->
			    
			<div class="clear"></div>
				#body#
			<div class="clear"></div>
			
			<!--- ****** --->
			<!--- FOOTER --->
			<!--- ****** --->
			#view('main/footer')#
			<!--- ************* --->
			<!--- END OF FOOTER --->
			<!--- ************* --->
			<script type="text/javascript" charset="utf-8">
				$(document).ready(function(){
					$(".gallery a[rel^='prettyPhoto']").prettyPhoto({theme:'facebook'});
				});
			</script>
		</body>
	</cfoutput>
</html>
