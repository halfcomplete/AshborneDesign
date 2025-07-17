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
200__PAUSE__
[A snap hits your mind]
#slow:20
300__PAUSE__
Ossaneth: Speak! You are to SPEAK when SPOKEN too, understand? Now... tell me. Did you like that little...
200__PAUSE__
[Its voice sharpens]
#slow:200
...power experience?

* [Say yes]
    -> YES
* [Say no]
    -> NO
    
== YES ==
250__PAUSE__
You: [hesitant] Yes...
[Your mind is creepily quiet]
400__PAUSE__
Ossaneth: I see.
~ setCounter("player.truth", 1)
__END__
-> END

== NO ==
#slow:80
250__PAUSE__
You: [hesitant] No...
[Your mind is creepily quiet]
300__PAUSE__
Ossaneth: Good.
~ setCounter("player.guilt", 1)
__END__
-> END
