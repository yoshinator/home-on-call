class TextingService < ApplicationService
  require 'ringcentral'
  attr_reader :recipient, :lead

  def initialize(recipient, lead)
    @recipient = recipient
    @lead = lead
  end

  def call()
    rc = RingCentral.new(ENV['RINGCENTRAL_CLIENTID'], ENV['RINGCENTRAL_CLIENTSECRET'], ENV['RINGCENTRAL_SERVER'])
    rc.authorize(username: ENV['RINGCENTRAL_USERNAME'], extension: ENV['RINGCENTRAL_EXTENSION'], password: ENV['RINGCENTRAL_PASSWORD'])
    resp = rc.get('/restapi/v1.0/account/~/extension/~/phone-number')
    response = JSON(resp)
    for record in response['records'] do
      for feature in record['features'] do
        if feature == 'SmsSender'
          return send_sms(record['phoneNumber'], rc)
        end
      end
    end
  end

  def send_sms(phoneNumber, rc)
    resp = rc.post('/restapi/v1.0/account/~/extension/~/sms', payload: {
      from: {phoneNumber: phoneNumber},
      to: [{phoneNumber: @recipient}],
      text: <<~TEXT
New Lead From Home On Call \n 
Name: #{@lead.f_name} \n
Email: #{@lead.email} \n
Address: #{@lead.street1}  #{@lead.city}, #{@lead.state} \n
Phone:  #{@lead.phone} \n
Description:  #{@lead.content} 
TEXT
    })
  end

end