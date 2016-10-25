/*
  This room is used for modeling purpose.
  It can be rotated to suit target room.
  To be simple, it has 1 single camera.
*/

#include "mp-domino.pov"

#include "items/front-wall-bagua-shelf.pov"

MakeModule(<0,0,0>, 0, 0, 0, 0, 0)

MakeFrontWallBaguaShelf()

camera {
  location <10, 17, 40>
  look_at <10, 15, 0>
}
