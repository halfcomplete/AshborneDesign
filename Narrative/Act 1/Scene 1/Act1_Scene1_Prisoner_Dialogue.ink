EXTERNAL getPlayerStat(statName)
EXTERNAL hasFlag(flagName)
EXTERNAL setFlag(flagName, value)
EXTERNAL setCounter(counterName, value)

-> MAIN

== MAIN ==

{ hasFlag("talked_to_bound_one"):
    "You're back."
- else:
    "He groans. A rasp of a voice follows.\n\n\"Another dreamer, then. Or… are you something worse?\""
}

+ [Who are you?]
    -> FORGOT

+ [Why are you bound?] 
    -> WHY

+ [Can I help?]
    -> HELP

+ [Are you like me?] 
    -> LIKE_ME

+ [Say nothing] 
    "..."
    "He chuckles — dry and hollow. \"I did that once, too. Didn't help.\""
    -> MAIN

+ [Leave]
    -> LEAVE

== FORGOT ==
~ temp wasAsked = hasFlag("asked_bound_one_identity")
{ wasAsked:
    Chainer Prisoner: "Again? You think I remembered while you were gone?"
- else:
    Chainer Prisoner: "I don't remember. That’s what they took first."
    ~ setFlag("asked_bound_one_identity", true)
}
-> MAIN

== WHY ==
~ temp wasAsked = hasFlag("asked_bound_one_why")
{ wasAsked:
    Chainer Prisoner: "Chains still here, aren’t they? You think I lied the first time?"
- else:
    Chainer Prisoner: "Because I tried to leave. The mask doesn’t like disobedience. Neither does the one wearing it."
    ~ setFlag("asked_bound_one_why", true)
}
-> MAIN

== HELP ==
~ temp resolve = getPlayerStat("resolve")
~ temp wasAsked = hasFlag("asked_bound_one_help")

{ resolve >= 3:
    { wasAsked:
        Chainer Prisoner: "Still trying? Or just guilty now? Fine. If you must…"
    - else:
        Chainer Prisoner: "You could try. But you won’t. They all break before the second link.\nStill… there's strength in you. The chains stir when you're near."
        ~ setFlag("asked_bound_one_help", true)
    }

    * [Try to help him now]
        ~ setFlag("freed_bound_one", true)
        ~ setCounter("resolve", resolve + 1)
        [You pull — the first chain shudders, then snaps. The figure gasps.]
        Chainer Prisoner: "You… did it. One link. Maybe that's all I needed."
        -> FREED_DIALOGUE
    * [Walk away]
        Chainer Prisoner: "Thought so."
        -> MAIN

- else:
    { wasAsked:
        Chainer Prisoner: "Still not ready. Come back when you are."
    - else:
        Chainer Prisoner: "Don’t. Mercy is heavier than my chains. Come back when you're willing to bleed."
        ~ setFlag("asked_bound_one_help", true)
    }
    -> MAIN
}

== FREED_DIALOGUE ==
~ temp askedWhoBound = hasFlag("freed_asked_who_bound")
~ temp askedWhatHappens = hasFlag("freed_asked_what_happens")

{ askedWhoBound == false:
    * [Who bound you?]
        Chainer Prisoner: "Truth. Order. Mercy. Maybe all three. Or maybe it was me. [He chuckles slightly.] Hard to tell the difference when the chains are this tight."
        ~ setFlag("freed_asked_who_bound", true)
        -> FREED_DIALOGUE
- else:
    * [Who bound you?]
        Chainer Prisoner: "Still wondering who to blame, huh? Some chains are tighter when you know the name."
        -> FREED_DIALOGUE
}

{ askedWhatHappens == false:
    * [What happens now?]
        Chainer Prisoner: "Now I wait again. For the rest of them to snap. Or maybe… I wake up. Or maybe I don't. Does it really matter anymore?"
        ~ setFlag("freed_asked_what_happens", true)
        -> FREED_DIALOGUE
- else:
    * [What happens now?]
        Chainer Prisoner: "You already know what happens. Why ask again — hoping the answer's changed?"
        -> FREED_DIALOGUE
}

* [Leave]
    -> LEAVE



== LIKE_ME ==
~ temp guilt = getPlayerStat("guilt")
~ temp wasAsked = hasFlag("asked_bound_one_likeme")

{ wasAsked:
    Chainer Prisoner: "Looking for connection again? You won’t find it in chains."
- else:
    ~ setFlag("asked_bound_one_likeme", true)
    { guilt >= 2:
        Chainer Prisoner: "No. You still care. That’s what makes you different. For now."
    - else:
        Chainer Prisoner: "Maybe. But I’m further down the path. The stones weigh heavier here."
    }
}
-> MAIN

== LEAVE ==
~ temp alreadyLeftBefore = hasFlag("left_bound_one_before")
~ temp askedWho = hasFlag("asked_bound_one_identity")
~ temp askedWhy = hasFlag("asked_bound_one_why")
~ temp askedHelp = hasFlag("asked_bound_one_help")
~ temp askedLikeMe = hasFlag("asked_bound_one_likeme")
~ temp freed = hasFlag("freed_bound_one")

~ temp curiosityLevel = 0
{ askedWho:
    ~ curiosityLevel++
}

{ askedWhy:
    ~ curiosityLevel++
}

{ askedHelp:
    ~ curiosityLevel++
}

{ askedLikeMe:
    ~ curiosityLevel++
}

{ alreadyLeftBefore:
    { freed:
            Chainer Prisoner: "You pulled one chain. Maybe that's enough to remind me what freedom tastes like."
        - else:
            { curiosityLevel == 0:
                Chainer Prisoner: Thanks
            curiosityLevel == 1:
                Chainer Prisoner: "One question, and you're gone? The chains aren’t the only thing that binds."
            - curiosityLevel == 2:
                Chainer Prisoner: "You’re uncertain. I see it. Maybe you're afraid of what you'd become if you listened too long."
            - curiosityLevel >= 3:
                Chainer Prisoner: "You asked. You listened. That's rarer than freedom. Don’t lose it."
            }
        }
        ~ setFlag("left_bound_one_before", true)
- else:
    { freed:
        Chainer Prisoner: "You pulled one chain. Maybe that's enough to remind me what freedom tastes like."
    - else:
        { curiosityLevel == 0:
            Chainer Prisoner: Thanks
        - curiosityLevel == 1:
            Chainer Prisoner: "One question, and you're gone? The chains aren’t the only thing that binds."
        - curiosityLevel == 2:
            Chainer Prisoner: "You’re uncertain. I see it. Maybe you're afraid of what you'd become if you listened too long."
        - curiosityLevel >= 3:
            Chainer Prisoner: "You asked. You listened. That's rarer than freedom. Don’t lose it."
        }
    }
    ~ setFlag("left_bound_one_before", true)
}

~ setFlag("talked_to_bound_one", true)
You're back at the foot of the slope.
-> END
