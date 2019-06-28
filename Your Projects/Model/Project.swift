//
//  Activity.swift
//  Your Projects
//
//  Created by Carlos Modinez on 04/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import Foundation
import UIKit

class Project {
    var Name : String
    var image : UIImage
    var Description : String
    var activities : [Activity]
    
    init(Name : String, image : UIImage, Description : String, activities : [Activity]) {
        self.Name = Name
        self.image = image
        self.Description = Description
        self.activities = activities
    }
    convenience init() {
        self.init(Name : "", image : #imageLiteral(resourceName: "plusIcon"), Description : "", activities : [])
    }
    
}
