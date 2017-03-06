/*
  Start room

  1   2
  XXXXX
  XXXXX
  XXLXX
  XXXXX
  OXXXX
   4 3

  O : 0-0  
               
  1 - Science
  2 - Life
  3 - Spiritual
  4 - Temporary things
*/

#include "tiled-room.pov"

MakeMassWalls(1, 3, 4, 4, 0)
MakeMassWalls(0, 0, 0, 4, 1)
MakeMassWalls(4, 4, 0, 4, 3)
MakeTiledWall(0, 0, 2)
MakeTiledWall(2, 0, 2)
MakeTiledWall(4, 0, 2)

MakeMassFlings(0, 4, 0, 4)

MakeTiledLight(2, 2)

union {
  MakePictureFrame(7.3, 10, "textures/LotusFlower.png")
  translate <31, 17, 50>
}
union {
  MakePictureFrame(9.6, 5.4, "textures/Gears.png")
  translate <12, 20, 50>
}
union {
  MakePictureFrame(6.49, 3.3, "textures/Candle.png")
  translate <20, 12, 50>
}
union {
  MakePictureFrame(4.35, 5.18, "textures/Water.png")
  translate <30, 7, 50>
}
union {
  MakePictureFrame(9, 5.98, "textures/Bison.png")
  translate <11, 2.5, 50>
}
union {
  MakePictureFrame(32, 24, "tiled-map.png")
  translate <10, 2, 0>
  rotate <0, -90, 0>
}
