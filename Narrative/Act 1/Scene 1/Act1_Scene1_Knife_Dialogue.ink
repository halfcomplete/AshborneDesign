EXTERNAL pause(ms)
EXTERNAL setFlag(key, value)

~ pause(300)
#slow:30
[A chill runs down your arm.]

Ossaneth: Sharp, isn’t it? But a knife is only as good as the one who wields it.

* [Say nothing]
    -> KNIFE_SILENT

* [Pull hand away]
    -> KNIFE_PULL_BACK

* [Grip the hilt]
    -> KNIFE_GRIP

== KNIFE_SILENT ==
~ pause(300)
Ossaneth: Not afraid, are you? Or just... thoughtful?
~ pause(200)
#slow:120
Ossaneth: The blade likes thoughtful hands.

[You pull away slowly. The wounds on your hand do not heal.]

~ setFlag("player.actions.silent_knife", true)
-> END

== KNIFE_PULL_BACK ==
[You pull away as if burned. The wounds on your hand instantly heal.]

~ pause(300)
Ossaneth: Hah. You still have boundaries. Admirable.

~ setFlag("player.actions.resisted_knife", true)
-> END

== KNIFE_GRIP ==
[Your hand, slick with blood, closes around the hilt. It feels... right.]

~ pause(500)
#slow:50
Ossaneth: Be warned - even the best swordsman can still get cut by his own knife.

[You reluctantly pull your hand away. The blood dries, but doesn't disappear.]

~ setFlag("player.actions.accepted_knife", true)
-> END
