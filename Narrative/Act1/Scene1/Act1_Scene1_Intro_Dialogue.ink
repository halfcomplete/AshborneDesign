EXTERNAL playerForceMask(maskName)
EXTERNAL setFlag(key, value)
EXTERNAL setCounter(key, value)
EXTERNAL getLabel(key)
EXTERNAL setLabel(key, value)
EXTERNAL setSilentPath(silentPath, silentMs)
VAR questionsAsked = 0

-> INTRO

== INTRO ==
3300__PAUSE__
#slow:42
You wake.
__NL__
2000__PAUSE__

The stone beneath you is cold — cold like ice, swallowing what little light survives in the room. Painful chains bite into your limbs, each link like a ravenous snake.

1500__PAUSE__

900__PAUSE__
__NL__
#slow:38
What… where… am I? you think.
__NL__
900__PAUSE__
#slow:35
Your thoughts crawl, sluggish, like insects trapped in glue.

1200__PAUSE__

#slow:26
Three hooded figures surround you.

1500__PAUSE__
__NL__
#slow:30
One of them speaks, voice low and certain. “It wakes.”

800__PAUSE__
__NL__

#slow:25
Another voice comes from your left. “Does it know its name?”
500__PAUSE__
#slow:23
This one is curious, almost clinical. The owner’s eyes glow an icy blue in the darkness, piercing you.
1400__PAUSE__
__NL__
#slow:28
Your head throbs.
1300__PAUSE__
__NL__
A clipped, scornful scoff cuts through the air.
200__PAUSE__
#slow:26
“That matters not, Truth,” growls the figure on your right, where a pair of red eyes burns into you.

7140__PAUSE__
#slow:24
__NL__
You feel weak.
__NL__
800__PAUSE__
The person in front raises a calming hand. “Peace, Mercy. Peace.”

__NL__
200__PAUSE__
The red brightens — then dulls — in a sudden flash.
300__PAUSE__
#slow:29
Mercy clears his throat. “Deepest apologies, Judgement.”

__NL__
The figure called Judgement turns back to you.
600__PAUSE__
#slow:26
“Speak,” he says. “Do you remember your name?”
400__PAUSE__

1000__PAUSE__

~ setSilentPath("CHOOSE_NAME_SILENT_ONE", 12000)
-> CHOOSE_NAME

== CHOOSE_NAME ==
* [Say your name]
    -> INPUT_NAME

* ["N-no."]
    Your throat aches as you force out the words.
    #slow:30
    “N-no.”
    
    400__PAUSE__
    A wicked laugh spills from the right. “Of course it doesn’t remember!”

    “Or…” Truth tilts their head. “Perhaps it chooses not to. Fascinating.”
    Another spike of pain lances through your skull from the left. You wince.
    200__PAUSE__
    Only Truth seems to notice — or care.

    “No matter what, keep in mind that’s why it was chosen,” Judgement says.

    Mercy and Truth murmur in agreement.
    500__PAUSE__
    A church bell tolls faintly in the distance, muffled. The sound echoes inside your mind, bouncing through the emptiness where memories should be.
    Truth’s voice sharpens with delight. “Ah! It is almost time. Before you leave us, would you like to ask a question? We won’t lie — but there are some things you’re better off not knowing.”

    Your mind races. What should you ask them?
    -> QUESTION
    
== CHOOSE_NAME_SILENT_ONE ==
__NL__
You say nothing, instead meeting Judgement’s gaze.
300__PAUSE__
__NL__
#slow:32
His eyes are cold. Still. Lifeless.
200__PAUSE__
A wave of sickness passes through you as hallucinations flash — fractured moments of a life you can no longer name. 
__NL__
You can’t hold his stare. But you know, somehow, those white eyes will linger in yours forever… always watching. Always judging.
1000__PAUSE__
__NL__
#slow:26
Mercy steps closer, his eyes flaring flame-red. “We don’t have all night. Speak, mortal.”
~ setSilentPath("CHOOSE_NAME_SILENT_TWO", 13000)
-> CHOOSE_NAME

// == CHOOSE_NAME_SILENT_TWO ==
__NL__
You remain quiet, teeth gritted, convinced this is the right path.
__NL__
Mercy steps back.
__NL__
Judgement’s voice is calm. “Silent, are you?”

Mercy chuckles darkly. “He must’ve forgotten how to speak as well.”

Truth tilts his head. “Or perhaps he chooses not to.”

500__PAUSE__
__NL__
A muffled church bell tolls again.
Truth brightens. “Ah! It is almost time. Before you leave us, would you like to ask a question? We won’t lie — but there are some things you’re better off not knowing.”

Your mind races. What should you ask them?
~ setSilentPath("QUESTION_SILENT_ONE", 10000)
-> QUESTION

== SAY_NAME_SILENT_ONE ==
You stay still. Your mouth refuses to open.
Why should I answer them? Who even are they?
300__PAUSE__
Mercy’s voice cuts through your thoughts. “We don’t have all night. Speak, mortal.”
Your eyes widen. Mortal?
~ setSilentPath("CHOOSE_NAME_SILENT_TWO", 5000)
-> INPUT_NAME

== SAY_NAME_SILENT_TWO ==
You remain still, as silent as a corpse.

Judgement studies you. “Silent, are you?”

Mercy hums. “Perhaps he does not remember.”

Truth leans closer. “Or perhaps he chooses not to.”

500__PAUSE__
A distant church bell tolls, muffled.
Truth’s tone quickens. “Ah! It is almost time. Before you leave us, would you like to ask a question? We won’t lie — but there are some things you’re better off not knowing.”

Your mind races. What should you ask them?
-> QUESTION

== INPUT_NAME ==
~ setSilentPath("SAY_NAME_SILENT_ONE", 25000)
__GET_PLAYER_INPUT__
~ temp player_name = getLabel("player.input")

__NL__
#slow:28
You groan. “{player_name}…” The sound barely escapes your cracked throat.
400__PAUSE__
Judgement repeats it softly. “{player_name}?”
400__PAUSE__

__NL__
Mercy’s smirk is sharp and venomous. “A humorous answer! It names ghosts now.”

__NL__
Truth whispers, “I believe it thinks it remembers. There is no such thing as lying, child.”

__NL__
#slow:30
Your head pounds again. The pain is getting worse.
__NL__

#slow:22
“Indeed,” Judgement says. “Lying only worsens a person’s image.”
1200__PAUSE__
__NL__
17<~>Suddenly,</~> a church bell tolls again, low and ominous.
500__PAUSE__
#slow:29
Truth’s voice rises. “Ah! It is almost time. Before you leave us, would you like to ask a question? We won’t lie — but there are some things you’re… better off not knowing.”

__NL__
600__PAUSE__
Your mind races. What should you ask them?
400__PAUSE__
~ setSilentPath("QUESTION_SILENT_ONE", 17000)
-> QUESTION

== QUESTION ==
* ["Who... who are you?"]
    -> WHO
    
* ["What is this place?"]
    -> WHAT

* ["Why am I here?"]
    -> WHY
    
* ["What... are you going to do to me?"]
    -> LEAVE

== QUESTION_SILENT_ONE ==
__NL__
Judgement’s voice cuts in. “Hasten.”
__NL__
~ setSilentPath("QUESTION_SILENT_TWO", 8000)
-> QUESTION

== QUESTION_SILENT_TWO ==
__NL__
Truth says, “You’re too slow. There’s no time left.”
__NL__
Mercy adds, “The procedure must start soon.”
-> FINAL

== LEAVE ==
{ questionsAsked == 0:
    You swallow hard, your voice faltering. “What… are you going to do to me?”
- else:
    You swallow hard, then speak. “What… are you going to do to me?”
}

~ questionsAsked += 1
    
400__PAUSE__
Mercy’s eyes narrow. “Is that your question?”
__NL__
+ ["Yes."]
    You straighten slightly. “Yes.”
    __NL__
    300__PAUSE__
    Truth’s voice is tinged with disappointment. “A terrible question. You’ll find out anyway.”
    -> FINAL
+ ["No."]
    Doubt coils in your gut. “No…”
    200__PAUSE__
    __NL__
    Mercy’s tone sharpens. “Well then, what is it? We’re running out of time.”
    -> QUESTION

== WHO ==
{ questionsAsked == 0:
    You swallow. “Who… who are you?”
- else:
    You swallow again. “Who… who are you?”
}
400__PAUSE__
Mercy tilts his head. “Is that your question?”
__NL__
+ ["Yes."]
    “Yes.” Your voice is steadier now.
    __NL__
    300__PAUSE__
    Truth nods. “Hmm… an intriguing question.”
    700__PAUSE__
    Judgement answers, “You may call us the Witnesses.”
    700__PAUSE__
    Mercy finishes, “For we are witnesses to all: death, birth, and everything in-between.”
    700__PAUSE__
    -> FINAL
+ ["No."]
    “No…”
    200__PAUSE__
    __NL__
    Mercy’s voice grows impatient. “Well then, what is it? We’re running out of time.”
    -> QUESTION

== WHAT ==
{ questionsAsked == 0:
    You swallow. “What is this place?”
- else:
    You swallow again. “What is this place?”
}

~ questionsAsked += 1

400__PAUSE__
Mercy asks, “Is that your question?”
__NL__
+ ["Yes."]
    “Yes.”
    300__PAUSE__
    Truth considers. “Hmm… an intriguing question.”
    200__PAUSE__
    Mercy shrugs. “We’re not sure either.”
    Judgement adds, “The Mask chose our meeting place. It was not our decision.”
    -> FINAL
+ ["No."]
    “No…”
    200__PAUSE__
    Mercy presses, “Well then, what is it? We’re running out of time.”
    -> QUESTION

== WHY ==
{ questionsAsked == 0:
    You swallow. “Why am I here?”
- else:
    You swallow again. “Why am I here?”
}

~ questionsAsked += 1

400__PAUSE__
Mercy asks, “Is that your question?”
__NL__
+ ["Yes."]
    “Yes.”
    300__PAUSE__
    Truth says, “An intriguing question.”
    Judgement states, “You are here because you were chosen.”
    200__PAUSE__
    Mercy adds, “It was not our decision. If it was, you wouldn’t be with us.”
    
    __NL__
    Judgement snaps, “Do not question the Mask!”
    100__PAUSE__
    Mercy bows slightly. “Deepest apologies, Judgement.”
    -> FINAL
+ ["No."]
    “No…”
    200__PAUSE__
    Mercy says sharply, “Well then, what is it? We’re running out of time.”
    -> QUESTION

== FINAL ==
__NL__
#slow:36
Silence settles over the room.
3000__PAUSE__

#slow:24
“Finally. It’s time,” Judgement says. “Let us end this… meeting.”

1000__PAUSE__

#slow:32
A hush falls.

500__PAUSE__
__NL__
Judgement steps forward, drawing something from the folds of his robe.

A mask — darker than the void itself, patterned with countless white eyes — glints faintly.

1000__PAUSE__
It’s forced onto your face before you can recoil.

500__PAUSE__

-> OSSANETH_MASK

== OSSANETH_MASK ==
~ playerForceMask("Ossaneth")

__NL__
#slow:28
You cannot resist. It binds to you, like an old scar reopening.
#slow:30
Cold swallows your vision. The floor tilts.

You try to cry, to shout, to scream… but your tongue has forgotten the shape of sound.

__NL__
#slow:25
A voice coils in the back of your thoughts — smooth, flat, unbearably close.
__NL__
#slow:34
“Call me Ossaneth, the Unblinking Eye.”

#slow:27
“I see what is, what was, and what shall be. And now you shall too.”

2000__PAUSE__
#slow:38
“Share in the Sight, friend.”

1000__PAUSE__
__NL__
#slow:38
You faint.
~ setFlag("player.received_ossaneth", true)
~ setCounter("player.masks_count", 1)
~ setCounter("player.scenes_count", 1)
~ setCounter("player.talked_to_witnesses_count", 1)

4000__PAUSE__
__END__
-> END

== function setFlag(key, value) ==
~ return

== function playerForceMask(maskName) ==
~ return

== function setCounter(key, value) ==
~ return

== function getLabel(key) ==
~ return

== function setLabel(key, value) ==
~ return

== function setSilentPath(silentPath, silentMs) ==
~ return
