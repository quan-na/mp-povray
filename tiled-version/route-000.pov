#version 3.7;

#include "room-000.pov"
#include "room-001.pov"
#include "room-002.pov"
#include "room-003.pov"
#include "room-004.pov"

/* Script:
   0 Start sitting at 25-10-10, looking lamb 25-25-25
   1 Standing up 25-17-10, looking wall 25-17-50
   2 Walking to center 25-17-25, looking wall 25-17-50
   3 Turn left 25-17-25, looking map 0-17-25
   4 Turn left 25-17-25, looking wall 25-17-0
   Total: 4s
 */

#if (clock >=0 & clock < 1)
  #declare xclock = clock;
  CameraLine(25, 10, 10, 25, 25, 25,
             25, 17, 10, 25, 17, 50, xclock)
#end
#if (clock >=1 & clock < 2)
  #declare xclock = clock - 1;
  CameraLine(25, 17, 10, 25, 17, 50,
             25, 17, 25, 25, 17, 50, xclock)
#end
#if (clock >=2 & clock < 3)
  #declare xclock = clock - 2;
  CameraLine(25, 17, 25, 25, 17, 50,
             25, 17, 25,  0, 17, 25, xclock)
#end
#if (clock >=3 & clock <= 4)
  #declare xclock = clock - 3;
  CameraLine(25, 17, 25,  0, 17, 25,
             25, 17, 25, 25, 17, 0, xclock)
#end
