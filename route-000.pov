#version 3.7;

#include "room-000.pov"
#include "room-001.pov"
#include "room-002.pov"
#include "room-003.pov"
#include "room-004.pov"

/* Script:
   - Start sitting at 25-10-10, looking lamb 25-25-25
   - Standing up 25-17-10, looking wall 25-17-50
   - Walking to center 25-17-25, looking wall 25-17-50
   - Turn left 25-17-25, looking map 0-17-25
   - Turn left 25-17-25, looking wall 25-17-0
   Total: 4s
 */

camera {
  #if (clock >=0 & clock < 1)
    #declare xclock = clock;
    location <25, 10 + 7*xclock, 10>
    look_at <25, 25 - 8*xclock, 25 + 25*xclock>
  #end
  #if (clock >=1 & clock < 2)
    #declare xclock = clock - 1;
    location <25, 17, 10 + 15*xclock>
    look_at <25, 17, 50>
  #end
  #if (clock >=2 & clock < 3)
    #declare xclock = clock - 2;
    location <25, 17, 25>
    look_at <25 - 25*xclock, 17, 50 - 25*xclock>
  #end
  #if (clock >=3 & clock <= 4)
    #declare xclock = clock - 3;
    location <25, 17, 25>
    look_at <0 + 25*xclock, 17, 25 - 25*xclock>
  #end
  //angle 90.0
}