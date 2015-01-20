<%@ page import="ee.naiskoor.events.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="event.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" required="" value="${eventInstance?.author}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'caption', 'error')} required">
	<label for="caption">
		<g:message code="event.caption.label" default="Caption" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="caption" required="" value="${eventInstance?.caption}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="event.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${eventInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventDate', 'error')} required">
	<label for="eventDate">
		<g:message code="event.eventDate.label" default="Event Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="eventDate" precision="day"  value="${eventInstance?.eventDate}"  />

</div>

