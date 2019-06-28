//
//  Activity.swift
//  Your Projects
//
//  Created by Carlos Modinez on 04/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import Foundation
import UIKit

class Activity {
    var name : String
    var description : String
    var date : String
    
    init(name : String, description : String, date : String) {
        self.name = name
        self.description = description
        self.date = date
    }
    convenience init(){
        self.init(name: "", description: "", date: "")
    }
}
