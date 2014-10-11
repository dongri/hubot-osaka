# Description:
#   Translate 大阪弁.
#
# Dependencies:
#
# Configuration:
#		
# Commands:

# Author:
#   Dongri Jin

module.exports = (robot) ->
  robot.hear /(.*)/, (msg) ->
    text = msg.match[1]
    data = {text: text}
    robot.http("http://osakago.herokuapp.com/translate")
      .query({text: text})
      .get() (err, resp, body) ->
        json = JSON.parse(body)
        translatedText = json.TranslatedText
        if text isnt translatedText
          msg.send json.TranslatedText
