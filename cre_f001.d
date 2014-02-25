// Fortunar: Bandits. Arlo, Cullen, Silas, Iggy and Kali. Encounter Dialogue.
// Forunar dialogue file - cre_f001.d


/**
* 	These five bandits are buttheads. They stole Fortunar&#39;s expensive book.
*/

/**
*	This code is based on a template - Gavin for Baldur&#39;s Gate II by berelinde
*	@ http://www.gibberlings3.net/gavin_bg2/
*
*   and WeiDU Documentation by Westley Weimer
*   @ http://weidu.org/WeiDU/README-WeiDU.html#CHAIN
*/

/**
*   Start the dialogue.
*
*   Initialize character dialogue, I guess.
*   Don't reinitialize Fortunar's dialogue, or it won't reference his other script.
*   Use fortunarJ because he is assumed to have joined the party at this point, or else it doesn't matter.
*/

BEGIN cre_f001
BEGIN cre_f002
BEGIN fortunaJ

CHAIN IF ~Global(legacy_cre_f001_met",GLOBAL",0)~ 
THEN
    cre_f001 legacy_cre_f001_firstmeeting
~Well. What <span class="k">do we have here? Some fools who wandered off the beaten path?~
== cre_f002 ~Heh. Let's show them what happens to people who go wandering.~
== cre_f003 ~Yeah! We can take them!~
== cre_f004 ~We can definitely take them!~
== fortunaJ ~Wait! I know you.~
== cre_f001 ~You know who?~
== fortunaJ ~You. I know you.~
== cre_f001 ~That's no surprise. We're the [bandit group name]. We're famous.~
== cre_f003 ~We're infamous!~
== cre_f004 ~We're notorios!~
== cre_f005 ~What the boys are trying to say <span class="k">is that we are famous <span class="k">for being notrious.~
== fortunaJ ~You're notorious <span class="k">for raiding lonely travellers and taking their possessions. Like my possessions. You took my tome!~
== cre_f001 ~Tome? What tome? I don't remember a tome.~
== cre_f002 ~What's a tome?~
== cre_f003 ~It's like a book.~
== cre_f004 ~A fancy book.~
== cre_f001 ~We didn't take any tomes. What would we need tomes <span class="k">for?~
== cre_f005 ~Actually. We did take a tome once. A patricularly lovely tome. I wanted to keep it. You had other uses <span class="k">for the pages.~
== fortunaJ ~You what?!~
== cre_f001 ~Oh, that's right! Now I remember. We did take your tome. But we don't have it anymore. It's all gone.~
EXTERN fortunaJ legacy_cre_f001_2

CHAIN fortunaJ legacy_cre_f001_2
~<CHARNAME>, I have to have justice. You have to help me!~
END
++ ~Of course we'll help you.~ EXTERN fortunaJ legacy_cre_f001_help
++ ~I'm not sure that's a good idea...~ EXTERN fortunaJ legacy_cre_f001_deny

/**
*   The party will help fortunar.
*   Finish dialogue.
*   Set bandits to be enemies.
*   Initiate combat.
*/
CHAIN
IF ~~ THEN fortunaJ legacy_cre_f001_help
~For justice!~
DO ~ActionOverride(cre_f001",Enemy())
ActionOverride(cre_f002",Enemy())
ActionOverride(cre_f003",Enemy())
ActionOverride(cre_f004",Enemy())
ActionOverride(cre_f005",Enemy())~
EXIT

/**
*   The party will not help fortunar.
*   Finish dialogue.
*   Fortunar leaves the party.
*   Set bandits to be enemies.
*   Initiate combat.
*/

CHAIN
IF ~~ THEN fortunaJ legacy_cre_f001_help
~Then I will do this alone!~
DO ~SetLeavePartyDialogueFile()
ChangeAIScript(",DEFAULT)
LeaveParty()
ActionOverride(cre_f001",Enemy())
ActionOverride(cre_f002",Enemy())
ActionOverride(cre_f003",Enemy())
ActionOverride(cre_f004",Enemy())
ActionOverride(cre_f005",Enemy())~
EXIT