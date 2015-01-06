<%@page expressionCodec="raw" %>
<!doctype html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="layout" content="main"/>
  	<title>Tartu Ülikooli Akadeemiline Naiskoor</title>
  	<asset:stylesheet src="application.css"/>
    <asset:javascript src="uploadr.manifest.js"/>
    <asset:javascript src="uploadr.demo.manifest.js"/>
    <asset:stylesheet href="uploadr.manifest.css"/>
    <asset:stylesheet href="uploadr.demo.manifest.css"/>



  	<r:require modules="uploadr"/>
</head>
<body>
	<div class="adminbody">
		<div class="row">
			<div class="col-sm-12">
				<div class="well">
					<button type="button" class="btn btn-default usersbutton">Kasutajad</button>
					<div class="userhandling">
						<div class="row userhandling">
							<div class="row userrow">
								<div class="col-md-4">
									<div class="well user-handling-well">
										<div class="user-creation">
											<g:form controller="user" action="save" name='userCreateForm'>
												<table>
													<tbody>

														<s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${user}"
												                        labelCodeDefault='Username' value="${user?.username}"/>

														<s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${user}"
												                            labelCodeDefault='Password' value="${user?.password}"/>

														<s2ui:checkboxRow name='enabled' labelCode='user.enabled.label' bean="${user}"
												                       labelCodeDefault='Enabled' value="${user?.enabled}"/>

														<s2ui:checkboxRow name='accountExpired' labelCode='user.accountExpired.label' bean="${user}"
												                       labelCodeDefault='Account Expired' value="${user?.accountExpired}"/>

														<s2ui:checkboxRow name='accountLocked' labelCode='user.accountLocked.label' bean="${user}"
												                       labelCodeDefault='Account Locked' value="${user?.accountLocked}"/>

														<s2ui:checkboxRow name='passwordExpired' labelCode='user.passwordExpired.label' bean="${user}"
												                       labelCodeDefault='Password Expired' value="${user?.passwordExpired}"/>
													</tbody>
												</table>

												<div style='float:left; margin-top: 10px; '>
													<s2ui:submitButton elementId='create' form='userCreateForm' messageCode='default.button.create.label'/>
												</div>
											</g:form>
										</div>
									</div>		
								</div>	
								<div class="col-md-8">
									<div class="well user-search-well">
										<s2ui:form width='100%' height='375' elementId='formContainer'
							           titleCode='spring.security.ui.user.search'>

											<g:form controller="user" action='userSearch' name='userSearchForm'>

												<table>
													<tbody>

													<tr>
														<td><g:message code='user.username.label' default='Username'/>:</td>
														<td colspan='3'><g:textField name='username' size='50' maxlength='255' autocomplete='off' value='${username}'/></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
														<td><g:message code='spring.security.ui.search.true'/></td>
														<td><g:message code='spring.security.ui.search.false'/></td>
														<td><g:message code='spring.security.ui.search.either'/></td>
													</tr>
													<tr>
														<td><g:message code='user.enabled.label' default='Enabled'/>:</td>
														<g:radioGroup name='enabled' labels="['','','']" values="[1,-1,0]" value='${enabled}'>
														<td><%=it.radio%></td>
														</g:radioGroup>
													</tr>
													<tr>
														<td><g:message code='user.accountExpired.label' default='Account Expired'/>:</td>
														<g:radioGroup name='accountExpired' labels="['','','']" values="[1,-1,0]" value='${accountExpired}'>
														<td><%=it.radio%></td>
														</g:radioGroup>
													</tr>
													<tr>
														<td><g:message code='user.accountLocked.label' default='Account Locked'/>:</td>
														<g:radioGroup name='accountLocked' labels="['','','']" values="[1,-1,0]" value='${accountLocked}'>
														<td><%=it.radio%></td>
														</g:radioGroup>
													</tr>
													<tr>
														<td><g:message code='user.passwordExpired.label' default='Password Expired'/>:</td>
														<g:radioGroup name='passwordExpired' labels="['','','']" values="[1,-1,0]" value='${passwordExpired}'>
														<td><%=it.radio%></td>
														</g:radioGroup>
													</tr>
													<tr><td colspan='4'>&nbsp;</td></tr>
													<tr>
														<td colspan='4'><s2ui:submitButton elementId='search' form='userSearchForm' messageCode='spring.security.ui.search'/></td>
													</tr>
													</tbody>
												</table>
											</g:form>
										</s2ui:form>

										<g:if test='${searched}'>

										<%
										def queryParams = [username: username, enabled: enabled, accountExpired: accountExpired, accountLocked: accountLocked, passwordExpired: passwordExpired]
										%>

										<div class="list">
										<table>
											<thead>
											<tr>
												<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" params="${queryParams}"/>
												<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" params="${queryParams}"/>
												<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" params="${queryParams}"/>
												<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" params="${queryParams}"/>
												<g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" params="${queryParams}"/>
											</tr>
											</thead>

											<tbody>
											<g:each in="${results}" status="i" var="user">
											<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
												<td><g:link action="edit" id="${user.id}">${fieldValue(bean: user, field: "username")}</g:link></td>
												<td><g:formatBoolean boolean="${user.enabled}"/></td>
												<td><g:formatBoolean boolean="${user.accountExpired}"/></td>
												<td><g:formatBoolean boolean="${user.accountLocked}"/></td>
												<td><g:formatBoolean boolean="${user.passwordExpired}"/></td>
											</tr>
											</g:each>
											</tbody>
										</table>
										</div>

										<div class="paginateButtons">
											<g:paginate total="${totalCount}" params="${queryParams}" />
										</div>

										<div style="text-align:center">
											<s2ui:paginationSummary total="${totalCount}"/>
										</div>

										</g:if>

									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

%{-- 		<div class="row filehandling">
			<div class="well">
				<div class="col-md-12">
					<uploadr:add name="myUploadrName" path="/uploadr" direction="up" maxVisible="8" rating="true" voting="true" colorPicker="true" maxSize="204800" />
				</div>			
			</div>
		</div>
	</div> --}%

<script>
// $(document).ready(function() {
// 	$('#authority').focus();
// });

// $(document).ready(function() {
// 	$("#username").focus().autocomplete({
// 		minLength: 2,
// 		cache: false,
// 		source: "${createLink(controller: 'user', action: 'ajaxUserSearch')}"
// 	});
// });

// </script>
</body>
</html>