Given("I am on the homepage") do
  visit '/'
end

Then("I should see a welcome message") do
  expect(page).to have_content("Have a pro contact you within 10 minutes")
end