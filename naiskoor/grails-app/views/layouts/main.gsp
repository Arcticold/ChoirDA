<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Grails"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	%{-- Twitter Bootstrap --}%
	<r:require modules="bootstrap"/>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">

	<g:layoutHead/>
</head>

%{-- Application start --}%
<body class="application">
	%{-- Application header --}%
	<div class = "header-wrap">
		<div class="header">
			<div class="col-xs-2 col-sm-2 header-logo">
					<a id="logo" href="${createLink(uri: '/')}">TÜAN</a>
			</div>
		</div>
	</div>

	%{-- Application navbar --}%
	<div class="navbar-wrap">
		<div class="navbar navbar-inverse">
			
		</div>
	</div>

	%{-- Application body --}%
	<g:layoutBody/>

	%{-- Application Footer --}%
	<div class="footer-wrap">
		<div class="footer">
			<h2>Footer</h2>	
		</div>
	</div>
</body>
</html>
