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
					<g:form controller="Upload" action="readContents">
						<fieldset>
							<legend>Read contents</legend>
							<div>
								<label for="Server address">Server address</label>
								<input type ="text" name="ServerAddress" value = "" />
							</div>
							<div>
								<label for="Username">Username</label>
								<input type ="text" name="Username" value = "" />
							</div>
							<div>
								<label for="Password">Password</label>
								<input type ="password" name="Password" value = "" />
							</div>
							<div>
            					<!-- label>&nbsp;</label-->
            					<input type="submit" value="Read" />
          					</div>
						</fieldset>
					</g:form>

				</div>
			</div>			
		</div>	
	</div>
</body>
</html>