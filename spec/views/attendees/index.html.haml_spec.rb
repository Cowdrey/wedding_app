require 'rails_helper'

RSpec.describe "attendees/index", type: :view do
  before(:each) do
    assign(:attendees, [
      Attendee.create!(
        :email => "MyText0",
        :first_name => "MyText1",
        :last_name => "MyText2",
        :all_attendants => "MyText3",
        :party_count => 2,
        :rsvp => false,
        :is_attending => true,
        :number_attending => 1
      ),
      Attendee.create!(
        :email => "MyText0",
        :first_name => "MyText1",
        :last_name => "MyText2",
        :all_attendants => "MyText3",
        :party_count => 2,
        :rsvp => false,
        :is_attending => true,
        :number_attending => 1
      )
    ])
  end

  it "renders a list of attendees" do
    render
    assert_select "tr>td", :text => "MyText0".to_s, :count => 2
    assert_select "tr>td", :text => "MyText1".to_s, :count => 2
    assert_select "tr>td", :text => "MyText2".to_s, :count => 2
    assert_select "tr>td", :text => "MyText3".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
