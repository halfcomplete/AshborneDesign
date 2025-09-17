EXTERNAL playerForceMask(maskName)
EXTERNAL setFlag(key, value)
EXTERNAL setCounter(key, value)
EXTERNAL getLabel(key)
EXTERNAL setLabel(key, value)
EXTERNAL setSilentPath(silentPath, silentMs)
VAR questionsAsked = 0

-> INTRO

== INTRO ==
2640__PAUSE__
#slow:38
You wake.
__NL__
1700__PAUSE__

The stone beneath you is cold, not unlike ice. It consumes what little light is in the room. Painful chains surround you and bite into your limbs, like ravenous snakes.

1275__PAUSE__
765__PAUSE__
__NL__
#slow:32
<i>What... where... am I?</i> 26<~>you think.</~>
__NL__
765__PAUSE__
#slow:27
Your thoughts move like insects in glue; 23<~>they feel trapped, with no end in sight.</~> Trapped. Just like you.

1020__PAUSE__

#slow:16
Three hooded figures surround you.

1275__PAUSE__
__NL__
#slow:25
"It wakes."

680__PAUSE__
__NL__

#slow:20
Another voice drifts from your left. 26<~>"Does it know its name?"</~>
425__PAUSE__
#slow:18
A pair of blue eyes glint faintly, locked on you without blinking.
1190__PAUSE__
__NL__
#slow:23
Your head hurts.
1105__PAUSE__
__NL__
#slow:19
A scoff from your right — low, sharp, and dripping with disdain. Red eyes burn faintly in the dark.  
"Why waste time, we—"
__NL__
#slow:18
"Peace."  
The center figure’s tone cuts the air clean in half. The others fall silent instantly.

#slow:19
The one in the middle fixes you with a stare so steady you shiver, 16<~>though not from the cold. </~>
"Speak. Do you remember your name?"

850__PAUSE__

~ setSilentPath("CHOOSE_NAME_SILENT_ONE", 12000)
-> CHOOSE_NAME

== CHOOSE_NAME ==
* [Say your name]
    -> INPUT_NAME

* ["N-no."]
    Your throat hurts as you speak.
    #slow:23
    "N-no."
    
    340__PAUSE__
    The red-eyed one lets out a sharp, wicked laugh. "Told you it wouldn't remember, Truth."
    A glance from the center stops him.
    
    Truth tilts their head, studying you as if pinned to glass. "Or perhaps it chooses not to. Fascinating."
    Your head throbs again — sharper this time, a spike of pain from the left.
    190__PAUSE__
    Only Truth seems to notice — or care.

    "Either way," the center figure says, voice even but unyielding, "that’s why it was chosen."

    They murmur to each other — fragments of names escape into your ears:
    <i>a firm 'Mercy' to the one with red eyes,</i>
    <i>a sharp 'Truth' to the corner, almost curious,</i>
    <i>and to the center one, sharp as a knife, the echo of 'Judgement'.</i>

    425__PAUSE__
    Somewhere far away, a church bell tolls, muffled but echoing in your skull.  
    Truth exhales sharply. "Ah. It is almost time. Before you leave us, would you like to ask a question? We will not lie — but there are things you may wish you’d never know."
    
    Your mind races. <i>What should you ask them?</i>
    -> QUESTION

== CHOOSE_NAME_SILENT_ONE ==
__NL__
You say nothing, holding the center figure’s gaze.
255__PAUSE__
__NL__
#slow:26
It's cold. Still. 32<~>Lifeless.</~>
190__PAUSE__
Images surge unbidden — flickers of a past life, blurred and fading before you can grasp them.
__NL__
You break the stare at last, but the white glow of those eyes has burned itself into your vision. 26<~>Forever watching. Forever judging.</~>
850__PAUSE__
__NL__
#slow:21
The red-eyed one steps forward, eyes flaring brighter. 17<~>"We don't have all night, mortal. Speak."</~>  
~ setSilentPath("CHOOSE_NAME_SILENT_TWO", 13000)
-> CHOOSE_NAME

== CHOOSE_NAME_SILENT_TWO ==
__NL__
You keep your mouth shut, jaw set tight.
__NL__
Mercy chuckles. "Lost its voice as well."  
A sharp look from the center stops him cold.
__NL__
The blue-eyed one — Truth, perhaps? — speaks quietly. "Or perhaps it chooses silence."  
__NL__
Even in your silence, their names linger in thought: Mercy, Truth, Judgement.
-> QUESTION_INTRO

== INPUT_NAME ==
~ setSilentPath("SAY_NAME_SILENT_ONE", 25000)
__GET_PLAYER_INPUT__:What is your name?
~ temp player_name = getLabel("player.input")

__NL__
#slow:23
You groan. 30<~>"{player_name}..."</~> Your dry throat barely croaks out the word.
340__PAUSE__
28<~>"{player_name}?"</~> the center figure repeats, tasting the syllables.
340__PAUSE__

__NL__
Mercy smirks, cruel and amused. 23<~>"A ghost’s name. How quaint."</~>

__NL__
Truth tilts their head. 24<~>"I believe it thinks</~> it remembers. But lies are impossible, child," they whisper.

__NL__
#slow:27
Pain blooms again behind your eyes — stronger this time.
__NL__

#slow:17
"Indeed," 21<~>Judgement says.</~> "Falsehood only stains what little image one has left."
1020__PAUSE__
__NL__
Even as you speak, you catch the faint syllables again — Mercy, Truth, Judgement — their names etched into memory.
-> QUESTION_INTRO

== QUESTION_INTRO ==
__NL__
425__PAUSE__
A church bell rings in the distance, muffled.
Truth exhales, almost wistful. "Ah. It is almost time. Before you leave us, would you like to ask a question? We will not lie — but there are things you may wish you’d never know."

Your mind races. What should you ask them?
~ setSilentPath("QUESTION_SILENT_ONE", 10000)
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
"Hasten."
__NL__
~ setSilentPath("QUESTION_SILENT_TWO", 8000)
-> QUESTION

== QUESTION_SILENT_TWO ==
__NL__
Truth says, "You're too slow. There's no time left."
__NL__
Mercy says, "The procedure must start soon."
-> FINAL

== LEAVE ==
{ questionsAsked == 0:
    You gulp, having decided what to ask.
    You, hestitant: "What... are you going to do to me?"
- else:
    [You gulp, having finally decided what to ask.]
    You: "What... are you going to do to me?"
}

~ questionsAsked += 1
    
340__PAUSE__
Mercy asks, "Is that your question?"
__NL__
+ ["Yes."]
    You, confident: "Yes."
    __NL__
    255__PAUSE__
    Truth, disappointed: "A terrible question. You'll find out anyway."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    __NL__
    90__PAUSE__
    You: "No..."
    190__PAUSE__
    __NL__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION

== WHO ==
{ questionsAsked == 0:
    You gulp, having decided what to ask.
    #slow:22
    "Who... who are you?"
- else:
    [You gulp, having finally decided what to ask.]
    You: "Who... who are you?"
}
340__PAUSE__
"Is that your question?" asks Mercy.
__NL__
+ ["Yes."]
    #slow:25
    "Yes." Your voice grows stronger.
    __NL__
    255__PAUSE__
    #slow:24
    "Hmm... an intriguing question," Truth says.
    595__PAUSE__
    __NL__
    #slow:24
    Judgement answers. "You may call us the Witnesses."
    __NL__
    595__PAUSE__
    #slow:24
    "For we are witnesses to all: death, birth and everything in-between," Mercy finishes.
    595__PAUSE__
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    __NL__
    90__PAUSE__
    You: "No..."
    190__PAUSE__
    __NL__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION

== WHAT ==
{ questionsAsked == 0:
    [You gulp, having decided what to ask.]
    You, hestitant: "What is this place?"
- else:
    [You gulp, having finally decided what to ask.]
    You: "What is this place?"
}

~ questionsAsked += 1

340__PAUSE__
Mercy asks, "Is that your question?"
__NL__
+ ["Yes."]
    You, confident: "Yes."
    255__PAUSE__
    __NL__
    Truth says, "Hmm... an intriguing question."
    __NL__
    190__PAUSE__
    Mercy says, "We're not sure either."
    __NL__
    Judgement says, "The Mask chose our meeting place. It was not our decision."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    90__PAUSE__
    __NL__
    You: "No..."
    190__PAUSE__
    __NL__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION

== WHY ==

{ questionsAsked == 0:
    [You gulp, having decided what to ask.]
    You, hestitant: "Why am I here?"
- else:
    [You gulp, having finally decided what to ask.]
    You: "Why am I here?"
}

~ questionsAsked += 1

340__PAUSE__
Mercy asks, "Is that your question?"
__NL__
+ ["Yes."]
    You, confident: "Yes."
    255__PAUSE__
    Truth says, "An intriguing question."
    Judgement says, "You are here because you were chosen."
    190__PAUSE__
    Mercy says, "It was not our decision. If it was, you wouldn't be with us."
    
    __NL__
    [The white eyes blind you.]
    __NL__
    slow:16
    Judgement, snapping: "Do not question that of the Mask!"
    90__PAUSE__
    Mercy, bowing: "Deepest apologies, Judgement."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    __NL__
    90__PAUSE__
    __NL__
    You: "No..."
    190__PAUSE__
    __NL__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION
    
    


== FINAL ==
__NL__
#slow:31
There is silence.
2550__PAUSE__

#slow:20
"Finally. It's time," says Judgement. "Let us end this... meeting."

850__PAUSE__

#slow:29
A hush falls.

425__PAUSE__
__NL__
After a bit, Judgement steps forward, drawing something from the folds of their robe.

They hold a mask, darker than the void itself, dotted with depictions of white eyes.

850__PAUSE__
It's forced on your face before you can recoil.

425__PAUSE__

-> OSSANETH_MASK

== OSSANETH_MASK ==
~ playerForceMask("Ossaneth")

__NL__
#slow:26
You cannot resist. It binds to you, like an old scar reopening.
#slow:28
Cold floods your vision. The floor tilts.

You try to cry, to shout, to scream... but your tongue has forgotten the shape of sound.

__NL__
#slow:24
A voice curls behind your thoughts — smooth, flat, and unbearably near.
__NL__
#slow:30
"Call me Ossaneth, the Unblinking Eye."

#slow:25
"I see what is, what was, and what shall be. And now you shall too."

1700__PAUSE__
#slow:26
"Share in the Sight, friend."

850__PAUSE__
__NL__
#slow:32
You faint.
~ setFlag("player.received_ossaneth", true)
~ setCounter("player.masks_count", 1)
~ setCounter("player.scenes_count", 1)
~ setCounter("player.talked_to_witnesses_count", 1)

3200__PAUSE__
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
