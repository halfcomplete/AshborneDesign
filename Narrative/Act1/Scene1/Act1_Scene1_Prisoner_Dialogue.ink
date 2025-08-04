EXTERNAL getPlayerStat(statName)
EXTERNAL hasFlag(flagName)
EXTERNAL setFlag(flagName, value)

-> INTRO

== INTRO
{ hasFlag("player.actions.talked.to_bound_one"):
    "You're back." His voice is as flat as ever.
- else:
    The prisoner groans. A rasp of a voice follows. 30<~>"Another dreamer, then. What do you want from me?"</~>
}

-> MAIN

== MAIN ==

{ not hasFlag("player.actions.talked.to_bound_one_ossaneth") and hasFlag("player.actions.talked.to_bound_one_mentioned_ossaneth"):
    * ["Ossaneth?"]
        -> OSSANETH
}

+ ["Who... who are you?"]
    -> WHO_START
    
+ ["Why are you here?"]
    -> WHY_START
    
* [Offer help]
    -> HELP_START

+ [Leave]
    -> LEAVE

== WHO_START ==

{ hasFlag("player.actions.talked.to_bound_one_who"):
    { hasFlag("player.actions.talked.to_bound_one_who_again"):
        "Who... who are you?" you ask.
        "Again?" He scoffs. "I know I said that there's plenty of time here, wherever here is... but that doesn't mean you can go around and ask me useless questions that I've already answered."
        -> MAIN
    - else:
        "You still haven't told me who you are," you tell him.
        -> WHO_AGAIN
    }
}
"Who... who are you?"
~ setFlag("player.actions.talked.to_bound_one_who", true)
The prisoner sighs and breaks into a coughing fit.
1700__PAUSE__
"A curious question indeed. If you were me, would you know?"

* ["Just answer the question. Who are you?"]
    "Just answer the question. Who are you?"
    He smiles. "Not one for nice, long conversations, are you? What, are you afraid we'll run out of time? There's plenty of time here. More than enough to share."
    2400__PAUSE__
    The smile disappears.
    -> WHO_AGAIN

* ["What does that mean?"]
    -> WHO_MEANING

== WHO_MEANING ==
#slow:20
You don't understand the prisoner's riddles. "What does that mean?"
"After all these years in chains, it's good enough that you stay sane. But my mind has been half-wiped by Ossaneth." The prisoner smiles slightly, as though amused by a joke. "There's plenty of time though, to maybe get some of it back."
~ setFlag("player.actions.talked.to_bound_one_mentioned_ossaneth", true)
-> MAIN


== WHO_AGAIN ==
THe prisoner chuckles. "You're persistent, I'll give you that. I was a brother, a father, a follower. All three, or none, maybe. Chains wear away the mind as much it does your body."

+ ["I was also a brother once."]
    "I was also a brother once. Not sure if I'm still one."
    The prisoner glances at your face. "Are you... crying?"
    "W-what?" You blink twice. "It's nothing."
    -> MAIN
+ ["A father?"]
    "A father? Of whom?"
    1500__PAUSE__
    
    He pauses. 50<~>"I'm... not so sure..."</~>
    -> MAIN
+ ["A follower?"]
    -> WHO_AGAIN_FOLLOWER
    
== WHO_AGAIN_FOLLOWER ==
"A follower? In what?" you ask.
The prisoner glances around in caution, eyes darting around.
He stares straight back at you and whispers. "In Ossaneth. 30<~>In the Unblinking Eye.</~>"
~ setFlag("player.actions.talked.to_bound_one_mentioned_ossaneth", true)
200__PAUSE__
-> MAIN

== OSSANETH ==
~ setFlag("player.actions.talked.to_bound_one_ossaneth", true)
"Ossaneth?" you ask. "I've... heard that name before."
"Yeah, everyone has. You're not special."
He annoys you, but you need to know, so you carry on. "Who is it, really? Or, what is it?"
#slow:18
"Ossaneth is a Mask," 25<~>the prisoner begins.</~> "Masks are sentient objects that can be put on, or forced on, a face. Either way, each Mask provides unique powers to the wearer. Ossaneth, the Unblinking Eye, gives the wearer foresight, lie detection, and heightened observation."
You almost laugh. "Why doesn't everyone wear one then?"
100__PAUSE__
Chained Prisoner: "There's only a few hundred in the entire world. Though, more are being found every year."
200__PAUSE__
Chained Prisoner: "Also, if worn for a long time, the Mask can gradually turn your mind into its vessel. You don't want to see what happens then."
You shudder involuntarily. 25<~>"You can take a Mask off whenever, right...?"</~>
"You can," he replies, "but is it worth it?"
"What do you mean? Of course it's worth it - who wants to turn insane?" Maybe this guy is insane.
His voice turns thirsty. "But you'd all lose all that power."
He coughs.
1000__PAUSE__
"You might find, in time, that it's often better to keep the Mask on."
-> MAIN

== WHY_START ==
{ hasFlag("player.actions.talked.to_bound_one_why"):
    "We've been over this, have you already forgotten Ossaneth and the like?" The prisoner shuffles. "Some listener you are..."
    -> MAIN
}
~ setFlag("player.actions.talked.to_bound_one_why", true)
"Why are you here?" you ask. "What happened to you?"
{ hasFlag("player.actions.talked.to_bound_one_ossaneth"):
    The prisoner laughs, the chuckle filling up the empty space. The candles flicker.
    "I left Ossaneth on too long."
    "So... you get imprisoned in some strange dreamspace if you leave a Mask on for too long?"
    Chained Prisoner: "No, what? That's stupid. You die if you do that. Or your mind does. The Mask takes over your body. I'm here, body and mind, like you."
    "I got here because I tried to resist Ossaneth's takeover. So it trapped me here, and sentenced me to an eternity in hell. Or, whatever this place is. A lot better than dying, I suppose. Since you're here, you've put Ossaneth on for the first time. Remember: it's better here than dead."
    You: "Aren't you afraid Ossaneth will hear?"
    "Of course he hears," the prisoner says. "He hears and sees everything. But sometimes he just doesn't care."
    500__PAUSE__
    "We're just ants to him. Vessels. Things to take over."
    -> MAIN
}
The prisoner laughs, the chuckle filling up the empty space. The candles flicker. "I left Ossaneth on too long."
+ ["Ossaneth?"]
    -> WHY_OSSANETH
    
== WHY_OSSANETH ==
~ setFlag("player.actions.talked.to_bound_one_ossaneth", true)
You: "Ossaneth? I've heard that name before."
Chained Prisoner: "Yeah, everyone has. You're not special."
You: "Who is it, really? Or, what is it?"
Chained Prisoner: "Ossaneth is a Mask. Masks are sentient objects that can be put on, or forced on, a face. Either way, each Mask provides unique powers to the wearer - Ossaneth, the Unblinking Eye, gives the wearer foresight, lie detection, and heightened observation."
You: "That's amazing. Why doesn't everyone just wear a mask then?"
100__PAUSE__
Chained Prisoner: "There's only a few thousand in the entire world. Though, more are being found every year."
200__PAUSE__
"Also, if worn for a long time, the Mask can gradually turn your mind into its vessel. You don't want to see what happens then."
[You shudder involuntarily.]
+ ["You can take a mask off whenever, right...?"]
-> WHY_OSSANETH_TAKE

== WHY_OSSANETH_TAKE ==
You: "You can take a mask off whenever, right...?"
Chained Prisoner: "You can, but is it worth it?"
You: "What do you mean? Of course it's worth it - who wants to turn insane?"
[His voice turns thirsty.]
"But you'd all lose all that power, and another bonus that Masks provide - secrecy. When wearing a Mask, you are that Mask. Different people wearing the same Mask are the same person when wearing the Mask. This of course means that the same person wearing different Masks are different people when wearing those Masks. If you take the Mask off, especially in front of people, your identity will be exposed."
1000__PAUSE__
+ ["So... you get imprisoned in some strange dreamspace if you leave a Mask on for too long?"]
You: "So... you get imprisoned in some strange dreamspace if you leave a Mask on for too long?"
"No, what?" He looks at you funny. "That's stupid. You die if you do that. Or your mind does. The Mask takes over your body. I'm here, mind and body, just like you."
"I got here because I tried to resist Ossaneth's takeover. So it trapped me here, and sentenced me to an eternity in hell. Or, whatever this place is. A lot better than dying, I suppose. Since you're here, you've put Ossaneth on for the first time. Remember: it's better here than dead."
-> MAIN

== HELP_START ==
~ setFlag("player.actions.talked.to_bound_one_help", true)
~ temp resolve = getPlayerStat("resolve")
__NL__
"Let me help you."
__NL__
"Help?" The prisoner sounds skeptical. "I've been trying to help myself for years now, what makes you think you can?"

* ["I can try."]
    { resolve >= 3:
        -> HELP_TRY
    - else:
        -> HELP_FAIL
    }

* ["Fine. I won't."]
    -> HELP_DENY

== HELP_TRY ==
"I can try," you say.
"Then try. But remember, kindness is often a cruelty to both."

__NL__
800__PAUSE__
#slow:30
You grip a link.
800__PAUSE__
#slow:40
Heat burns through your skin, your knuckles white and your veins blue as you resist the urge to stop.
#slow:50
You pull, 60<~>pull,</~> 70<~>pull...</~>

3000__PAUSE__
__NL__
#slow:25
[One chain shatters.]

500__PAUSE__
__NL__
"You..." the prisoner gasps, "you did it. You madman."

-> MAIN

== HELP_FAIL ==
"I can try," you insist.
"No," the prisoner says. His voice is tinged with pity. "You can't. Not yet. You’d 40<~>snap</~> before the metal does."

-> MAIN

== HELP_DENY ==
"Fine. I won't."
"Then you understand," he replies. "Kindness is often a cruelty to both."

-> MAIN

== LEAVE ==
You turn to leave, but before you do, the prisoner speaks up one last time.
~ temp who = hasFlag("player.actions.talked.to_bound_one_who")
~ temp why = hasFlag("player.actions.talked.to_bound_one_why")
~ temp help = hasFlag("player.actions.talked.to_bound_one_help")

{ 
- who and why and help:
    "Hey, you asked, you listened, and you tried. Maybe that’s all we’re ever meant to do. Not to save. But to understand."
- who and why:
    "Hey, you're curious, I'll give you that. Just be careful how deep you dig."
- help:
    "Hey, thanks for breaking that chain. Maybe someone else as foolish as you will break another."
- not who and not why and not help:
    "You came, stared, and left. Like all the rest. If you ever come back... come back as more."
- else:
    "Before you go, take my advice: don't trust anyone. Because no-one deserves trust. Not in this world."
}

~ setFlag("player.actions.talked.to_bound_one", true)

You're back at the circle of candles.
__END__

== function getPlayerStat(statName) ==
{ statName == "resolve":
    ~ return 3
}
~ return 0

== function hasFlag(key) ==
~ return true

== function setFlag(key, value) ==
~ return

== function pause(ms) ==
~ return
