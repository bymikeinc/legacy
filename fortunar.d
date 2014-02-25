// Fortunar bymike.
// Forunar dialogue file - fortunar.d

/**
* 	Fortunar is a male Elf Stalker from the Misty Forest (a triangular forest bordered
*	by the River Delimiyr, the High Moor and the Trade Way). A recent increase in the frequency
*	and strength of troll attacks has lead the elders in his village to believe that something
*	is either organizing the trolls or forcing them out of there mountain homes.
*
*	The Elders sent Fortunar with a prized tome to gain access into Candlekeep and seek out the sages
*	 for advice on how to resolve the conflict.
*/

/**
*	This is my first attempt at a Baldur's Gate Mode.
*	The primary objective is to have a basic playable NPC with interactions.
*	Secondary objective is to include a story line quest.
*	The end dream is to build a complete package of Baldur's Gate & Baldur's Gate 2 mods.
*/

/**
*	This code is based on a template - A Beginner's Guide to NPC creation with WeiDU by Ghreyfain
*	@ http://forums.pocketplane.net/index.php/topic,52.0.html
*
*	and 
*	Getting a non-joinable NPC in the game by berelinde 
*	@  http://www.shsforums.net/topic/26512-getting-a-non-joinable-npc-in-the-game/
*/

BEGIN
/**
*	The original introduction.
*	Takes place on Lion Way, after meeting Imoen. Fortunar approaches the characters to join the group.
*	In his travels to Candlekeep his was attacked by bandits who stole his gear, including the valuable
*	tome that was to be his entrance fee.
*/

// 1ry goal: Have Fortunar ask to join the party when spoken to.
// 2ry goal: Have Fortunar approach the party and initiate dialogue.

//IF (player1,ELF) THEN
//	SAY ~Fair be our meeting, for our hearts are light and our swords sheathed, we hold peace in our hands and its light guides us.~
//	= ~Did you just come Candlekeep?~
//ELSE
//	SAY ~Excuse me, <SIRMAAM>. Did you just come Candlekeep?~

IF
    Global("legacy_Fortunar_met","GLOBAL",0)~
THEN
    BEGIN
    legacy_Fortunar_firstmeeting
    SAY ~Excuse me, <SIRMAAM>. Did you just come Candlekeep?~
    ++  ~We just came from Candlekeep . Why  do you ask?~
    DO  ~SetGlobal("legacy_Fortunar_met","GLOBAL",1)~
    + legacy_Fortunar_001_a
    ++  ~Sorry, I've never been to Candlekeep.~
    DO  ~SetGlobal("legacy_Fortunar_met","GLOBAL",1)~
    + legacy_Fortunar_001_b
END

IF  ~~
THEN 
    BEGIN 
    legacy_Fortunar_001_a 
    SAY ~You did! Do you think you could help me get in? I need to speak to the sages.~
    =  ~My village has been the target of frequent troll attacks. We are used to wandering trolls and the occassional raid, but this is different.~
    =  ~The elders think that something is forcing the trolls our of the homes in the High Moor. Or even worse, organizing them.~
    =  ~I had been given an ancient tome of our village history that had been passed down for generation to exchange for entry into Candlekeep, but I was ambushed by bandits last night. They took most of my possessions. I escaped with just my life.~
    ++  ~I would love to go back to Candlekeep. I was just ambushed by bandits as well. Why don't you join us?~  
    + legacy_Fortunar_join
    ++  ~It's impossible to get into Candlekeep without a tome of immense value. The gatekeeper will turn you away.~  
    + legacy_Fortunar_001_c
END
    
IF  ~~ 
THEN 
    BEGIN legacy_Fortunar_001_b
    SAY ~Oh, I'm sorry. I had just hoped, as the only place this road goes is Candlekeep. But perhaps you could help me.~
    =  ~My village has been the target of frequent troll attacks. We're used to wandering trolls and the occassional raid, but this is different.~
    =  ~The elders think that something is forcing the trolls our of the homes in the High Moor. Or even worse,organizing them .~
    =  ~I had been given an ancient tome that the village had passed down for generatiosn to exchange for entry into Candlekeep, but I was ambushed by bandits last night. They took most of my possessions. I escaped with just my life.~
    ++  ~Actually, I did just come from Candlekeep. I left with my foster father in the night. We were ambushed almost immediately and my foster father was killed.~
    + legacy_Fortunar_001_b2 
    ++  ~I'm sorry, I don't think I can help you.~
    + legacy_Fortunar_deny
END
    
IF  ~~ 
THEN 
    BEGIN legacy_Fortunar_001_b2
    SAY  ~Then it's possible you could convince the gatekeeper to let me in.~
    ++  ~I would love to go back to Candlekeep. I was just ambushed by bandits as well. Why don't you join us ?~  
    + legacy_Fortunar_join 
    ++  ~It is impossible to get into Candlekeep without a tome of immense value. The gatekeeper will turn you away.~
    + legacy_Fortunar_001_c
END
    
IF  ~~ 
THEN 
    BEGIN legacy_Fortunar_001_c 
    SAY  ~I see. In that case, would you let me join you on your travels? I'm sure I would be useful to you, and it would be safer together. We might even find an answer to my village's problems elsewhere. Strange things have been happening on the Sword Coast lately. If we're lucky, we might even find my lost tome.~
    ++  ~That would be great. We will be better off together.~  
    + legacy_Fortunar_join
    ++  ~I'm sorry, I don't think that's a good idea.~  
    + legacy_Fortunar_deny
END
    
IF  ~~ 
THEN 
    BEGIN legacy_Fortunar_join 
    SAY  ~Together we will face and conquer our problems, friend.~ 

IF  ~~ 
THEN REPLY ~Sounds like a plan.~ 
DO  ~SetGlobal("legacy_Fortunar_joined","LOCALS",1)
    JoinParty ()~ 
    EXIT
END

IF  ~~ 
THEN 
    BEGIN legacy_Fortunar_deny
    SAY  ~I understand. Safe travels.~ 
IF  ~~ THEN
    EXIT
END

/**
*	After the initial meeting.
*/ 

IF ~Global("legacy_Fortunar_met","GLOBAL",1)~
THEN 
    BEGIN legacy_Fortunar_002
    SAY  ~You haven't found my tome, have you?~
    ++  ~I haven't found your tome, but I think I could help you find it.~  
    + legacy_Fortunar_join
    ++  ~Sorry,I haven't found your tome.~
    + legacy_Fortunar_deny
END

IF  ~~ 
THEN 
    BEGIN legacy_Fortunar_002_b
    SAY  ~I understand. Safe travels.~

IF  ~~ 
THEN
    EXIT
END

/** 
*	Party stuff. 
*/

BEGIN FortunaP
IF  ~Global("legacy_Fortunar_joined","LOCALS",1)~
THEN 
    BEGIN legacy_Fortunar_remove
    SAY  ~Do you want to end our travels together?.~
    
IF  ~~ 
THEN 
    REPLY  ~No, I think you should continue to travel with us .~
    DO  ~JoinParty()~
    EXIT

IF  ~~ 
THEN REPLY  ~Yes. Perhaps we shall meet again.~ 
    DO  ~ SetGlobal("legacy_Fortunar_joined","LOCALS",0)~
    EXIT
END
    
IF  ~Global("legacy_Fortunar_joined","LOCALS",0)~
THEN 
    BEGIN legacy_Fortunar_rejoin
    SAY  ~Shall we  continue our adventure ?~
    IF  ~~ 
    THEN REPLY  ~That's right Fortunar. It is time for us to travel together again.~
    DO  ~SetGlobal("legacy_Fortunar_joinedd","LOCALS",1)
    JoinParty()~ 
    EXIT
IF  ~~ 
THEN REPLY  ~No,not right now.~
    EXIT
END