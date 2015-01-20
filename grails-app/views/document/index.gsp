
<%@ page import="ee.naiskoor.document.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-document" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="filename" title="${message(code: 'document.filename.label', default: 'Filename')}" />
					
%{-- 						<g:sortableColumn property="fullPath" title="${message(code: 'document.fullPath.label', default: 'Full Path')}" /> --}%
					
						<g:sortableColumn property="uploadDate" title="${message(code: 'document.uploadDate.label', default: 'Upload Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentInstanceList}" status="i" var="documentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
							<g:link action="download" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "filename")}</g:link>
						</td>
					
						<td>${fieldValue(bean: documentInstance, field: "fullPath")}</td>
					
						<td><g:formatDate date="${documentInstance.uploadDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentInstanceCount ?: 0}" />
			</div>
		</div>
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
	</body>
</html>
