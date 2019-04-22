//
//  Question.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/22/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {

    @objc dynamic var name: String?
    @objc dynamic var content: String?
    
}
