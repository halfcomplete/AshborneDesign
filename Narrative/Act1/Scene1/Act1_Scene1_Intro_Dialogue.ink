EXTERNAL playerForceMask(maskName)
EXTERNAL setFlag(key, value)
EXTERNAL setCounter(key, value)
EXTERNAL getLabel(key)
EXTERNAL setLabel(key, value)
EXTERNAL setSilentPath(silentPath, silentMs)

-> INTRO

== INTRO ==
#slow:50
[You wake.]

2000__PAUSE__

#slow:35
[The stone beneath you is cold, not unlike ice — but black, ancient. It consumes what little light is in the room.]

1500__PAUSE__

#slow:25
[Chains bite into your wrists. Your ankles. You try to move, but your entire body is pinned down. The only thing that can move is your head.]

900__PAUSE__
You: (thinking) "What... where... am I?"

#slow:40
[Your thoughts move like insects in glue.]

2000__PAUSE__

[Three hooded figures surround you, each cloaked in darkness.]

1500__PAUSE__

#slow:45
[From in front, a voice as dry as leaves breaks the silence.]

200__PAUSE__
#slow:20
"He wakes."

500__PAUSE__

Left: "Does he know his name?"
[It's curious. Questioning. It's eyes, glowing blue against the darkness, peer into your skull.]
400__PAUSE__
#slow:20
[Your head hurts.]

[A scoff from your right. This time, clipped, scornful.]
"That matters not, Truth."
[It comes from the figure on your right. A pair of red eyes are staring you down.]
400__PAUSE__
#slow:20
[You feel weak.]

300__PAUSE__
From the front: "Peace, Mercy. Peace."

200__PAUSE__
[The red brightens, then flickers to a dull orange.]
300__PAUSE__
Mercy: "Deepest apologies, Judgement."

#slow:30
Judgement: "You."
400__PAUSE__
"Speak. Do you remember your name?"

1000__PAUSE__

~ setSilentPath("CHOOSE_NAME_SILENT_ONE", 8000)
-> CHOOSE_NAME

== CHOOSE_NAME ==
* [Say your name]
    -> INPUT_NAME

* ["N-no."]
    [Your throat hurts as you speak.]
    #slow:26
    You: "N-no."
    
    400__PAUSE__
    Mercy: "Of course he doesn't remember."
    
    Truth: "Or perhaps he chooses not to. Fascinating."
    [Your head hurts once more. This time, a spike of pain from your left makes you wince.]
    200__PAUSE__
    [Only Truth seems to notice — or care.]
    
    Judgement: "No matter what, keep in mind that that’s why he was chosen."

    [Mercy and Truth mumble in agreement.]
    500__PAUSE__
    [A church bell rings in the distance, muffled.]
    Truth, excited: "Ah! It is almost time. Before you leave us, would you like to ask a question? We won't lie — but there's some things you're better off not knowing."
    
    [Your mind races. What should you ask them?]
    -> QUESTION
    
== CHOOSE_NAME_SILENT_ONE ==
[You say nothing, instead leveling your eyes with Judgement's.]
300__PAUSE__
[They are cold. Still. Lifeless.]
200__PAUSE__
[You feel sick as you hallucinate scenes of past, every moment of what you were before flashing by your mind.]
#slow:20
[You can't hold the glare any longer. But the white eyes of Judgement have already burned themselves into your eyes, and somehow you know that they'll be there forever, always watching, always judging.]
1000__PAUSE__
[Mercy steps closer, eyes flaring flame-red.]
Mercy: "We don't have all night. Speak, mortal."
~ setSilentPath("CHOOSE_NAME_SILENT_TWO", 5000)
-> CHOOSE_NAME

== CHOOSE_NAME_SILENT_TWO ==
[You remain quiet, gritting your teeth and convincing yourself this is the right way.]
[Mercy steps back.]
Judgement: "Silent, are you?"

Truth: "Perhaps he does not remember."

Mercy: "Or perhaps he chooses not to."

 500__PAUSE__
[A church bell rings in the distance, muffled.]
Truth, excited: "Ah! It is almost time. Before you leave us, would you like to ask a question? We won't lie — but there's some things you're better off not knowing."

[Your mind races. What should you ask them?]
-> QUESTION

== SAY_NAME_SILENT_ONE ==
[You stay still.]
300__PAUSE__
Mercy: "We don't have all night. Speak, mortal."
~ setSilentPath("CHOOSE_NAME_SILENT_TWO", 5000)
-> INPUT_NAME

== SAY_NAME_SILENT_TWO ==
[You remain quiet, your mind panicking.]
You, thinking: "What is my name? Why... why can't I remember it?"

Judgement: "Silent, are you?"

Truth: "Perhaps he does not remember."

Mercy: "Or perhaps he chooses not to."

500__PAUSE__
[A church bell rings in the distance, muffled.]
Truth, excited: "Ah! It is almost time. Before you leave us, would you like to ask a question? We won't lie — but there's some things you're better off not knowing."

[Your mind races. What should you ask them?]
-> QUESTION

== INPUT_NAME ==
~ setSilentPath("SAY_NAME_SILENT_ONE", 20000)
__GET_PLAYER_INPUT__
~ temp player_name = getLabel("player.input")

#slow:25
You: "{player_name}..."

Judgement: "{player_name}?"

[Mercy chuckles, an evil, vile laugh that corrupts the room.]

200__PAUSE__

Mercy: "He names ghosts now."

Truth: "He thinks he remembers. There's no such thing as lying, child."
[Another headache. It's getting stronger.]

Judgement: "Indeed. Lying only worsens a person's image."


-> QUESTION

== QUESTION ==
~ setSilentPath("QUESTION_SILENT_ONE", 10000)
* ["Who... who are you?"]
    -> WHO
    
* ["What is this place?"]
    -> WHAT

* ["Why am I here?"]
    -> WHY
    
* ["What do you mean... leave us?"]
    -> LEAVE

== QUESTION_SILENT_ONE ==
Mercy: "Hurry up and ask."
~ setSilentPath("QUESTION_SILENT_TWO", 8000)
-> QUESTION

== QUESTION_SILENT_TWO ==
Truth: "Sorry, you're too slow. There's no time left."
Mercy: "The procedure must start soon."
-> FINAL

== LEAVE ==
[You gulp, having decided what to ask.]
You, hestitant: "What do you mean... leave us?"
400__PAUSE__
Mercy: "Is that your question?"
+ ["Yes."]
    You, confident: "Yes."
    300__PAUSE__
    Truth, disappointed: "A terrible question. You'll find out anyway."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    100__PAUSE__
    You: "No..."
    200__PAUSE__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION

== WHO ==
[You gulp, having decided what to ask.]
You, hestitant: "Who... who are you?"
400__PAUSE__
Mercy: "Is that your question?"
+ ["Yes."]
    You, confident: "Yes."
    300__PAUSE__
    Truth: "Hmm... an intriguing question."
    200__PAUSE__
    Judgement: "You may call us the Witnesses."
    Mercy: "For we are witnesses to all."_
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    100__PAUSE__
    You: "No..."
    200__PAUSE__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION

== WHAT ==
[You gulp, having decided what to ask.]
You, hestitant: "What is this place?"
400__PAUSE__
Mercy: "Is that your question?"
+ ["Yes."]
    You, confident: "Yes."
    300__PAUSE__
    Truth: "Hmm... an intriguing question."
    200__PAUSE__
    Mercy: "We're not sure either."
    Judgement: "The Mask chose our meeting place. It was not our decision."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    100__PAUSE__
    You: "No..."
    200__PAUSE__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION

== WHY ==
[You gulp, having decided what to ask.]
You, hestitant: "Why am I here?"
400__PAUSE__
Mercy: "Is that your question?"
+ ["Yes."]
    You, confident: "Yes."
    300__PAUSE__
    Truth: "An intriguing question."
    Judgement: "You are here because you were chosen."
    200__PAUSE__
    Mercy: "It was not our decision. If it was, you wouldn't be with us."
    [The white eyes blind you.]
    slow:18
    Judgement, snapping: "Do not question that of the Mask!"
    100__PAUSE__
    Mercy, bowing: "Deepest apologies, Judgement."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    100__PAUSE__
    You: "No..."
    200__PAUSE__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION
    
    


== FINAL ==
#slow:38
[There is silence.]
3000__PAUSE__

Judgement: "Finally. It's time. Let us end this... meeting."

1000__PAUSE__

[A hush falls. Even the air recoils. All pairs of eyes strengthen ever so slightly.]

500__PAUSE__

[Judgement steps forward, drawing something from the folds of their robe.]

[They hold a mask — darker than the void itself — shaped like a watching eye.]

1000__PAUSE__
[It's forced on your face before you can recoil.]

500__PAUSE__

-> OSSANETH_MASK

== OSSANETH_MASK ==
~ playerForceMask("Ossaneth")

#slow:30
[You cannot resist. It binds to you like an old scar reopening.]
#slow:33
[Cold floods your vision. The floor tilts.]

#slow:20
[A voice curls behind your thoughts — smooth, flat, and unbearably near.]

#slow:25
Mask: "Call me Ossaneth, the Unblinking Eye."

#slow:22
"For I see what is. What was. And what may be. And now you shall too."

1000__PAUSE__

#slow:33
[You try to cry, to shout, to scream...] 
400__PAUSE__
[But your tongue has forgotten the shape of sound.]
500__PAUSE__
#slow:20
[You faint.]

~ setFlag("player.received_ossaneth", true)
~ setCounter("player.masks_count", 1)
~ setCounter("player.scenes_count", 1)
~ setCounter("player.talked_to_witnesses_count", 1)

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
