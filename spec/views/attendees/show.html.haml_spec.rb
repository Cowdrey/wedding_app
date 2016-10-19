require 'rails_helper'

RSpec.describe "attendees/show", type: :view do
  before(:each) do
    @attendee = assign(:attendee, Attendee.create!(
      :email => "MyText",
      :first_name => "MyText",
      :last_name => "MyText",
      :all_attendants => "MyText",
      :party_count => 2,
      :rsvp => false,
      :is_attending => false,
      :number_attending => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
  end
end
