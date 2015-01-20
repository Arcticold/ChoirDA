<!doctype html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="layout" content="main"/>
  	<title>Tartu Ülikooli Akadeemiline Naiskoor</title>
  	%{-- Adding the layout for the site --}%
</head>
<body>
	<div class="appbody">
		<div class="row approw">
			<div class="col-lg-6">
				<div class="well upload-data-section">
					
  						<g:each in="${lsOut}" var="it">
    						<div>${it.encodeAsHTML()}</div>
  						</g:each>
					
				</div>
			</div>			
		</div>	
	</div>
</body>
</html>