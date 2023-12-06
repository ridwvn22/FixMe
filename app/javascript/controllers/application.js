import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

function eventCalendar() {
    return $('#calendar').fullCalendar({ });
  };
  function clearCalendar() {
    $('#calendar').fullCalendar('delete'); 
    $('#calendar').html('');
  };

  $(document).on('turbolinks:load', function(){
    eventCalendar();  
  });
  $(document).on('turbolinks:before-cache', clearCalendar);
  
