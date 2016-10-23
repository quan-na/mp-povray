/*
 002 room, contain science elements

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
#declare mp_room_002=1;

#include "mp-domino.pov"

#ifndef (mp_room_000)
  #include "mp-room-000.pov"
#end

MakeModule(<-10,0,50>, 0, 2, 0, 0, 0)

camera { // TODO: Move camera using time
  location <0, 17, 99>
  look_at <0, 17, 30>
}
