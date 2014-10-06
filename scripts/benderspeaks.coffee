# Description:
#  the random things we want bender to say  
#
hellos = [
    "Nice set of CPUs you got there, %",
    "please wait...loading...",
    "Marnin', %",
    "Tempers are wearing thin. Let's hope some robot doesn't kill everybody, %",
    "Bending's is my middle name. Yep, my full name is bender bending rodriguez",
    "byte my 8-bit metal ass. thats bite with a y. hehehe",
    
]
mornings = [
    "Good morning, %",
    "bite my shiney metal ass, %",
    "Kill all humans, I mean..Good day, %",
    "Please insert booze, %"
]

module.exports = (bender) ->
    bender.hear /(hello|good( [d'])?ay(e)?)/i, (msg) ->
        hello = msg.random hellos
        msg.send hello.replace "%", msg.message.user.name

    bender.hear /(^(good )?m(a|o)rnin(g)?)/i, (msg) ->
        hello = msg.random mornings
        msg.send hello.replace "%", msg.message.user.name
