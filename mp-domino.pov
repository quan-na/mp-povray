/*
 A modular mind palace that can be expanded forever

 Author   :  Nguyen Anh Quan - naquan2112@gmail.com
 Created  :  2016-10-21
*/
#ifndef (mp_domino)
  #declare mp_domino=1;

  #include "colors.inc"
  #include "textures.inc"
  #include "stones.inc"
  #include "woods.inc"

  global_settings {
    radiosity { // copied from tutorial
      pretrace_start 0.08
      pretrace_end   0.01
      count 150
      nearest_count 10
      error_bound 0.5
      recursion_limit 2
      low_error_factor 0.5
      gray_threshold 0.0
      minimum_reuse 0.005
      maximum_reuse 0.2
      brightness 3
      adc_bailout 0.005
    }
    ambient_light rgb<0.1, 0.1, 0.1>
  }

  light_source { // sun like, in south west position
    <0, 1000, 0>
    color White
    parallel
    point_at<100, 800, 100> 
  }

  #declare TileNormal = normal
  { gradient x 2 // Double the strength because of the averaging
    slope_map
    { [0 <0, 1>] // 0 height, strong slope up
      [.05 <1, 0>] // maximum height, horizontal
      [.95 <1, 0>] // maximum height, horizontal
      [1 <0, -1>] // 0 height, strong slope down
    }
  }

  #macro MakeModule(vecPos, iRot, iFrontDoor, iBackDoor, iLeftDoor, iRightDoor) //Make a 2x5x3 module with roof window and doors
    union { // whole module to translate and to rotate
      box { // the floor
        <0, -1, 0>
        <20, 0, 50>
        texture {
          T_Grnt19
        }
        normal { 
          average normal_map {
            [1 TileNormal]
            [1 TileNormal rotate y*90]
          }
        }
      }
      difference { // the ceiling
        box {
          <0, 30, 0>
          <20, 31, 50>
        }
        box {
          <0.5, 25, 10.5>
          <19.5, 35, 29.5>
        }
        cylinder {
          <10, 25, 40>,     // Center of one end
          <10, 35, 40>,     // Center of other end
          2            // Radius
        }
        texture {
          T_Grnt16
        }
      }
      union {
        #declare step=0;
        #while (step < 3)
          box {
            <4.7+5*step, 29.7, 10>
            <5.3+5*step, 30.7, 30>
          }
          box {
            <0, 29.7, 14.7+5*step>
            <20, 30.7, 15.3+5*step>
          }
          #declare step = step + 1;
        #end
        texture {
          T_Wood10
        }
      }
      union { // walls
        difference { // front wall
          box {
            <0, 0, 0>
            <20, 30, 0.5>
          }
          box {
            <iFrontDoor*10-9, -1, -5>
            <iFrontDoor*10-1, 19, 5>
          }
        }
        difference { // back wall
          box {
            <0, 0, 49.5>
            <20, 30, 50>
          }
          box {
            <iBackDoor*10-9, -1, 45>
            <iBackDoor*10-1, 19, 55>
          }
        }
        difference { // left wall
          box {
            <0, 0, 0>
            <0.5, 30, 50>
          }
          box {
            <-5, -1, iLeftDoor*10-9>
            <5, 19, iLeftDoor*10-1>
          }
        }
        difference { // right wall
          box {
            <19.5, 0, 0>
            <20, 30, 50>
          }
          box {
            <15, -1, iRightDoor*10-9>
            <25, 19, iRightDoor*10-1>
          }
        }
        texture {
          T_Grnt20
        }
      }
      rotate <0, -90*iRot, 0>
      translate vecPos
    }
  #end
#end