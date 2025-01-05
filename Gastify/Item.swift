//
//  Item.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
