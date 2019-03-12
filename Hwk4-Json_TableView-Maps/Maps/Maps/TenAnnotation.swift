//
//  TenAnnotation.swift
//  Maps
//
//  Created by 徐一鸣 on 3/4/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit
import MapKit

class TenAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var identifier = "Pin"
    var historyText = ""
    var interPinPhoto: UIImage! = nil
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
