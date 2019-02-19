/*Yiming Xu
 10438422 */

import Cocoa

var Weather = 50
var Schedule = 2
var LikeRunning = 5

if LikeRunning >= 5{
    if Schedule <= 2{
        if Weather > 45 && Weather < 90{
            print("Going for a Run")
        }else{
            print("Not going for a Run")
        }
    }else{
        print("Not going for a Run")
    }
}else{
    print("Not going for a Run")
}
