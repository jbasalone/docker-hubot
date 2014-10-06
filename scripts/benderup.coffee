# Hubot can update itself while running in docker with new SysEng scripts and config
# Does a restart
# Depends on
#   Nothing
# Configs are
#   Nothing
# Commands are
#   bender update - does the git pull and an npm update
#   bender pending update - Informs you if there are pending updates and hubot needs to be restarted
child_process = require 'child_process'
new_updates = false

module.exports = (bender) ->

    bender.respond /pending updates?\?$/i, (msg) ->
      if new_updates
        msg.send "I better use my special robot vision to see whats inside..yup Kill Me!"
      else
        msg.send "Nothing to do here"

    bender.respond /update( yourself)?$/i, (msg) ->
      updates = false
      try
        msg.send "Im running 'git pull'..."
        child_process.exec 'git pull', (error, stdout, stderr) ->
          if error
            msg.send "the git pull has failed. Im so embarassed right now, I wish everyone was dead. Heres why : " + stderr
          else
            output = stdout+''
            if not /Already up\-to\-date/.test output
              msg.send "there is a source change:\n" + output
              updates = true
            else
              msg.send "I have all the updatez (allthethings)"
          try
            msg.send "running 'npm update'..."
            child_process.exec 'npm update', (error, stdout, stderr) ->
              if error
                msg.send "npm update failz: " + stderr
              else
                output = stdout+''
                if /node_modules/.test output
                  msg.send "a few modules updated:\n" + output
                  updates = true
                else
                  msg.send "all modulez updated (allthethings)"
              if updates
                new_updates = true
                msg.send "I got some updates bitches, reboot! (hint:bender die)"
              else
                if new_updates
                  msg.send "I have some updates piling up, reboot! (hint:bender die)"
                else
                  msg.send "Im all on the up and up"
          catch error
            msg.send "npm update failz: " + error
      catch error
        msg.send "git pull failz: " + error
