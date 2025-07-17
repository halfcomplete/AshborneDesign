EXTERNAL getPlayerStat(statName)
EXTERNAL hasFlag(flagName)
EXTERNAL setFlag(flagName, value)

-> INTRO

== INTRO
{ hasFlag("player.actions.talked.to_bound_one"):
    Chained Prisoner: "You're back."
- else:
    [He groans. A rasp of a voice follows.]
    Chained Prisoner: "Another dreamer, then. What do you want from me?"
}

-> MAIN

== MAIN ==

{ not hasFlag("player.actions.talked.to_bound_one_ossaneth") and hasFlag("player.actions.talked.to_bound_one_mentioned_ossaneth"):
    * ["Ossaneth?"]
        -> OSSANETH
}

+ ["Who are you?"]
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
        You: "Who are you?"
        Chained Prisoner: "Again? I know I said that there's plenty of time here, wherever here is... but that doesn't mean you can go around and ask me useless questions that I've already answered."
        -> MAIN
    - else:
        You: "You still haven't told me who you are."
        -> WHO_AGAIN
    }
}
You: "Who are you?"
~ setFlag("player.actions.talked.to_bound_one_who", true)
[The prisoner sighs and breaks into a coughing fit.]
1700__PAUSE__
Chained Prisoner: "A curious question indeed. If you were me, would you know?"

* ["Just answer the question. Who are you?"]
    You: "Just answer the question. Who are you?"
    [He smiles.]
    Chained Prisoner: "Not one for nice, long conversations, are you? What, are you afraid we'll run out of time? There's plenty of time here. More than enough to share."
    2400__PAUSE__
    [Nothing happens.]
    [The smile disappears.]
    -> WHO_AGAIN

* ["What does that mean?"]
    -> WHO_MEANING

== WHO_MEANING ==
You: "What does that mean?"
Chained Prisoner: "After all these years in chains, it's good enough that you stay sane. But my mind has been half-wiped by Ossaneth. There's plenty of time though, to maybe get some of it back."
~ setFlag("player.actions.talked.to_bound_one_mentioned_ossaneth", true)
-> MAIN


== WHO_AGAIN ==
Chained Prisoner: "You're persistent, I'll give you that. I was a brother, a father, a follower. All three, or none, maybe. Chains wear away the mind as much it does your body."

+ ["I was also a brother once."]
    You: "I was also a brother once. Not sure if I'm still one."
    [The prisoner glances at your face.]
    Chained Prisoner: "Are you... crying?"
    [You feel your eyes watering.]
    [You blink it away.]
    You: "It's nothing."
    -> MAIN
+ ["A father?"]
    You: "A father? Of whom?"
    1500__PAUSE__
    #slow:90
    Chained Prisoner: "I'm... not so sure..."
    -> MAIN
+ ["A follower?"]
    -> WHO_AGAIN_FOLLOWER
    
== WHO_AGAIN_FOLLOWER ==
You: "A follower? In what?"
[The prisoner glances around in caution, eyes darting around.]
[He stares straight back at you.]
Chained Prisoner, whispering: "In Ossaneth. The Unblinking Eye."
~ setFlag("player.actions.talked.to_bound_one_mentioned_ossaneth", true)
200__PAUSE__
-> MAIN

== OSSANETH ==
~ setFlag("player.actions.talked.to_bound_one_ossaneth", true)
You: "Ossaneth? I've... heard that name before."
Chained Prisoner: "Yeah, everyone has. You're not special."
You: "Who is it, really? Or, what is it?"
Chained Prisoner: "Ossaneth is a Mask. Masks are sentient objects that can be put on, or forced on, a face. Either way, each Mask provides unique powers to the wearer - Ossaneth, the Unblinking Eye, gives the wearer foresight, lie detection, and heightened observation."
You: "That's amazing. Why doesn't everyone just wear a mask then?"
100__PAUSE__
Chained Prisoner: "There's only a few thousand in the entire world. Though, more are being found every year."
200__PAUSE__
Chained Prisoner: "Also, if worn for a long time, the Mask can gradually turn your mind into its vessel. You don't want to see what happens then."
[You shudder involuntarily.]
You: "You can take a mask off whenever, right...?"
Chained Prisoner: "You can, but is it worth it?"
You: "What do you mean? Of course it's worth it - who wants to turn insane?"
[His voice turns thirsty.]
"But you'd all lose all that power, and another bonus that Masks provide - secrecy. When wearing a Mask, you are that Mask. Different people wearing the same Mask are the same person when wearing the Mask. This of course means that the same person wearing different Masks are different people when wearing those Masks. If you take the Mask off, especially in front of people, your identity will be exposed."
1000__PAUSE__
Chained Prisoner: "You might find, in time, that it's often better to keep the Mask on."
-> MAIN

== WHY_START ==
{ hasFlag("player.actions.talked.to_bound_one_why"):
    Chained Prisoner: "We've been over this, have you already forgotten Ossaneth and the like?"
    -> MAIN
}
~ setFlag("player.actions.talked.to_bound_one_why", true)
You: "Why are you here? What happened to you?"
{ hasFlag("player.actions.talked.to_bound_one_ossaneth"):
    [The prisoner laughs, the chuckle filling up the empty space.]
    Chained Prisoner: "I left Ossaneth on too long."
    You: "So... you get imprisoned in some strange dreamspace if you leave a Mask on for too long?"
    Chained Prisoner: "No, what? That's stupid. You die if you do that. Or your mind does. The Mask takes over your body. I'm here, body and mind, like you."
    "I got here because I tried to resist Ossaneth's takeover. So it trapped me here, and sentenced me to an eternity in hell. Or, whatever this place is. A lot better than dying, I suppose. Since you're here, you've put Ossaneth on for the first time. Remember: it's better here than dead."
    You: "Aren't you afraid Ossaneth will hear?"
    Chained Prisoner: "Of course he hears. He hears, and sees, everything. But sometimes he just doesn't care."
    -> MAIN
}
[The prisoner laughs, the chuckle filling up the empty space.]
Chained Prisoner: "I left Ossaneth on too long."
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
Chained Prisoner: "No, what? That's stupid. You die if you do that. Or your mind does. The Mask takes over your body. I'm here, body and mind, like you."
"I got here because I tried to resist Ossaneth's takeover. So it trapped me here, and sentenced me to an eternity in hell. Or, whatever this place is. A lot better than dying, I suppose. Since you're here, you've put Ossaneth on for the first time. Remember: it's better here than dead."
-> MAIN

== HELP_START ==
~ setFlag("player.actions.talked.to_bound_one_help", true)
~ temp resolve = getPlayerStat("resolve")
You: "Let me help you."
Chainer Prisoner: "Help? I've been trying to help myself for years now, what makes you think you can?"

* ["I can try."]
    { resolve >= 3:
        -> HELP_TRY
    - else:
        -> HELP_FAIL
    }

* ["Fine. I won't."]
    -> HELP_DENY

== HELP_TRY ==
You: "I can try."
Chainer Prisoner: "Then try. But remember, pain listens better than mercy."

[You grip a link.]
[Heat burns through your skin.]
#slow:200
[You pull, pull, pull...]

1000__PAUSE__

[One chain shatters.]

Chainer Prisoner: "You... you did it. One chain."

-> MAIN

== HELP_FAIL ==
You: "I can try."
Chainer Prisoner: "No. You can't. Not yet. You’d snap before the metal does."

-> MAIN

== HELP_DENY ==
You: "Fine. I won't."
Chainer Prisoner: "Then you understand. Kindness is often a cruelty to both."

-> MAIN

== LEAVE ==
[You turn to leave.]
[Before you do, the prisoner speaks up one last time.]
~ temp past = hasFlag("player.actions.talked.to_bound_one_past")
~ temp self = hasFlag("player.actions.talked.to_bound_one_self")
~ temp help = hasFlag("player.actions.talked.to_bound_one_help")

{ 
- past and self and help:
    Chainer Prisoner: "You asked, you listened, and you tried. Maybe that’s all we’re ever meant to do. Not to save — but to understand."
- past and self:
    Chainer Prisoner: "You dug into the rot and stared into the mirror. That’s more than most. If the chains break, it’ll be because of people like you."
- past and help:
    Chainer Prisoner: "You learned what made me. Then you tried to unmake it. Be careful, chains aren't the only thing that snap."
- self and help:
    Chainer Prisoner: "You looked into me and saw yourself. Then tried to help. That’s dangerous, but… noble, maybe."
- past:
    Chainer Prisoner: "You asked about the past. That’s a beginning. Don’t stop there."
- self:
    Chainer Prisoner: "You tried to understand yourself through me. Just be careful how deep you dig."
- help:
    Chainer Prisoner: "You tried to help. That’s rare. Don’t let this world burn that out of you."
- else:
    Chainer Prisoner: "You came, stared, and left. Like all the rest. If you ever come back - come back as more."
}

~ setFlag("player.actions.talked.to_bound_one", true)

You're back at the foot of the slope.
__END__
-> END

== function getPlayerStat(statName) ==
{ statName == "resolve":
    ~ return 3
}
~ return 0

== function hasFlag(key) ==
~ return false

== function setFlag(key, value) ==
~ return

== function pause(ms) ==
~ return
