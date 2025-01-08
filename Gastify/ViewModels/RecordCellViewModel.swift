//
//  RecordCellViewModel.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

struct RecordCellViewModel {

    private let register: Record

    init(register: Record) {
        self.register = register
    }

    var title: String {
        register.title
    }

    var date: String {
        register.date.showText()
    }

    var amount: String {
        "$\(register.amount.toMoneyAmount())"
    }

    var type: RcordType {
        register.type
    }
}
