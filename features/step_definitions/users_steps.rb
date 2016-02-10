Given(/^a signed out user$/) do
  # this doesn't need any explicit action
end

Given(/^a signed in user$/) do
  visit "/signin"
  click_on "Sign In With GitHub"
end

Given(/^a signed in admin user$/) do
  visit "/signin"
  click_on "Sign In With GitHub"
  user = User.first
  user.admin = true
  user.save
end

Given(/^a user signed in with (.*?)$/) do |service|
  visit "/signin"
  click_on "Sign In With #{service}"
end

When(/^they visit the home page$/) do
  visit "/"
end

When(/^they visit their profile$/) do
  visit "/profile"
end

When(/^they visit the oauth path$/) do
  visit "/oauth/applications"
end



When(/^they remove their (.*?) account$/) do |service|
  click_on "Remove #{service}"
end


Then(/^they should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^they should not see "(.*?)"$/) do |text|
  expect(page).not_to have_content(text)
end

When(/^they sign in with GitHub$/) do
  click_on "Sign In"
  page.should have_content("Sign In With GitHub")
  click_on "Sign In With GitHub"
end

When(/^they add their (.*?) account$/) do |service|
  click_on "Add your #{service} account"
end

When(/^they fail the sign in with GitHub$/) do
  # This is where you end up if you click "Access denied" during GitHub auth
  visit "/auth/github/callback?error=access_denied"
end

Then(/^User\.count should == (\d+)$/) do |arg1|
  User.count.should == arg1.to_i
end

Then(/^Authentication\.count should == (\d+)$/) do |arg1|
  Authentication.count.should == arg1.to_i
end

When(/^they make the provider public$/) do
  click_on "Yes, make this public."
end

When(/^they sign out$/) do
  click_on "Sign Out"
end

When(/^they fail the sign out$/) do
  #pending # express the regexp above with the code you wish you had
end
