EXTERNAL getPlayerStat(statName)
EXTERNAL hasFlag(flagName)
EXTERNAL setFlag(flagName, value)
EXTERNAL setCounter(counterName, value)

-> MAIN

== MAIN ==

{ hasFlag("talked_to_bound_one"):
    "You're back."
- else:
    He groans. A rasp of a voice follows.\n\n\"Another dreamer, then. Or… are you something worse?\"
}

+ [Ask about his past]
    ~ setFlag("talked_bound_one_past", true)
    -> PAST_START

+ [Ask what he sees in you]
    ~ setFlag("talked_bound_one_self", true)
    -> YOU_START

+ [Offer help]
    ~ setFlag("talked_bound_one_help", true)
    -> HELP_START

+ [Leave]
    -> LEAVE

== PAST_START ==
Chainer Prisoner: "You want to know what I was before the chains. Curious."

* [Yes. Who were you?]
    -> PAST_IDENTITY

* [What did you do to end up here?]
    -> PAST_CRIME

* [Change your mind]
    -> MAIN

== PAST_IDENTITY ==
Chainer Prisoner: "I was a guard. A brother. A believer. All three. None, maybe."

* [A believer in what?]
    -> PAST_BELIEVER

* [You don't sound sure.]
    -> PAST_REGRET

== PAST_BELIEVER ==
Chainer Prisoner: "In the Mask. In the Eye. In the lie. Whatever name you give it."

* [So you followed Ossaneth?]
    -> PAST_FOLLOWED

* [You think it was a lie now?]
    -> PAST_DISILLUSION

== PAST_FOLLOWED ==
Chainer Prisoner: "I didn’t follow. I knelt. That was the mistake."

-> PAST_WRAPUP

== PAST_DISILLUSION ==
Chainer Prisoner: "The truth's a blade. Sharp when you grip it too long."

-> PAST_WRAPUP

== PAST_REGRET ==
Chainer Prisoner: "Would you be sure, after years in chains?"

-> PAST_WRAPUP

== PAST_CRIME ==
Chainer Prisoner: "I tried to run. That’s all it takes. That’s all it ever takes."

* [Run from what?]
    -> PAST_RUN

== PAST_RUN ==
Chainer Prisoner: "From it. From the Eye. From what I saw in myself when it stared back."

-> PAST_WRAPUP

== PAST_WRAPUP ==
Chainer Prisoner: "There’s nothing back there but broken promises and broken me."
-> MAIN

== YOU_START ==
Chainer Prisoner: "I see the weight in your eyes. Not yet a burden, but close."

* [What do you mean?]
    -> YOU_MEANING

* [You don’t know me.]
    -> YOU_REJECT

== YOU_MEANING ==
~ temp guilt = getPlayerStat("guilt")
{ guilt >= 2:
    Chainer Prisoner: "I see guilt. You wear it like a second skin. Heavy, isn’t it?"
- else:
    Chainer Prisoner: "You haven’t broken anything yet. That’s good. Or maybe you just haven’t looked close enough."
}

* [Is it too late to change?]
    -> YOU_CHANGE

* [And what about you?]
    -> YOU_REFLECT

== YOU_CHANGE ==
Chainer Prisoner: "No. But it gets harder. Every time you bleed, you heal uglier."

-> MAIN

== YOU_REFLECT ==
Chainer Prisoner: "Me? I'm a mirror. You talk to me, but you’re only ever talking to yourself."

-> MAIN

== YOU_REJECT ==
Chainer Prisoner: "Maybe. But I’ve seen enough to guess. You're not the first to wear that mask."

-> MAIN

== HELP_START ==
~ temp resolve = getPlayerStat("resolve")

Chainer Prisoner: "Help? A word lighter than the chain you’ll have to break."

* [I can try.]
    { resolve >= 3:
        -> HELP_TRY
    - else:
        -> HELP_FAIL
    }

* [You're right. I can’t.]
    -> HELP_DENY

== HELP_TRY ==
Chainer Prisoner: "Then try. But remember, pain listens better than mercy."

[You grip a link. Heat burns through your skin as you pull, pull, pull.]

[One chain shatters.]

Chainer Prisoner: "You... you did it. One chain."

-> MAIN

== HELP_FAIL ==
Chainer Prisoner: "No. You can't. Not yet. You’d snap before the metal does."

-> MAIN

== HELP_DENY ==
Chainer Prisoner: "Then you understand. Kindness is often a cruelty to both."

-> MAIN

== LEAVE ==
~ temp past = hasFlag("talked_bound_one_past")
~ temp self = hasFlag("talked_bound_one_self")
~ temp help = hasFlag("talked_bound_one_help")

{ 
- past and self and help:
    Chainer Prisoner: "You asked, you listened, and you tried. Maybe that’s all we’re ever meant to do. Not to save — but to understand."
- past and self:
    Chainer Prisoner: "You dug into the rot and stared into the mirror. That’s more than most. If the chains break, it’ll be because of people like you."
- past and help:
    Chainer Prisoner: "You learned what made me. Then you tried to unmake it. Be careful — chains aren't the only thing that snap."
- self and help:
    Chainer Prisoner: "You looked into me and saw yourself. Then tried to help. That’s dangerous, but… noble, maybe."
- past:
    Chainer Prisoner: "You asked about the past. That’s a beginning. Don’t stop there."
- self:
    Chainer Prisoner: "You tried to understand yourself through me. Just be careful how deep you dig."
- help:
    Chainer Prisoner: "You tried to help. That’s rare. Don’t let this world burn that out of you."
- else:
    Chainer Prisoner: "You came, stared, and left. Like all the rest. If you ever come back — come back as more."
}

~ setFlag("talked_to_bound_one", true)

You're back at the foot of the slope.
-> END
