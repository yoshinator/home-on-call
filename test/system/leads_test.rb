require "application_system_test_case"

class LeadsTest < ApplicationSystemTestCase
  setup do
    @lead = leads(:one)
  end

  test "visiting the index" do
    visit leads_url
    assert_selector "h1", text: "Leads"
  end

  test "creating a Lead" do
    visit leads_url
    click_on "New Lead"

    check "Business" if @lead.business
    fill_in "City", with: @lead.city
    fill_in "Client", with: @lead.client_id
    fill_in "Content", with: @lead.content
    fill_in "Email", with: @lead.email
    fill_in "F name", with: @lead.f_name
    fill_in "L name", with: @lead.l_name
    fill_in "Phone", with: @lead.phone
    fill_in "State", with: @lead.state
    fill_in "Street1", with: @lead.street1
    fill_in "Street2", with: @lead.street2
    click_on "Create Lead"

    assert_text "Lead was successfully created"
    click_on "Back"
  end

  test "updating a Lead" do
    visit leads_url
    click_on "Edit", match: :first

    check "Business" if @lead.business
    fill_in "City", with: @lead.city
    fill_in "Client", with: @lead.client_id
    fill_in "Content", with: @lead.content
    fill_in "Email", with: @lead.email
    fill_in "F name", with: @lead.f_name
    fill_in "L name", with: @lead.l_name
    fill_in "Phone", with: @lead.phone
    fill_in "State", with: @lead.state
    fill_in "Street1", with: @lead.street1
    fill_in "Street2", with: @lead.street2
    click_on "Update Lead"

    assert_text "Lead was successfully updated"
    click_on "Back"
  end

  test "destroying a Lead" do
    visit leads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lead was successfully destroyed"
  end
end
