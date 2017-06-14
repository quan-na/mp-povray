/*
  Spiritual room

          --
          --
          --
          --
    ----- -----
    ----- -----
    -- -   -
    -- -----
  ---- -----
  ---- -----
       ----- XXX
       ---0- XXX
        - X XXXXX
          OXXXXXXXX
          XXXXLXXXX
          XXXXXXXXX
            XXXXX
             XXX
             XXX
  O : 3,-2

*/

#include "tiled-room.pov"

MakePathBox(3, -1, 1, 3)

MakeMassFlings(3, 11, -4, -2)
MakeMassFlings(6, 8, -1, 1)
MakeMassFlings(6, 8, -7, -5)
MakePathBox(5, -1, 0, 1)
MakePathBox(5, -5, 1, 2)
MakePathBox(9, -5, 2, 3)
MakePathBox(9, -1, 3, 0)

MakeMassWalls(6, 8, 1, 1, 0)
MakeMassWalls(6, 6, 0, 1, 1)
MakeTiledWall(4, -2, 0)
MakeMassWalls(3, 3, -4, -2, 1)
MakeMassWalls(3, 4, -4, -4, 2)
MakeMassWalls(6, 6, -7, -6, 1)
MakeMassWalls(6, 8, -7, -7, 2)
MakeMassWalls(8, 8, -7, -6, 3)
MakeMassWalls(10, 11, -4, -4, 2)
MakeMassWalls(11, 11, -4, -2, 3)
MakeMassWalls(10, 11, -2, -2, 0)
MakeMassWalls(8, 8, 0, 1, 3)

MakeTiledLight(7, -3)

union {
  MakePictureFrame(5.64, 5.64, "textures/BuddhaHand.png")
  rotate <0, 90, 0>
  translate <40, 12, -2.5>
}