//
//  URLs.swift
//  Images
//
//  Created by Terence on 10/8/16.
//  Copyright © 2016 Yongxin (Terence) Feng. All rights reserved.
//

import Foundation

class URLs {
    
    static private let imageURLs = ["EAS": "https://upload.wikimedia.org/wikipedia/commons/d/d6/EAS_Hall_SIT.jpg",
                                    "Babbio": "https://upload.wikimedia.org/wikipedia/commons/4/46/BabbioCenterNight.jpg",
                                    "CS": "https://www.cs.stevens.edu/~yfeng11/damo.png"]
    
    static func StevensImages(name: String) -> URL? {
        if let url = imageURLs[name] {
            return URL(string: url)
        }
        return nil
    }
    
}
