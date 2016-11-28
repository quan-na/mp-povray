
#include "room-000.pov"
#include "room-001.pov"
#include "room-002.pov"

/* Script:
   - Start sitting at 25-10-10, looking lamb 25-25-25
   - Standing up 25-17-10, looking wall 25-17-50
   - Walking to center 25-17-25, looking wall 25-17-50
   - Turn left 25-17-25, looking map 0-17-25
   - Turn left 25-17-25, looking wall 25-17-0
   Total: 4s
 */

camera {
  location <25, 17, 5>
  look_at <25, 17, 25>
  //angle 90.0
}