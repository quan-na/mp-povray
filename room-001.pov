/*
  Science room

    XXXXX
    XLXXO
    XX X   -
    XX 0----
  XXLX -----
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

MakeTiledLight(-2, 6)
MakeTiledLight(-3, 3)

// TODO pictures
