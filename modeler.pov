/*
  This room is used for modeling purpose.
  It can be rotated to suit target room.
  To be simple, it has 1 single camera.
*/

#include "tiled-room.pov"

#for (iCnt, 0, 4)
  MakeTiledWall(iCnt, 4, 0)
  MakeTiledWall(0, iCnt, 1)
  MakeTiledWall(iCnt, 0, 2)
  MakeTiledWall(4, iCnt, 3)
#end
#for (iX, 0, 4)
  #for (iZ, 0, 4)
    MakeTiledFloor(iX, iZ)
    MakeTiledCeiling(iX, iZ)
  #end
#end

MakeTiledLight(2, 2)

camera {
  location <5, 17, 5>
  look_at <10, 17, 10>
  angle 100.0
}
