require 'rails_helper'

RSpec.describe "attendees/new", type: :view do
  before(:each) do
    assign(:attendee, Attendee.new(
      :email => "MyText",
      :first_name => "MyText",
      :last_name => "MyText",
      :all_attendants => "MyText",
      :party_count => 1,
      :rsvp => false,
      :is_attending => false,
      :number_attending => 1
    ))
  end

  it "renders new attendee form" do
    render

    assert_select "form[action=?][method=?]", attendees_path, "post" do

      assert_select "textarea#attendee_email[name=?]", "attendee[email]"

      assert_select "textarea#attendee_first_name[name=?]", "attendee[first_name]"

      assert_select "textarea#attendee_last_name[name=?]", "attendee[last_name]"

      assert_select "textarea#attendee_all_attendants[name=?]", "attendee[all_attendants]"

      assert_select "input#attendee_party_count[name=?]", "attendee[party_count]"

      assert_select "input#attendee_rsvp[name=?]", "attendee[rsvp]"

      assert_select "input#attendee_is_attending[name=?]", "attendee[is_attending]"

      assert_select "input#attendee_number_attending[name=?]", "attendee[number_attending]"
    end
  end
end
