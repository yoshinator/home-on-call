class LeadMailer < ApplicationMailer
    def new_lead_email
    @lead = params[:lead]
    @email = @lead.client.email
    mail(to: @email, subject: "You got a new order!")
  end
end
