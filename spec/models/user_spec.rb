require 'rails_helper'

describe User do

  it "cuts out the name of the email address" do
    user      = create(:user)
    username  = user.username
    domein    = user.email.match(/\w+(@.*)/)[1]

    expect(username + domein).to eq (user.email)
  end

end
