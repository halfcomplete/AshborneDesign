EXTERNAL pause(ms)
EXTERNAL playerForceMask(maskName)
EXTERNAL setFlag(key, value)
EXTERNAL setCounter(key, value)
EXTERNAL getLabel(key)
EXTERNAL setLabel(key, value)

# 1_1_Shackled 
#scene_intro 
#captivity

//~ act = 1
//~ scene = 1


-> INTRO

== INTRO ==
#slow:300
[You wake.]

~ pause(3000)

[The cold, hard floor pushes against your seated body.]
[Shackles around your wrists and ankles pin you to the ground.]
[Your mind is foggy like it hasn't been used for days.]

[Around you, three hooded figures stand, cloaked in darkness.]

[A rattling voice from in front breaks the silence.]
"He wakes."
Left: "Does he know his name?"
[There's a scoff on your right.]
"That matters not, Truth."
Figure in front: "Peace, Mercy. Peace,"
"You - you poor, chained creature, do you know your name?"

-> CHOOSE_NAME

== CHOOSE_NAME ==
* [Say nothing]
    Figure in front: "Silent, are you?"
    Truth: "Perhaps, Order, he does not remember."
    Mercy: "Or perhaps he chooses not to."

    -> INPUT_KNOW_WHO_THE_WITNESSES_ARE

* [Say your name]
    -> INPUT_NAME
    
* ["No."]
    -> DOESNT_KNOW_NAME

== INPUT_NAME ==
__GET_PLAYER_INPUT__
~ temp player_name = getLabel("player.input")
You: "{player_name}..."
Figure in front: "{player_name}?"
~ pause(300)
#slow:200
"That's not..."
~ pause(500)
Mercy: "He doesn't know, Order, that's why."
Order: "Unfortunate."

-> INPUT_KNOW_WHO_THE_WITNESSES_ARE

== DOESNT_KNOW_NAME ==
Figure in front: "How come?"
Mercy: "He doesn't know, Order, that's why."
Mercy: "Or perhaps he chooses not to."
[There is silence.]
~ pause(300)
-> INPUT_KNOW_WHO_THE_WITNESSES_ARE

== INPUT_KNOW_WHO_THE_WITNESSES_ARE ==
Truth: "Do you know who we are?"
* [Say nothing]
    Order: "Again."
    Truth: "Still he does not know."
    Mercy: "Or perhaps he chooses not to."
    Truth: "I would not blame him."
    
    [There is silence]
    
    ~ setFlag("witnesses.said.something_happened_before", true)
    -> FINALISE_NAME

* [Say yes]
    Mercy: "He lies."
    Truth: "You must be mistaken."
    Order: "We mustn't delay, either way..."
    
    ~ setFlag("witnesses.said.something_happened_before", true)
    -> FINALISE_NAME
    
* [Say no]
    Truth: "Perfect."
    Mercy: "Good."
    
    [There is silence]
    ~ pause(500)
    
    Judgement: "We mustn't delay, either way..."
    
    ~ setFlag("witnesses.said.maybe_something_happened_before", true)
    -> FINALISE_NAME

== FINALISE_NAME ==
Truth: "The mask chose him. Yes. That is all that matters."
Order: "And now, it must begin."

A pause.

Finally, the centre figure, Order, steps forward. He holds a black mask that blends into the darkness around.

He presses it to your face.

-> OSSANETH_MASK

== OSSANETH_MASK ==
~ playerForceMask("Ossaneth")
[You cannot resist. It binds to you.]

The figures fade away, your grasp on reality rapidly vanishing.

A flat, impartial voice inside your head cuts through. It's your mask.
"You may call me Ossaneth, the Unblinking Eye."

[You faint.]

~ setFlag("player.received_ossaneth", true)
~ setCounter("player.masks_count", 1)
~ setCounter("player.scenes_count", 1)
~ setCounter("player.talked_to_witnesses_count", 1)
-> END
