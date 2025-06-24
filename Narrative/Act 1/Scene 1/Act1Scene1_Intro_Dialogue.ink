# Act 1, Scene 1 - Shackled

//~ act = 1
//~ scene = 1
#scene_intro #captivity

-> INTRO

== INTRO ==
You wake.

The cold, hard floor pushes against your seated body. Shackles around your wrists and ankles pin you to the ground. Your mind is foggy like it has not been used for days.

Around you, three hooded figures stand, cloaked in darkness.

A rattling voice from in front breaks the silence. "He wakes."
"Does he know his name?" asks the voice to your left.
There's a scoff on your right. "That matters not, Truth."
"Goodness, Mercy, leave him alone," says the figure in front. "You - you poor, chained creature, do you know your name?"

-> CHOOSE_NAME

== CHOOSE_NAME ==
* [Say nothing]
    Figure in front: "Silent, are you?"
    Truth: "Perhaps, Judgement, he does not remember."
    Mercy: "Or perhaps he chooses not to."

    -> INPUT_KNOW_WHO_THE_WITNESSES_ARE

* [Speak your name] 
    -> INPUT_NAME

== INPUT_NAME ==
~ temp name = "Cael"
(Replace this later with actual name input code)
Judgement: "He does not."

-> INPUT_KNOW_WHO_THE_WITNESSES_ARE

== INPUT_KNOW_WHO_THE_WITNESSES_ARE ==
Truth: "Do you know who we are?"
* [Say nothing]
    Judgement: "Again."
    Truth: "Still he does not know."
    Mercy: "Or perhaps he *chooses* not to."
    Truth: "I would not blame him."
    
    [There is silence]
    -> FINALISE_NAME

* [Say yes]
    Mercy: "He lies."
    Truth: "You must be mistaken."
    Judgement: "We mustn't delay, either way..."
    -> FINALISE_NAME
    
* [Say no]
    Truth: "You will get to know us in time."
    Mercy: "Maybe."
    Judgement: "We mustn't delay, either way..."
    
    -> FINALISE_NAME

== FINALISE_NAME ==
Truth: "The mask chose him. Yes. That is all that matters."
Judgement: "And now, it must begin."

A pause.

Finally, the centre figure, Judgement, steps forward. He holds a black mask that blends into the darkness around.

He presses it to your face.

-> OSSANETH_MASK

== OSSANETH_MASK ==
// Add tag for GameState update if needed
[You cannot resist. It binds to you.]

The figures fade away, your grasp on reality rapidly vanishing.

A cold, impartial voice inside your head cuts through. It's your mask.
"You were chosen to bear The Eye. Now you shall see the world as it is... and not as you wish it were."

[You faint.]

-> END
