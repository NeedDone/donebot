# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

twilio = require('twilio')(process.env.TWILIO_ACCOUNT_SID, process.env.TWILIO_AUTH_TOKEN)

module.exports = (robot) ->

  robot.respond /text ([0-9]{10}) (.*)/i, (res) ->
    phoneNumber = res.match[1]
    formattedNumber = phoneNumber.replace(/(\+1)(\d{3})(\d{3})(\d{4})/, '($2) $3-$4')
    message = res.match[2]

    console.log "phone number: #{phoneNumber}"
    console.log "message: #{message}"
    
    twilio.sendMessage({
      to: "+1#{phoneNumber}"
      from: "+16466933663"
      body: "#{message}"
    })
    res.send "Message sent to #{formattedNumber}: \"#{message}\""
