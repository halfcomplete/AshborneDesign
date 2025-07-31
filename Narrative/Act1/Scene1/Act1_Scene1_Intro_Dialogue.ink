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
#slow:50
You wake.
__NL__
2000__PAUSE__

The stone beneath you is cold, not unlike ice. It consumes what little light is in the room.

1500__PAUSE__

Painful chains bite into your limbs.

900__PAUSE__
__NL__
#slow:35
"What... where... am I?" you think.
__NL__
900__PAUSE__
#slow:32
Your thoughts move like insects in glue, each one slower than the previous.

1200__PAUSE__

Three hooded figures surround you.

1500__PAUSE__
__NL__
#slow:28
"It wakes."

800__PAUSE__
__NL__

#slow:20
There's another voice from your left. "Does it know it's name?"
500__PAUSE__
#slow:18
This time, the voice is curious. Questioning. The owner's eyes, glowing blue against the black, peer into your skull.
700__PAUSE__
__NL__
#slow:25
Your head hurts.
1300__PAUSE__
__NL__
There's a scoff. This time, clipped, scornful.
200__PAUSE__
#slow:23
"That matters not, Truth," growls the figure on your right, where a pair of red eyes stare you down.
700__PAUSE__
#slow:20
__NL__
You feel weak.
__NL__
800__PAUSE__
The person in front speaks again. "Peace, Mercy. Peace."

__NL__
200__PAUSE__
The red brightens, then dulls, all in a sudden flash.
300__PAUSE__
#slow:27
Mercy clears his throat. "Deepest apologies, Judgement."

__NL__
The figure named Judgement nods and turns back to you.
600__PAUSE__
#slow:27
"Speak," it says. "Do you remember your name?"
400__PAUSE__

1000__PAUSE__

~ setSilentPath("CHOOSE_NAME_SILENT_ONE", 12000)
-> CHOOSE_NAME

== CHOOSE_NAME ==
* [Say your name]
    -> INPUT_NAME

* ["N-no."]
    Your throat hurts as you speak.
    #slow:26
    "N-no."
    
    400__PAUSE__
    There's a wicked laugh on your right. "Of course it doesn't remember!"
    
    "Or..." Truth begins. "Perhaps it chooses not to. Fascinating."
    Your head hurts once more. This time, a spike of pain from your left makes you wince.
    200__PAUSE__
    Only Truth seems to notice — or care.
    
    "No matter what, keep in mind that that’s why it was chosen," Judgement says.

    Mercy and Truth mumble in agreement.
    500__PAUSE__
    A church bell rings in the distance, muffled. It leaves echoes in your mind, bouncing around the emptiness where memories should've been.
    Truth exclaims. "Ah! It is almost time. Before you leave us, would you like to ask a question? We won't lie — but there's some things you're better off not knowing."
    
    Your mind races. What should you ask them?
    -> QUESTION
    
== CHOOSE_NAME_SILENT_ONE ==
__NL__
You say nothing, instead leveling your eyes with Judgement's.
300__PAUSE__
#slow:30
__NL__
They are cold. Still. Lifeless.
200__PAUSE__
You feel sick as you hallucinate scenes of past, every moment of what you were before flashing by your mind.
__NL__
You can't hold the stare any longer. But the white eyes of Judgement have already burned themselves into your eyes, and somehow you know that they'll be there forever, always watching, always judging.
1000__PAUSE__
__NL__
Mercy steps closer, eyes flaring flame-red. "We don't have all night. Speak, mortal."
~ setSilentPath("CHOOSE_NAME_SILENT_TWO", 13000)
-> CHOOSE_NAME

== CHOOSE_NAME_SILENT_TWO ==
__NL__
You remain quiet, gritting your teeth and convincing yourself this is the right way.
__NL__
Mercy steps back.
__NL__
"Silent, are you?" asks Judgement.

Mercy chuckles. "He must've forgotten how to speak as well!"

"Or perhaps he chooses not to," says Truth.

 500__PAUSE__
 __NL__
A church bell rings in the distance, muffled.
Truth exclaims. "Ah! It is almost time. Before you leave us, would you like to ask a question? We won't lie — but there's some things you're better off not knowing."

Your mind races. What should you ask them?
~ setSilentPath("QUESTION_SILENT_ONE", 10000)
-> QUESTION

== SAY_NAME_SILENT_ONE ==
You stay still. Your mouth is sealed.
Why should I answer to them, you think. Who even are they?
300__PAUSE__
Mercy: "We don't have all night. Speak, mortal."
Your eyes widen. Are they not mortals?
~ setSilentPath("CHOOSE_NAME_SILENT_TWO", 5000)
-> INPUT_NAME

== SAY_NAME_SILENT_TWO ==
You remain quiet, as still and silent as a dead man,

"Silent, are you?" asks Judgement.

"Perhaps he does not remember," Mercy says.

"Or..." Truth leans closer. "Perhaps he chooses not to."

500__PAUSE__
Suddenly, a church bell rings in the distance, muffled.
Truth exclaims. "Ah! It is almost time. Before you leave us, would you like to ask a question? We won't lie — but there's some things you're better off not knowing."

Your mind races. What should you ask them?
-> QUESTION

== INPUT_NAME ==
~ setSilentPath("SAY_NAME_SILENT_ONE", 25000)
__GET_PLAYER_INPUT__
~ temp player_name = getLabel("player.input")

__NL__
#slow:25
You groan. "{player_name}..." Your dry throat barely croaks out the name.
400__PAUSE__
"{player_name}?" asks Judgement.
400__PAUSE__

__NL__
Mercy smirks. It's an evil, vile smile that screams hatred. "A humorous answer! It names ghosts now."

__NL__
"I believe it thinks it remembers. Remember — there's no such thing as lying, child," Truth whispers.

__NL__
#slow:32
Another headache. They're getting stronger.
__NL__

"Indeed," Judgement agrees. "Lying only worsens a person's image."
1200__PAUSE__
 __NL__
Suddenly, a church bell rings in the distance, muffled.
Truth, excited: "Ah! It is almost time. Before you leave us, would you like to ask a question? We won't lie — but there's some things you're better off not knowing."

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
Mercy: "Hurry up and ask."
__NL__
~ setSilentPath("QUESTION_SILENT_TWO", 8000)
-> QUESTION

== QUESTION_SILENT_TWO ==
__NL__
Truth: "You're too slow. There's no time left."
__NL__
Mercy: "The procedure must start soon."
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
    
400__PAUSE__
Mercy: "Is that your question?"
__NL__
+ ["Yes."]
    You, confident: "Yes."
    __NL__
    300__PAUSE__
    Truth, disappointed: "A terrible question. You'll find out anyway."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    __NL__
    100__PAUSE__
    You: "No..."
    200__PAUSE__
    __NL__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION

== WHO ==
{ questionsAsked == 0:
    [You gulp, having decided what to ask.]
    You, hestitant: "Who... who are you?"
- else:
    [You gulp, having finally decided what to ask.]
    You: "Who... who are you?"
}
400__PAUSE__
"Is that your question?" asks Mercy.
__NL__
+ ["Yes."]
    "Yes." Your voice grows stronger.
    __NL__
    300__PAUSE__
    "Hmm... an intriguing question," Truth says.
    200__PAUSE__
    __NL__
    Judgement answers. "You may call us the Witnesses."
    __NL__
    "For we are witnesses to all, death, birth and everything in-between," Mercy finishes.
    700__PAUSE__
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    __NL__
    100__PAUSE__
    You: "No..."
    200__PAUSE__
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

400__PAUSE__
Mercy: "Is that your question?"
__NL__
+ ["Yes."]
    You, confident: "Yes."
    300__PAUSE__
    __NL__
    Truth: "Hmm... an intriguing question."
    __NL__
    200__PAUSE__
    Mercy: "We're not sure either."
    __NL__
    Judgement: "The Mask chose our meeting place. It was not our decision."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    100__PAUSE__
    __NL__
    You: "No..."
    200__PAUSE__
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

400__PAUSE__
Mercy: "Is that your question?"
__NL__
+ ["Yes."]
    You, confident: "Yes."
    300__PAUSE__
    Truth: "An intriguing question."
    Judgement: "You are here because you were chosen."
    200__PAUSE__
    Mercy: "It was not our decision. If it was, you wouldn't be with us."
    
    __NL__
    [The white eyes blind you.]
    __NL__
    slow:18
    Judgement, snapping: "Do not question that of the Mask!"
    100__PAUSE__
    Mercy, bowing: "Deepest apologies, Judgement."
    -> FINAL
+ ["No."]
    [You're unsure of whether you should ask this. The only thing you're sure of is that they know you're unsure.]
    __NL__
    100__PAUSE__
    __NL__
    You: "No..."
    200__PAUSE__
    __NL__
    Mercy, impatient: "Well then, what is it? We're running out of time."
    -> QUESTION
    
    


== FINAL ==
__NL__
#slow:38
There is silence.
3000__PAUSE__

"Finally. It's time," says Judgement. "Let us end this... meeting."

1000__PAUSE__

#slow:35
A hush falls.

500__PAUSE__
__NL__
After a bit, Judgement steps forward, drawing something from the folds of their robe.

They hold a mask, darker than the void itself, dotted with white drawings of eyes.

1000__PAUSE__
It's forced on your face before you can recoil.

500__PAUSE__

-> OSSANETH_MASK

== OSSANETH_MASK ==
~ playerForceMask("Ossaneth")

__NL__
#slow:30
You cannot resist. It binds to you, like an old scar reopening.
#slow:33
Cold floods your vision. The floor tilts.

You try to cry, to shout, to scream... but your tongue has forgotten the shape of sound.

__NL__
#slow:26
A voice curls behind your thoughts — smooth, flat, and unbearably near.
__NL__
#slow:36
"Call me Ossaneth, the Unblinking Eye."

#slow:22
"I see what is, what was, and what shall be. And now you shall too."

2000__PAUSE__
#slow:40
"Share in the Sight, friend."

1000__PAUSE__

__NL__
#slow:40
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
