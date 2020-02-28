//
//  Decoder.swift
//  Table Seating
//
//  Created by Sunny Zhao on 2/24/20.
//  Copyright © 2020 Sunny Zhao. All rights reserved.
//

import Foundation

struct NameDecoder: Codable {
    let kitchenStaff: [String]
    let waiters: [String]
    let tables: [String]
}

