# Preview all emails at http://localhost:3000/rails/mailers/lead_mailer
class LeadMailerPreview < ActionMailer::Preview
    def new_lead_email
    # Set up a temporary lead for the preview
    lead = Lead.new(f_name: "Joe Smith", email: "joe@gmail.com", street1: "2103 Bergenline Ave", city: "Union City", state: "NJ", phone: "090-7777-8888", content: "I Need Some Work Done!", client_id: "1")
    LeadMailer.with(lead: lead).new_lead_email
  end

end
