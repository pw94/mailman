include SessionsTestHelper

Given("{int} created messages") do |int|
  owner = FactoryBot.create :user
  log_in owner
  @messages = FactoryBot.create_list :message, int, user: owner
end

When("I visit messages page") do
  visit messages_path
end

Then("I do not see edit button") do
  expect(page).to_not have_link("Edit")
  expect(page).to have_content(@messages[0].subject)
end

Given("Created message") do
  owner = FactoryBot.create :user
  log_in owner
  @message = FactoryBot.create :message, user: owner
end

When("I visit details page") do
  visit message_path(@message)
end

Then("I see links to the records") do
  expect(page).to have_link(@message.records[0].name, href: record_path(@message.records[0]))
end
