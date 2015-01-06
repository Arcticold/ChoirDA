%{-- <%@page expressionCodec="raw" %> --}%
<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Naiskoor"/></title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="uploadr.manifest.js"/>
    <asset:javascript src="uploadr.demo.manifest.js"/>
    <asset:stylesheet href="uploadr.manifest.css"/>
    <asset:stylesheet href="uploadr.demo.manifest.css"/>
    <g:layoutHead/>
</head>
<body>
	<!-- Application Start -->
	<div class="application">

		<!-- Page Header -->
		<div class="page-header">
			<div class="row headerrow">
				<div class="col-lg-2 headerelement">
					<div class="well">
						Placeholder for Logo
					</div>
				</div>
				<div class="col-lg-3 col-lg-offset-7 headerelement">
					<div class="well userwell" >
						<div class="row">
							<div class="col-lg-6">
								Welcome, ${sec.username()}
							</div>
							<div class="col-lg-4 col-lg-offset-2">
								<form name="logout" method="POST" action="${createLink(controller:'logout')}">
									<input type="submit" value="logout">
								</form>
							</div>						
						</div>							
					</div>
				</div>
			</div>
		</div>

		<!-- Navbar -->
		<div class="row navbarrow">
			<div class = "navigation-wrap">
				<div class="col-lg-8">
					<nav class = "navbar" role="navigation">
						<div class="navbar-header">
							<span class="navbar-brand visible-xs">Menüü</span>
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only"> Toggle Navigation</span>
								<span class="glyphicon glyphicon-plus"></span>
							</button>
						</div>

						<!-- I think the links should actually be made controllerbased, not href="" -->
						<div class="navbar-collapse collapse  navbarelement">
							<ul class="nav navbar-nav"> 
								<li><a class="active" id="nav-avaleht" href="${createLink(uri: '/')}">Avaleht</a></li>
								<li><a id="nav-eesti" href="${createLink(uri: '/')}">Kalender</a></li>
								<li><a id="nav-valismaa" href="${createLink(uri: '/')}">Arhiiv</a></li>

								<li><a id="nav-poliitika" href="${createLink(uri: '/')}">Kasutajad</a></li>

								<li><a href="${createLink(controller: 'admin')}">Halda</a></li>
								%{-- <li><g:createLink url="[action:'create',controller:'user']"/></li> --}%
								%{-- <li><a id="nav-sport" href="${createLink(controller: 'register')}">Halda</a></li> --}%
							</ul>
						</div>
					</nav>
				</div>

				<div class="col-lg-4 searchbar navbarelement">
					<div class="well">
						Placeholder for seachbar
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Application Body -->
    <g:layoutBody/>
    <!-- Application Body -->

    <!-- Application Footer -->

    <div class="row footerrow">
    	<div class="col-lg-4 col-lg-offset-4">
    		<div class="well footerwell">
    			About | Licenses | naiskoor@ut.ee
    		</div>
    	</div>    	
    </div>

    <asset:javascript src="application.js"/>
</body>
</html>