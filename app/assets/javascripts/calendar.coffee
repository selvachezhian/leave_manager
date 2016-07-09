$(document).on "ready page:load", ->
  $('#calendar').fullCalendar(
    weekends: true
    header:
      left: 'prev,next today myCustomButton'
      center: 'title'
      right: 'month,agendaWeek,agendaDay'
    events: '/leave/get_leave'
    selectable: true
    selectHelper: true
    select: (start, end) ->
      reason = prompt('Leave Reason:')
      if reason
        eventData = {
          title: reason
          start: start.format()
          end: end.format()
        }
        console.log(eventData)
        $.ajax(
          type: 'POST'
          url: '/leave/add_leave'
          dataType: 'json'
          data:
            leave:
              start_date: eventData.start
              end_date: eventData.end
              notes: eventData.title
          success: (data) ->
            alert('success came')
            $('#calendar').fullCalendar('renderEvent', eventData, true)
        )
      else
        $('#calendar').fullCalendar('unselect')
  )