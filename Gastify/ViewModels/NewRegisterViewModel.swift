//
//  NewRegisterViewModel.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import Foundation

class NewRegisterViewModel: ObservableObject {

    @Published var loading = false
    @Published var selectedType: RegisterType = .income
    @Published var title: String = ""
    @Published var amount: String = ""

    let types: [RegisterType] = [.income, .outcome]
    private let maxDigits = 10
    private let maxDecimals = 2

    var isButtonDisabled: Bool {
        if title.isEmpty || amount.isEmpty {
            return true
        } else if let amount = Double(self.amount) {
            return amount <= 0
        }
        return true
    }

    func validateAndFormatAmount(_ newValue: String) {
        var filtered = newValue.filter { "0123456789,.".contains($0) }

        filtered = filtered.replacingOccurrences(of: ",", with: ".")

        if filtered.filter({ $0 == "." }).count > 1 {
            let components = filtered.components(separatedBy: ".")
            filtered = components[0] + "." + components[1...].joined()
        }

        if filtered.filter({ $0 != "." }).count > maxDigits {
            return
        }

        if let decimalIndex = filtered.firstIndex(of: ".") {
            let decimals = filtered[filtered.index(after: decimalIndex)...]
            if decimals.count > maxDecimals {
                return
            }
        }
        amount = filtered
    }

    func typeSelected(_ type: RegisterType) {
        selectedType = type
    }

    func isSelectedType(_ type: RegisterType) -> Bool {
        selectedType == type
    }

    func saveNewRegister() {
        
    }
}
