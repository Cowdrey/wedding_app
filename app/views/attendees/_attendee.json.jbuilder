json.extract! attendee, :id, :email, :first_name, :last_name, :all_attendants, :party_count, :rsvp, :is_attending, :number_attending, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
