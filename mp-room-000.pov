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

camera { // TODO: Move camera using time
  location <10, 17, 1>
  look_at <10, 17, 15>
}
