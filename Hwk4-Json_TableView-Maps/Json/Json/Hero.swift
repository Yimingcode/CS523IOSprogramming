//
//  Hero.swift
//  Json
//
//  Created by 徐一鸣 on 3/5/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class Hero: Codable {
    let heroName: String
    let name: String
    
    init(heroName: String, name: String) {
        self.heroName = heroName
        self.name = name
    }
    
}
