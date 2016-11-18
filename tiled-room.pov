/*
 A room in a mind palace that can be expanded forever

 Author   :  Nguyen Anh Quan - naquan2112@gmail.com
 Created  :  2016-11-16
*/
#ifndef (tiled_room)
  #declare tiled_room=1;

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
      brightness 1
      adc_bailout 0.005
    }
    assumed_gamma 1.0
  }

  #macro MakeTiledWall(iX, iZ, iR)
    mesh2 {
      vertex_vectors {
        4,
        #if (iR = 0)
          <0,  0,  10>, <10, 0,  10>, // 1,2
          <10, 30, 10>, <0,  30, 10> // 3,4
        #end
        #if (iR = 1)
          <0, 0,  0>,  <0, 0,  10>, // 1,2
          <0, 30, 10>, <0, 30, 0> // 3,4
        #end
        #if (iR = 2)
          <10, 0,  0>, <0,  0,  0>, // 1,2
          <0,  30, 0>, <10, 30, 0> // 3,4
        #end
        #if (iR = 3)
          <10, 0,  10>, <10, 0,  0>, // 1,2
          <10, 30, 0>,  <10, 30, 10> // 3,4
        #end
      }
      uv_vectors {
        4,
        <0, 0>, <1, 0>,  <1, 1>, <0, 1>     
      }
      face_indices {
        2, 
        <0, 1, 2>, <0, 2, 3>
      }
      uv_mapping
      texture {
        pigment { image_map { png "textures/wall-pattern.svg.png" } }
      }
      translate <iX*10, 0, iZ*10>
    }
  #end

  #macro MakeTiledFloor(iX, iZ)
    mesh2 {
      vertex_vectors {
        4, 
        <0,  0, 0>,  <10, 0, 0>,
        <10, 0, 10>, <0,  0, 10>
      }
      face_indices {
        2, 
        <0, 1, 2>, <0, 2, 3>
      }
      uv_mapping
      texture{
        pigment{ color Black }
        finish{ reflection 0.05 }
      }
      translate <iX*10, 0, iZ*10>
    }
  #end

  #macro MakeTiledCeiling(iX, iZ)
    mesh2 {
      vertex_vectors {
        4, 
        <0,  30, 0>,  <10, 30, 0>,
        <10, 30, 10>, <0,  30, 10>
      }
      face_indices {
        2, 
        <0, 2, 1>, <0, 3, 2>
      }
      uv_mapping
      texture{
        pigment{ color Black }
        finish{ reflection 0.7 }
      }
      translate <iX*10, 0, iZ*10>
    }
  #end

  #macro MakeTiledLight(iX, iZ)
    light_source {
      <5, 29, 5>
      color White
      looks_like {
        mesh2 {
          vertex_vectors {
            5, 
            <0,  0, 0>,
            <-1, 1, -1>, <1, 1, -1>,
            <1, 1, 1>, <-1, 1, 1>
          }
          face_indices {
            4,
            <0, 1, 2>, <0, 2, 3>,
            <0, 3, 4>, <0, 4, 1>
          }
          uv_mapping
          hollow
          material {
            texture {
              pigment {Clear}
            }
            interior {
              media{
                emission 0.75
                scattering {1, 0.5}
                density {
                  spherical
                  color_map {
                    [0.0 rgb <0,5, 0.4, 0.4>]
                    [0.5 rgb <0.9, 0.9, 0.7>]
                    [1.0 rgb <1,1,1>]
                  }
                }
              }
            }
          }
        }
      }
      translate <iX*10, 0, iZ*10>
    }
  #end
#end
