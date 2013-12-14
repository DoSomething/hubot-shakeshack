# Description:
#   A command that shows us a photo of the current line at Shake Shack
#
# Commands:
#   hubot (shake|shack) cam - Returns an image of the line at Shake Shack
#
# Author:
#   desmondmorris

module.exports = (robot) ->
  robot.respond /(shake|shack) cam/i, (msg) ->
    msg.send 'http://www.shakeshack.com/camera.jpg?' + new Date().getTime()
