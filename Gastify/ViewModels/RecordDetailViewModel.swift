//
//  RecordDetailViewModel.swift
//  Gastify
//
//  Created by Santiago Moreno on 7/01/25.
//

import Foundation

enum RecordDetaiSheet: Identifiable {
    var id: String { String(describing: self) }
    case updateRecord(_ record: Record)
}

class RecordDetailViewModel: ObservableObject {

    @Published var sheet: RecordDetaiSheet?

    let record: Record

    init(record: Record) {
        self.record = record
    }

    func updateRecord() {
        self.sheet = .updateRecord(self.record)
    }

    func deleteRecord() {
        // TODO: Delete
    }
}
