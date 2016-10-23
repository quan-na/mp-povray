/*
 001 room, contain life elements

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
#declare mp_room_001=1;

#include "mp-domino.pov"

#ifndef (mp_room_000)
  #include "mp-room-000.pov"
#end

MakeModule(<0,0,20>, 1, 2, 0, 0, 0)

camera { // TODO: Move camera using time
  location <-49, 17, 30>
  look_at <-10, 17, 30>
}
