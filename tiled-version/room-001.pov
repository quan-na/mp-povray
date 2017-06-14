/*
  Science room

    XXXXX
    XXXXO
    XX X   -
    XL 0----
  XXXX -----
  XXXX -----
       -----
       -----
        - -

  O : 1-6  

*/

#include "tiled-room.pov"

MakePathBox(0, 5, 1, 3)

MakeMassFlings(-3, 1, 6, 7)
MakeMassFlings(-3, -2, 4, 5)
MakeMassFlings(-5, -2, 2, 3)

MakeMassWalls(-3, 1, 7, 7, 0)
MakeMassWalls(-3, -3, 4, 7, 1)
MakeMassWalls(-5, -4, 3, 3, 0)
MakeMassWalls(-5, -5, 2, 3, 1)
MakeMassWalls(-5, -2, 2, 2, 2)
MakeMassWalls(-2, -2, 2, 5, 3)
MakeTiledWall(1, 6, 2)
MakeTiledWall(-1, 6, 2)
MakeMassWalls(1, 1, 6, 7, 3)

MakeTiledLight(-3, 7)
MakeTiledLight(-2, 2)

union {
  MakePictureFrame(12.06, 15.54, "textures/NicolasTesla.png")
  translate <-3, 5, 80>
}

union {
  MakePictureFrame(7.14, 7.34, "textures/ScientificMethod.png")
  rotate <0, -90, 0>
  translate <-30, 12, 65>
}

union {
  MakePictureFrame(14.4, 9.11, "textures/Galaxy.png")
  rotate <0, 180, 0>
  translate <-15, 10, 20>
}

union {
  MakePictureFrame(4.23, 6, "textures/Curious.png")
  rotate <0, -90, 0>
  translate <-50, 15, 21>
}