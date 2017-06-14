/*
 003 room, contain religious elements

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
#declare mp_room_003=1;

#include "mp-domino.pov"

#ifndef (mp_room_000)
  #include "mp-room-000.pov"
#end

MakeModule(<20,0,30>, -1, 1, 0, 0, 0)

camera { // TODO: Move camera using time
  location <69, 17, 20>
  look_at <30, 17, 20>
}
