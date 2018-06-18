include SessionsTestHelper

Given("Owned record in the database") do
  owner = FactoryBot.create :user
  log_in owner
  @record = FactoryBot.create :record, owner: owner
end

When("I share it with another user") do
  @user = FactoryBot.create :user
  visit record_path(@record)
  fill_in 'Share for:', with: @user.email
  click_on 'Share'
end

Then("I see him in the record's Users section") do
  visit record_path(@record)
  expect(page).to have_content(@user.name)
end

Given("Accessible record in the database") do
  user = FactoryBot.create :user
  log_in user
  @record = FactoryBot.create :record
  @record.users << user
end

When("I open its details page") do
  visit record_path(@record)
end

Then("I cannot share it") do
  expect(page).to_not have_button("Share")
end

Then("I cannot see Users section") do
  expect(page).to_not have_content(@record.users[0].name)
end

Then("I do not have edit button") do
  expect(page).to_not have_link("Edit")
end
