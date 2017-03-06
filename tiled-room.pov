/*
 A room in a mind palace that can be expanded forever

 Author   :  Nguyen Anh Quan - naquan2112@gmail.com
 Created  :  2016-11-16
*/
#ifndef (tiled_room)
  #declare tiled_room=1;

  #include "colors.inc"
  #include "textures.inc"
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
        #if (tiled_making_map = 0)
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
        #else
          #if (iR = 0)
            <2,  30.1, 8>,  <8, 30.1, 8>, // 1,2
            <10, 30.1, 10>, <0, 30.1, 10> // 3,4
          #end
          #if (iR = 1)
            <2, 30.1, 2>,  <2, 30.1, 8>, // 1,2
            <0, 30.1, 10>, <0, 30.1, 0> // 3,4
          #end
          #if (iR = 2)
            <8, 30.1, 2>, <2,  30.1, 2>, // 1,2
            <0, 30.1, 0>, <10, 30.1, 0> // 3,4
          #end
          #if (iR = 3)
            <8,  30.1, 8>, <8,  30.1, 2>, // 1,2
            <10, 30.1, 0>, <10, 30.1, 10> // 3,4
          #end
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
        #if (tiled_making_map = 0)
          pigment { image_map { png "textures/wall-pattern.svg.png" } }
        #else
          pigment { color Red }
        #end
      }
      translate <iX*10, 0, iZ*10>
    }
  #end

  #macro MakeTiledFloor(iX, iZ)
    #if (tiled_making_map = 0)
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
  #end

  #ifndef (tiled_making_map)
    #declare tiled_making_map = 0;
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
        #if (tiled_making_map = 0)
          pigment{ color Black }
          finish{ reflection 0.7 }
        #else
          pigment{ color White }
        #end
      }
      translate <iX*10, 0, iZ*10>
    }
  #end

  #macro MakeTiledLight(iX, iZ)
    #if (tiled_making_map != 0)
      box {
        <2, 30, 2>
        <8, 30.2, 8>
        texture {
          pigment{ color Green }
        }
        translate <iX*10, 0, iZ*10>
      }
    #else
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
                      [0.0 rgb <0.5, 0.4, 0.4>]
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

  #macro MakePictureFrame(iWidth, iHeight, sTexture)
    #if (tiled_making_map = 0)
      #local frame_width = 0.5;
      #if (iWidth < 2 | iHeight < 2)
        #local frame_width = 0.2;
      #end
      union {
        box {
          <0, 0, -0.2> <frame_width, iHeight + 2*frame_width, 0>
        }
        box {
          <frame_width + iWidth, 0, -0.2> <iWidth + 2*frame_width, iHeight + 2*frame_width, 0>
        }
        box {
          <0, 0, -0.2> <iWidth + 2*frame_width, frame_width, 0>
        }
        box {
          <0, frame_width + iHeight, -0.2> <iWidth + 2*frame_width, iHeight + 2*frame_width, 0>
        }
        texture {
          T_Wood35
        }
      }
      mesh2 {
        vertex_vectors {
          4,
          <frame_width, frame_width, -0.1>, <frame_width+iWidth, frame_width, -0.1>,
          <frame_width+iWidth, frame_width+iHeight, -0.1>, <frame_width, frame_width+iHeight, -0.1>
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
          pigment { image_map { png sTexture } }
        }
      }
    #end
  #end

  #macro MakeMassWalls(iXStart, iXEnd, iZStart, iZEnd, iR)
    #for (iX, iXStart, iXEnd)
      #for (iZ, iZStart, iZEnd)
        MakeTiledWall(iX, iZ, iR)
      #end
    #end
  #end

  #macro MakeMassFlings(iXStart, iXEnd, iZStart, iZEnd)
    #for (iX, iXStart, iXEnd)
      #for (iZ, iZStart, iZEnd)
        MakeTiledFloor(iX, iZ)
        MakeTiledCeiling(iX, iZ)
      #end
    #end
  #end

  #macro MakePathBox(iX, iZ, iR1, iR2)
    MakeTiledFloor(iX, iZ)
    MakeTiledCeiling(iX, iZ)
    MakeTiledWall(iX, iZ, iR1)
    MakeTiledWall(iX, iZ, iR2)
  #end

  #macro CameraLine(px1, py1, pz1, cx1, cy1, cz1,
                    px2, py2, pz2, cx2, cy2, cz2,
                    ts)
    camera {
      location <px1 + ts * (px2 - px1), py1 + ts * (py2 - py1), pz1 + ts * (pz2 - pz1)>
      look_at  <cx1 + ts * (cx2 - cx1), cy1 + ts * (cy2 - cy1), cz1 + ts * (cz2 - cz1)>
    }
  #end
#end
