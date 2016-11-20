/*
  This room is used for modeling purpose.
  It can be rotated to suit target room.
  To be simple, it has 1 single camera.
*/

#include "tiled-room.pov"

MakeMassWalls(0, 4, 4, 4, 0)
MakeMassWalls(0, 0, 0, 4, 1)
MakeMassWalls(0, 4, 0, 0, 2)
MakeMassWalls(4, 4, 0, 4, 3)

MakeMassFlings(0, 4, 0, 4)

MakeTiledLight(2, 2)

union {
  MakePictureFrame(7.3, 10, "textures/LotusFlower.png")
  translate <10, 5, 50>
}
camera {
  location <25, 17, 25>
  look_at <20, 17, 30>
  //angle 100.0
}
