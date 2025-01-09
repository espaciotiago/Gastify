//
//  RMRecord.swift
//  Gastify
//
//  Created by Santiago Moreno on 9/01/25.
//

import Foundation
import RealmSwift

class RMRecord: Object, ToRecordProtocol {

    @Persisted(primaryKey: true) var _id: UUID
    @Persisted var recordId: String
    @Persisted var title: String
    @Persisted var date: Date
    @Persisted var type: String
    @Persisted var amount: Double

    func toRecord() -> Record {
        Record(id: self.recordId,
               title: self.title,
               date: self.date,
               type: RcordType(rawValue: self.type) ?? .income,
               amount: self.amount)
    }
}
