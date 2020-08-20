class LeadMailer < ApplicationMailer
    def new_lead_email
    @lead = params[:lead]
    @email = @lead.client.email
    mail(to: @email, bcc: ["yoanante@gmail.com"], subject: "You got a new lead from Home On Call!")
  end
end
