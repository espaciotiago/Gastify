//
//  RegisterCellView.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import SwiftUI

struct RegisterCellView: View {

    let viewModel: RegisterCellViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 8) {
                ZStack {
                    Circle().fill(self.iconBackground)
                    IconImage(self.icon, color: Color.white)
                }
                .frame(width: 32, height: 32)
                VStack(alignment: .leading, spacing: 4) {
                    Text(self.viewModel.title)
                        .font(.label(weight: .medium))
                        .foregroundStyle(Color.dark)
                    Text(self.viewModel.date)
                        .font(.label(size: .small))
                        .foregroundStyle(Color.tertiary)
                }
                Spacer()
                Text(self.viewModel.amount)
                    .font(.title(size: .medium))
                    .foregroundStyle(Color.dark)
            }.padding(.horizontal)
            Divider()
        }
    }

    var icon: CustomIcon {
        self.viewModel.type == .income ? .arrowUp : .arrowDown
    }

    var iconBackground: Color {
        self.viewModel.type == .income ? .primary : .secondary
    }
}

#Preview {
    let income = Register(title: "Primera quincena de enero", date: "01/01/2025", type: .income, amount: 10.8778)
    let outcome = Register(title: "Gasto no 1", date: "01/01/2025", type: .outcome, amount: 100)
    let outcome1 = Register(title: "Gasto no 2", date: "01/01/2025", type: .outcome, amount: 10000)
    let outcome2 = Register(title: "Gasto no 3", date: "01/01/2025", type: .outcome, amount: 100500)
    let outcome3 = Register(title: "Gasto no 4", date: "01/01/2025", type: .outcome, amount: 1000000)
    let outcome4 = Register(title: "Gasto no 4", date: "01/01/2025", type: .outcome, amount: 1000000000)
    Group {
        RegisterCellView(viewModel: RegisterCellViewModel(register: income))
        RegisterCellView(viewModel: RegisterCellViewModel(register: outcome))
        RegisterCellView(viewModel: RegisterCellViewModel(register: outcome1))
        RegisterCellView(viewModel: RegisterCellViewModel(register: outcome2))
        RegisterCellView(viewModel: RegisterCellViewModel(register: outcome3))
        RegisterCellView(viewModel: RegisterCellViewModel(register: outcome4))
    }.padding()
}
