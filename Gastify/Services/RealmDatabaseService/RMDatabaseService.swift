//
//  RMDatabaseService.swift
//  Gastify
//
//  Created by Santiago Moreno on 26/01/25.
//

import Foundation
import RealmSwift

@MainActor
class RMDatabaseService: DatabaseServiceProtocol {

    private let realm = try! Realm()

    func fetchRecords(filter: FilterItem) async -> [Record] {
        let calendar = Calendar.current
        let now = Date()
        var predicate: NSPredicate

        switch filter {
        case .today:
            let startOfDay = calendar.startOfDay(for: now)
            let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            predicate = NSPredicate(format: "date >= %@ AND date < %@", startOfDay as NSDate, endOfDay as NSDate)

        case .week:
            let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now))!
            let endOfWeek = calendar.date(byAdding: .day, value: 7, to: startOfWeek)!
            predicate = NSPredicate(format: "date >= %@ AND date < %@", startOfWeek as NSDate, endOfWeek as NSDate)

        case .month:
            let components = calendar.dateComponents([.year, .month], from: now)
            let startOfMonth = calendar.date(from: components)!
            let endOfMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth)!
            predicate = NSPredicate(format: "date >= %@ AND date < %@", startOfMonth as NSDate, endOfMonth as NSDate)

        case .year:
            let oneYearAgo = calendar.date(byAdding: .year, value: -1, to: now)!
            predicate = NSPredicate(format: "date >= %@ AND date <= %@", oneYearAgo as NSDate, now as NSDate)
        }

        let results = realm.objects(RMRecord.self).filter(predicate)
        return Array(results).map { $0.toRecord() }
    }

    func saveNewRecord(_ record: Record) async -> Bool {
        do {
            let rlmRecord = RMRecord()
            rlmRecord.recordId = record.id
            rlmRecord.title = record.title
            rlmRecord.date = record.date
            rlmRecord.type = record.type.rawValue
            rlmRecord.amount = record.amount

            try self.realm.write {
                self.realm.add(rlmRecord)
            }
            return true
        } catch {
            print("Error saving record: \(error)")
            return false
        }
    }

    func updateRecord(_ record: Record) async -> Bool {
        return false
    }

    func deleteRecord(_ record: Record) async -> Bool {
        return false
    }

    func getTotals() async -> (income: Double, outcome: Double) {
        return (income: 0.0, outcome: 0.0)
    }
}