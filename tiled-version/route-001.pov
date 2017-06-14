#version 3.7;

#include "room-000.pov"
#include "room-001.pov"
#if (clock < 3)
  #include "room-002.pov"
  #include "room-003.pov"
  #include "room-004.pov"
#end

/* Script:
   0 Start at 25,17,10, looking wall 25,17,50
   1 Turn left 25,17,10, looking door 5,17,50
   2 Walk to 5,17,40, looking door 5,17,50
   3 Walk to 5,17,70, looking wall 5,17,80
   4 Turn left 5,17,70, looking wall -30,17,70
   5 Walk to -20,17,70, looking wall -30,17,70
   6 Turn left -20,17,70, looking wall -20,17,20
   7 Walk to -20,17,30, looking wall -20,17,20
   8 Turn right -20,17,30, looking wall -50,17,30 
   Total: 8s
 */

#if (clock >=0 & clock < 1)
  CameraLine(25, 17, 10, 25, 17, 50,
             25, 17, 10,  5, 17, 50, clock)
#end
#if (clock >=1 & clock < 2)
  CameraLine(25, 17, 10,  5, 17, 50,
              5, 17, 40,  5, 17, 50, clock-1)
#end
#if (clock >=2 & clock < 3)
  CameraLine( 5, 17, 40,  5, 17, 50,
              5, 17, 70,  5, 17, 80, clock-2)
#end
#if (clock >=3 & clock < 4)
  CameraLine( 5, 17, 70,   5, 17, 80,
              5, 17, 70, -30, 17, 70, clock-3)
#end
#if (clock >=4 & clock < 5)
  CameraLine(  5, 17, 70, -30, 17, 70,
             -20, 17, 70, -30, 17, 70, clock-4)
#end
#if (clock >=5 & clock < 6)
  CameraLine(-20, 17, 70, -30, 17, 70,
             -20, 17, 70, -20, 17, 20, clock-5)
#end
#if (clock >=6 & clock < 7)
  CameraLine(-20, 17, 70, -20, 17, 20,
             -20, 17, 30, -20, 17, 20, clock-6)
#end
#if (clock >=7 & clock <= 8)
  CameraLine(-20, 17, 30, -20, 17, 20,
             -20, 17, 30, -50, 17, 30, clock-7)
#end
