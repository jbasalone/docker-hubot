# Description:
#   Show last ten commmits
#  
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot changelog - Show the last ten commits that I'm running with


child_process = require 'child_process'
new_updates = false

module.exports = (robot) ->

    robot.respond /changelog/i, (msg) ->
        child_process.exec 'git --no-pager log --pretty=format:"%h - %an, %ar : %s" | head', (error, stdout, stderr) ->
          if error
            msg.send "I can't show you my changelog.  I'm so embarassed right now, I wish everyone was dead. Here's why : " + stderr
          else
            output = stdout+''
	    msg.send "Here's the last thing I remember:" + output
