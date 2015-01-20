<!doctype html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="layout" content="main"/>
  	<title>Tartu Ülikooli Akadeemiline Naiskoor</title>
  	<g:javascript library="prototype"/>
  	%{-- Adding the layout for the site --}%
</head>
<body>
	<div class="appbody">
		<div class="row approw">
			<div class="col-lg-6">
				<div class="well events">
					Placeholder for events
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="well recent-events">
						Placeholder for recent events
					</div>
				</div>
				<div class="row">
					<div class="well admin-notifications">
						<div id="messages">
							<!-- g:render template="messages" collection="${messages}" var="message"/-->
							<g:each in="${note}" var="it">
    							<div>${it.renderAsHtml()}</div>
  							</g:each>
						</div>
					</div>
				</div>
			</div>
			
		</div>	
	</div>
</body>
</html>