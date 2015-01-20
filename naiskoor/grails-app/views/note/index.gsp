<html>
<head>
	<meta charset="utf-8">
	<meta name="layout" content="main"/>
	<title>Announcement</title>

</head>
<body>

	<div class="updateStatusForm">
		<g:form action="updateStatus" update="messages" name="updateStatusForm">
			<g:textArea name="message" value=""/><br/>
			<!-- g:submitButton name="Post"/-->
			<input type="submit" value="Post" />
		</g:form>
	</div>
	
</body>


</html>