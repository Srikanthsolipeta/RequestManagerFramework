//
//  AnimalData.swift
//  RequestManager
//
//  Created by Srikanth Solipeta on 9/22/18.
//  Copyright © 2018 apex. All rights reserved.
//

import Foundation

struct Animals: Decodable {
    var animals: [Animal]?
}

struct Animal: Decodable {
    let name, imageURL , discription : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "imageUrl"
        case discription
    }
}

