require 'rails_helper'

RSpec.describe 'attendees/show', type: :view do
  before(:each) do
    @attendee = assign(:attendee, Attendee.create!(
      email: 'MyText0',
      first_name: 'MyText1',
      last_name: 'MyText2',
      all_attendants: 'MyText3',
      party_count: 2,
      rsvp: false,
      is_attending: true,
      number_attending: 1
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText0/)
    expect(rendered).to match(/MyText1/)
    expect(rendered).to match(/MyText2/)
    expect(rendered).to match(/MyText3/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/true/)
    expect(rendered).to match(/1/)
  end
end
