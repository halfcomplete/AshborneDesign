EXTERNAL pause(ms)
EXTERNAL setCounter(key, value)

#slow:150
Ossaneth: Did you like that? That sense of power, of security, of sitting on that throne?

* [Say yes]
    -> YES

* [Say no]
    -> NO

* [Stay silent]
    -> SILENT
        
== SILENT ==
~ pause(200)
[A snap hits your mind]
#slow:20
~ pause(300)
Ossaneth: Speak! You are to SPEAK when SPOKEN too, understand? Now... tell me. Did you like that little...
~ pause(200)
[Its voice sharpens]
#slow:200
...power experience?

* [Say yes]
    -> YES
* [Say no]
    -> NO
    
== YES ==
~ pause(250)
You: [hesitant] Yes...
[Your mind is creepily quiet]
~ pause(400)
Ossaneth: I see.
~ setCounter("player.truth", 1)
-> END

== NO ==
#slow:80
~ pause(250)
You: [hesitant] No...
[Your mind is creepily quiet]
~ pause(300)
Ossaneth: Good.
~ setCounter("player.guilt", 1)
-> END
