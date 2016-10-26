/*
 000 room, contain core elements

          __
         |2 |
         |  |
         |  |
         |  |
         |_ |
     _____|  |
    |1       |_____
    |_____|      3 |
          |0 |_____|
          |__|
*/
#version 3.7;
#declare mp_room_000=1;

#include "mp-domino.pov"
#ifndef (mp_room_001)
  #include "mp-room-001.pov"
#end
#ifndef (mp_room_002)
  #include "mp-room-002.pov"
#end
#ifndef (mp_room_003)
  #include "mp-room-003.pov"
#end

#include "items/front-wall-bagua-shelf.pov"

MakeModule(<0,0,0>, 0, 0, 1, 4, 3)

// other room will have all items moved with the room
MakeFrontWallBaguaShelf()

/*
Time frame for 000 room:
 - at 0s pos <10,30> look <10,10> facing bagua shelf
 - at 1s pos <15,25> look <35,25> facing room 003
 - at 2s pos <10,25> look <10,45> facing back wall
 - at 3s pos <5,35> look <-15,35> facing room 001
 - at 4s pos <5,45> look <5,65> facing room 002
*/

camera {
  #if (clock >= 0 & clock < 1)
    #declare xclock = clock;
    location <10+5*xclock, 17, 30-5*xclock>
    look_at <10+25*xclock, 15, 10+15*xclock>
  #end
  #if (clock >= 1 & clock < 2)
    #declare xclock = clock - 1;
    location <15-5*xclock, 17, 25>
    look_at <35-25*xclock, 15, 25+20*xclock>
  #end
  #if (clock >= 2 & clock < 3)
    #declare xclock = clock - 2;
    location <10-5*xclock, 17, 25+10*xclock>
    look_at <10-25*xclock, 15, 45-10*xclock>
  #end
  #if (clock >= 3 & clock <= 4)
    #declare xclock = clock - 3;
    location <5, 17, 35+10*xclock>
    look_at <-15+20*xclock, 15, 35+30*xclock>
  #end
}
