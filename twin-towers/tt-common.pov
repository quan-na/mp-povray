/*
 Common file for twin tower

 Author   :  Nguyen Anh Quan - naquan2112@gmail.com
 Created  :  2017-06-25
*/
#ifndef (tt_common)
  #declare tt_common=1;

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

  /*
  linear tweening 1 variable
  */
  #macro tween(startTime, endTime, startValue, endValue)
    #if (clock >=startTime & clock < endTime)
      #local deltaTime = (clock - startTime) / (endTime - startTime);
      #local delta = endValue - startValue;
      (startValue + delta*deltaTime)
    #end
  #end

  /*
  outer structure : the islands
  */
  #macro outerStructure()
    //--> sea
    plane{
      <0, -1, 0>,
      0
      texture{
        Polished_Chrome
        normal{ bumps 0.03
          scale <1,0.25,0.25>*1
          turbulence 0.6
        }
      }
     }
    //<-- sea
  #end
#end
