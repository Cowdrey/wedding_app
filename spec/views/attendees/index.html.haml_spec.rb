require 'rails_helper'

RSpec.describe "attendees/index", type: :view do
  before(:each) do
    assign(:attendees, [
      Attendee.create!(
        :email => "MyText",
        :first_name => "MyText",
        :last_name => "MyText",
        :all_attendants => "MyText",
        :party_count => 2,
        :rsvp => false,
        :is_attending => false,
        :number_attending => 3
      ),
      Attendee.create!(
        :email => "MyText",
        :first_name => "MyText",
        :last_name => "MyText",
        :all_attendants => "MyText",
        :party_count => 2,
        :rsvp => false,
        :is_attending => false,
        :number_attending => 3
      )
    ])
  end

  it "renders a list of attendees" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
