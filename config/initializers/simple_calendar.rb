SimpleCalendar::Calendar.class_eval do
  def render_header
    view_context.render partial: "simple_calendar/month_calendar", locals: { date_range: date_range }
  end
end
