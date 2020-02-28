//
//  JSONData.swift
//  Table Seating
//
//  Created by Sunny Zhao on 2/24/20.
//  Copyright © 2020 Sunny Zhao. All rights reserved.
//

import Foundation

struct JSONData: Codable {
    let kitchenStaff: [String]
    let waiters: [String]
    let tables: [String]
}

let urlString = ""//enter URL here
if let url = URL(string: urlString) {
    if let data = try? Data(contentsOf: url) {
        
    }
}

func parse(json: Data) {
    let decoder = JSONDecoder()
    
    if let jsonNames = try? decoder.decode(NameDecoder.self from: json)
}
