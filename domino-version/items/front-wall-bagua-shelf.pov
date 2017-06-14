/*
  a shelf with 8 container,
  to be positioned on front wall
  +---+-------+---+
  |   |       |   |
  |   +-------+   |
  |   |       |   |
  +---+       +---+
  |   |       |   |
  |   |       |   |
  +---+       +---+
  |   |       |   |
  |   +-------+   |
  |   |       |   |
  +---+-------+---+
  29x19, along length size : 6-7-6
  along height size : 9-11-9, 7-15-7
  depth : 4
  thick : 0.2
*/

// assumed that various useful files are included in mp-domino
#ifndef (front_wall_bagua_shelf)
  #declare front_wall_bagua_shelf=1;

  #macro MakeFrontWallBaguaShelf()
    // notice that the shelf will be already translate <0.5, 0, 0.5> because of walls
    union {
      // horizontal panes
      box {
        <0.5, 0.2, 0.5>
        <19.5, 0.4, 4.5>
      }
      box {
        <0.5, 29, 0.5>
        <19.5, 29.2, 4.5>
      }
      box {
        <0.5, 9.1, 0.5>
        <19.5, 9.3, 4.5>
      }
      box {
        <0.5, 20.1, 0.5>
        <19.5, 20.3, 4.5>
      }
      // vertical panes
      box {
        <0.5, 0.2, 0.5>
        <0.7, 29.2, 4.5>
      }
      box {
        <6.4, 0.2, 0.5>
        <6.6, 29.2, 4.5>
      }
      box {
        <13.4, 0.2, 0.5>
        <13.6, 29.2, 4.5>
      }
      box {
        <19.3, 0.2, 0.5>
        <19.5, 29.2, 4.5>
      }
      texture {
        T_Wood13
      }
    }
  #end
#end
