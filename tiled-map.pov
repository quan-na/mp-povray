#declare tiled_making_map = 1;

#include "room-000.pov"

light_source { // sun like, in south west position
  <0, 1000, 0>
  color White
  parallel
  point_at<100, 800, 100>
}

camera {
  location <0, 300, 0>
  look_at <0, 200, 0>
  //angle 90.0
}