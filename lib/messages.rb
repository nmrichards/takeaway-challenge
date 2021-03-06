class Messages
  require 'twilio-ruby'
  SID = ENV["SID"]
  TOKEN = ENV["TOKEN"]
  TWI = ENV["TWILIO_NUMBER"]
  TO = ENV["PHONE"]

  def initialize(from = TWI, to = TO, account_sid = SID, auth_token = TOKEN)
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from =  from
    @to = to
    current = Time.now
    @t = format('%d:%02d', current.hour + 1, current.min)
  end

  def send_message
    m = "Thank you! Your order was placed and will be delivered before #{@t}"
    @client.account.messages.create(from: @from, to: @to, body: m)
    "Sent message to Nick"
  end
end
