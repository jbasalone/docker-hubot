# Description:
#   Display a "Meat Gif" image
#
# Dependencies:
#   None
# 
# Configuration: 
#   None
# Commands:
#   meatme 
#
# Author:
#   Jennifer Basalone

meat = [
 "http://giffer.co/g/raWk2ZQz.gif"
]

module.exports = (bender) ->
   bender.hear /meat|meatme|carnage|ruthless/\b/i, (msg) ->
     msg.send msg.random meat 
