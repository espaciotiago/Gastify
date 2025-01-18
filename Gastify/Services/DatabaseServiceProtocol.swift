//
//  DatabaseServiceProtocol.swift
//  Gastify
//
//  Created by Santiago Moreno on 7/01/25.
//

import SwiftData

protocol DatabaseServiceProtocol {
    func fetchRecords(filter: FilterItem) async -> [Record]
    func saveNewRecord(_ record: Record) async -> Bool
    func updateRecord(_ record: Record) async -> Bool
    func deleteRecord(_ record: Record) async -> Bool
    func getTotals() async -> (income: Double, outcome: Double)
}