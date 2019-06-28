//
//  Model.swift
//  Your Projects
//
//  Created by Carlos Modinez on 04/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import Foundation

class Model {
    static var shared = Model()
    var projects = [Project]()
    
    private init() {
        
    }
    
}
