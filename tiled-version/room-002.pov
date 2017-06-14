/*
  Life room

          XX
          XX
          XX
          XX
    ----- XLXXX
    ----- OXXXX
    -- -   X
    -- ----0
  ---- -----
  ---- -----
       -----
       -----
        - -

  O : 3-6  

*/

#include "tiled-room.pov"

MakePathBox(4, 5, 1, 3)

MakeMassFlings(3, 7, 6, 7)
MakeMassFlings(3, 4, 8, 11)

MakeMassWalls(3, 4, 11, 11, 0)
MakeMassWalls(3, 3, 6, 11, 1)
MakeTiledWall(3, 6, 2)
MakeMassWalls(5, 7, 6, 6, 2)
MakeMassWalls(7, 7, 6, 7, 3)
MakeMassWalls(5, 7, 7, 7, 0)
MakeMassWalls(4, 4, 8, 11, 3)

MakeTiledLight(4, 7)

union {
  MakePictureFrame(9.42, 10, "textures/TreeOfLife.png")
  rotate <0, 90, 0>
  translate <50, 10, 60>
}