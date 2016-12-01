/*
  Emergent room

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
             ----- ---
             -0--- ---
              O - -----
LXXXXLXXXLXXXXL ---------
X X X X X X X X ---------
LXXXXLXXXLXXXXL ---------
                  -----
                   ---
                   ---
  O : 0,-1

*/

#include "tiled-room.pov"

MakePathBox(1, -1, 1, 3)

MakeMassFlings(-13, 1, -2, -2)
MakeMassFlings(-13, 1, -4, -4)

#for (iCnt, 0, 7)
  MakePathBox(1 - iCnt*2, -3, 1, 3)
#end

MakeMassWalls(-13, 0, -2, -2, 0)
MakeMassWalls(-13, 1, -4, -4, 2)

MakeTiledWall(1, -2, 3)
MakeTiledWall(-13, -2, 1)
MakeTiledWall(1, -4, 3)
MakeTiledWall(-13, -4, 1)

#for (iCnt, 0, 6)
  MakeTiledWall(-2*iCnt, -2, 2)
  MakeTiledWall(-2*iCnt, -4, 0)
#end

//MakeTiledLight(1, -2)
MakeTiledLight(-4, -2)
MakeTiledLight(-8, -2)
//MakeTiledLight(-13, -2)
//MakeTiledLight(1, -4)
MakeTiledLight(-4, -4)
MakeTiledLight(-8, -4)
//MakeTiledLight(-13, -4)

// TODO pictures
