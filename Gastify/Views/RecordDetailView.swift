//
//  RecordDetailView.swift
//  Gastify
//
//  Created by Santiago Moreno on 7/01/25.
//

import SwiftUI

struct RecordDetailView: View {

    @StateObject var viewModel: RecordDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            RecordCellView(viewModel: RecordCellViewModel(record: self.viewModel.record))
                .padding(.top)
            Spacer()
            HStack {
                SecondaryButton(label: "Eliminar") {
                    self.viewModel.deleteRecord()
                }
                PrimaryButton(label: "Editar") {
                    self.viewModel.updateRecord()
                }
            }.padding()
        }.navigationTitle("Detalle de registro")
    }
}

#Preview {
    let record = Record(id: "1",
                        title: "Preview new record",
                        date: Date(),
                        type: .income,
                        amount: 1000)
    return RecordDetailView(viewModel: RecordDetailViewModel(record: record))
}
