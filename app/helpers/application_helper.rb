module ApplicationHelper
    def render_event(event)
        case event.eventable_type
        when 'Habit'
          "Habit: #{event.eventable.name}"
        when 'Reminder'
          "Reminder: #{event.eventable.title}"
        when 'Log'
          "Log: #{event.eventable.description}"
        else
          "Unknown Event"
        end
      end
end
