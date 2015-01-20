<!doctype html>

<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <asset:javascript src="fullcalendar.js"/>
    <asset:javascript src="gcal.js"/>
    <asset:javascript src="moment.min"/>
    <asset:stylesheet href="fullcalendar.css"/>
</head>
%{-- pointless comment --}%
<body>
    <div class="row calendar-row">
        <div class="well">
            <div class="col-md-6">
                <div id='calendar'></div>
            </div>
            <div class="col-md-6">
                    <h1>Üritused</h1>
                <div class="event-handling">
                    <div class=" row creation-row">
                        <g:form url="[resource:eventInstance, action:'save', controller:'event']" update="eventInstanceList" name="eventForm">
                            <fieldset class="form">
                                <g:render template="/event/form"/>
                            </fieldset>
                            <fieldset class="buttons">
                                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </fieldset>
                        </g:form>
                    </div>
                    <div class="row display-row">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>


<script>
$(document).ready(function() {

// page is now ready, initialize the calendar...

$('#calendar').fullCalendar({
// put your options and callbacks here
})
});


</script>

</body> 


</html>