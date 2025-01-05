//
//  Register.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

enum RegisterType: String {
    case income = "INCOME"
    case outcome = "OUTCOME"
}

struct Register {
    let title: String
    let date: String
    let type: RegisterType
    let amount: Double
}
