//
//  APIErrorResponse.swift
//  NetworkingArchitectureExample
//
//  Created by Guilherme Souza on 4/4/17.
//  Copyright © 2017 Guilherme Souza. All rights reserved.
//

import Foundation
import ObjectMapper

struct APIErrorResponse: Mappable {
    var code: Int?
    var message: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
}
