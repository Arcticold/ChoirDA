function initCalendar(dataUrl){
 
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        $("#hpsCalendar").html('');
 
        var calendar = $('#hpsCalendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: function (start, end, callback) {
                $.ajax({
                    cache: false,
                    dataType: 'json',
                    url: dataUrl,
                    data: {
                        start: Math.round(start.getTime()),
                        end: Math.round(end.getTime())
                    },
                    success: function (msg) {
                        if (msg.result == 'ERROR') {
//                                        notifyError('Whoops, Something went wrong', msg.errMsg);
                            if (msg == "no-session") {
                                $("#wait").html(invalidSessionMsg).fadeIn('fast', function () {
                                    $("#wait").fadeOut(2000, function () {
                                        window.location = window.location + '?123';
                                    });
                                });
                            }
                        }
                        else {
                            console.log(msg)
                            var events = [];
                            for (var c = 0; c < (msg.events).length; c++) {
                                events.push({
                                    id: msg.events[c].id,
                                    title: msg.events[c].title,
                                    start: msg.events[c].start,
                                    end: msg.events[c].end,
                                    allDay: msg.events[c].allDay
                                });
                                console.log('pushed')
                            }
                            callback(events);
//                                        notifySuccess('Success!', msg.successMsg);
                        }
                    }
                });
            },
            selectable: true,
            selectHelper: true,
            select: function (start, end, allDay) {
                var startDate = $.fullCalendar.formatDate(start, 'MM/dd/yyyy');
                var endDate = $.fullCalendar.formatDate(end, 'MM/dd/yyyy');
 
                $("input[name=eventName]").val('');
                $("input[name=endDate]").val(endDate);
                $("input[name=startDate]").val(startDate);
                $("textarea[name=eventDesc]").val('');
                openAddCalEventPopUp();
                calendar.fullCalendar('unselect');
 
            }
        });
    }
 
function openAddCalEventPopUp() {
        $('#createNewEventDlg div.alert').hide();
        renderLatestUserCalendarDropDown()
        $('#createNewEventDlg').appendTo("body").modal('show');
    }
 
$("#saveEventBtn").click(function(){
        $.ajax({
            type:"POST",
            url:"${createLink(controller: 'calendar',action: 'ax_saveCalendarEvent')}",
            data:$("#createEventForm").serialize()
        }).done(function(data){
                    if(data.result == 'SUCCESS'){
                        notifySuccess('Success!',data.successMsg)
                        $('#hpsCalendar').fullCalendar('renderEvent',
                                {
                                    "id": data.eventId,
                                    "title": data.eventName,
                                    "start": data.startDate,
                                    "end": data.endDate,
                                    "allDay": data.allDay
                                },
                                true // make the event "stick"
                        );
                        $('#createNewEventDlg').modal('hide');
                    }else{
                        notifyError('Something went wrong',data.errMsg)
                        $("#createEventForm").html(data.errFormData)
                    }
                })
    })