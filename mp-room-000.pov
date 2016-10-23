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
#declare mp_room_000=1;

#include "mp-domino.pov"
// TODO: optimize inclusion
#ifndef (mp_room_001)
  #include "mp-room-001.pov"
#end
#ifndef (mp_room_002)
  #include "mp-room-002.pov"
#end
#ifndef (mp_room_003)
  #include "mp-room-003.pov"
#end

MakeModule(<0,0,0>, 0, 0, 1, 4, 3)

/*
Time frame for 000 room:
 - at 7s facing room 002 point <5,45>
 - at 6s facing room 001 point <5,35>
 - at 5s facing room 003 point <15,25>
 - at 0s facing the front wall point <10,10>
 - at 1s facing right wall point <10,10>
 - at 2s facing left wall point <10,10>
 - at 3s facing back wall point <10,10>
*/

camera {
  #if (clock <= 3)
    location <10, 17, 10>
    #if (clock < 1)
      look_at <10+10*clock, 17, 0+10*clock> // turn to 20,10
    #else
      #if (clock < 2)
        #declare xclock=clock-1;
        look_at <20-20*xclock, 17, 10-5*xclock> // turn to 0,5
      #else
        #declare xclock=clock-2;
        look_at <0+10*xclock, 17, 5+15*xclock> // turn to 10,20
      #end
    #end
  #else
    #if (clock < 5)
      #declare xclock=(clock-3)/2;
      location <10+5*xclock, 17, 10+15*xclock> // move to 15,25
      look_at <10+10*xclock, 17, 20+5*xclock> // turn to 20,25
    #else
      #if (clock < 6)
        #declare xclock=clock-5;
        location <15-10*xclock, 17, 25+5*xclock> // move to 5,35
        look_at <20-20*xclock, 17, 25+10*xclock> // turn to 0,35
      #else
        #declare xclock=clock-6;
        location <5, 17, 35+10*xclock> // move to 5,45
        look_at <0+5*xclock, 17, 35+15*xclock> // turn to 5,50
      #end
    #end
  #end
}
