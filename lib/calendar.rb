#! /usr/bin/env ruby
require 'google/apis/calendar_v3'
event = Google::Apis::CalendarV3::Event.new(
  summary: 'Google I/O 2015',
  location: '800 Howard St., San Francisco, CA 94103',
  description: 'A chance to hear more about Google\'s developer products.',
  start: Google::Apis::CalendarV3::EventDateTime.new(
    date_time: '2015-05-28T09:00:00-07:00',
    time_zone: 'America/Los_Angeles'
  ),
  end: Google::Apis::CalendarV3::EventDateTime.new(
    date_time: '2015-05-28T17:00:00-07:00',
    time_zone: 'America/Los_Angeles'
  ),
  recurrence: [
    'RRULE:FREQ=DAILY;COUNT=2'
  ],
  attendees: [
    Google::Apis::CalendarV3::EventAttendee.new(
      email: 'lpage@example.com'
    ),
    Google::Apis::CalendarV3::EventAttendee.new(
      email: 'sbrin@example.com'
    )
  ],
  reminders: Google::Apis::CalendarV3::Event::Reminders.new(
    use_default: false,
    overrides: [
      Google::Apis::CalendarV3::EventReminder.new(
        reminder_method: 'email',
        minutes: 24 * 60
      ),
      Google::Apis::CalendarV3::EventReminder.new(
        reminder_method: 'popup',
        minutes: 10
      )
    ]
  )
)

result = client.insert_event('primary', event)
puts "Event created: #{result.html_link}"
