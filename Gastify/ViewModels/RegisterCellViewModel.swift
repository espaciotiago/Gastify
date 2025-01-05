//
//  RegisterCellViewModel.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

struct RegisterCellViewModel {

    private let register: Register

    init(register: Register) {
        self.register = register
    }

    var title: String {
        register.title
    }

    var date: String {
        register.date
    }

    var amount: String {
        "$\(register.amount.toMoneyAmount())"
    }

    var type: RegisterType {
        register.type
    }
}
