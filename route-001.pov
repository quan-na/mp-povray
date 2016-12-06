#version 3.7;

#include "room-000.pov"
#include "room-001.pov"
#if (clock < 3)
  #include "room-002.pov"
  #include "room-003.pov"
  #include "room-004.pov"
#end

/* Script:
   - Start at 25,17,10, looking wall 25,17,50
   - Turn left 25,17,10, looking door 5,17,50
   - Walk to 5,17,40, looking door 5,17,50
   - Walk to 5,17,70, looking wall 5,17,80
   - Turn left 5,17,70, looking wall -30,17,70
   - Walk to -20,17,70, looking wall -30,17,70
   - Turn left -20,17,70, looking wall -20,17,20
   - Walk to -20,17,30, looking wall -20,17,20
   - Turn right -20,17,30, looking wall -50,17,30 
   Total: 8s
 */

camera {
  #if (clock >=0 & clock < 1)
    #declare xclock = clock;
    location <25, 17, 10>
    look_at <25 - 20*xclock, 17, 50>
  #end
  #if (clock >=1 & clock < 2)
    #declare xclock = clock - 1;
    location <25 - 20*xclock, 17, 10 + 30*xclock>
    look_at <5, 17, 50>
  #end
  #if (clock >=2 & clock < 3)
    #declare xclock = clock - 2;
    location <5, 17, 40 + 30*xclock>
    look_at <5, 17, 50 + 30*xclock>
  #end
  #if (clock >=3 & clock < 4)
    #declare xclock = clock - 3;
    location <5, 17, 70>
    look_at <5 - 35*xclock, 17, 80 - 10*xclock>
  #end
  #if (clock >=4 & clock < 5)
    #declare xclock = clock - 4;
    location <5 - 25*xclock, 17, 70>
    look_at <-30, 17, 70>
  #end
  #if (clock >=5 & clock < 6)
    #declare xclock = clock - 5;
    location <-20, 17, 70>
    look_at <-30 + 10*xclock, 17, 70 - 50*xclock>
  #end
  #if (clock >=6 & clock < 7)
    #declare xclock = clock - 6;
    location <-20, 17, 70 - 40*xclock>
    look_at <-20, 17, 20>
  #end
  #if (clock >=7 & clock <= 8)
    #declare xclock = clock - 7;
    location <-20, 17, 30>
    look_at <-20 - 30*xclock, 17, 20 + 10*xclock>
  #end
  //angle 90.0
}