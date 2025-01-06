//
//  Register.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import Foundation

enum RegisterType: String {
    case income = "INCOME"
    case outcome = "OUTCOME"
}

struct Register: Identifiable {
    let id: String
    let title: String
    let date: Date
    let type: RegisterType
    let amount: Double
}
