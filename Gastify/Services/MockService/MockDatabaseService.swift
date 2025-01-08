//
//  MockDatabaseService.swift
//  Gastify
//
//  Created by Santiago Moreno on 7/01/25.
//

import Foundation

class MockDatabaseService: DatabaseServiceProtocol {

    let mockRecords = MockRecordsHelper.mockRecords()

    func fetchRecords(filter: FilterItem) async -> [Record] {
        return MockRecordsHelper.applyFilter(to: self.mockRecords,
                                             by: filter)
    }

    func saveNewRecord(_ record: Record) async -> Bool {
        return true
    }

    func updateRecord(_ record: Record) async -> Bool {
        return true
    }
}
