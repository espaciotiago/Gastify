//
//  Register.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import Foundation

enum RegisterType: String, Identifiable {
    var id: String { rawValue }
    case income = "INCOME"
    case outcome = "OUTCOME"

    var label: String {
        switch self {
        case .income: return "Nuevo ingreso"
        case .outcome: return "Nuevo gasto"
        }
    }
}

struct Register: Identifiable {
    let id: String
    let title: String
    let date: Date
    let type: RegisterType
    let amount: Double
}
