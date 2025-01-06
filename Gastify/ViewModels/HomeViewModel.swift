//
//  HomeViewModel.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import Foundation

enum HomeSheet: Identifiable {
    var id: Self { self }
    case newRegister
}

class HomeViewModel: ObservableObject {
    
    @Published var sheet: HomeSheet?
    @Published var loading = false
    @Published var loadingTotals = false

    var activeFilter: FilterItem = .today
    var registers: [Register] = []
    var totalIncome: Double = 0
    var totalOutcome: Double = 0
    let filters: [FilterItem] = [.today, .week, .month, .year]
    // TODO: Remplazar por BD
    let mockRegisters = MockRegisterHelper.mockRegisters()

    var totalIncomeText: String {
        return "$\(self.totalIncome.toMoneyAmount())"
    }

    var totalOutcomeText: String {
        return "$\(self.totalOutcome.toMoneyAmount())"
    }

    func getInitialData() {
        self.getTotals()
        self.getRegisters()
    }

    func getTotals() {
        // TODO: - Cambiar esta logica para obtener la data desde un servicio de BD
        self.loadingTotals = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.totalIncome = 10000000
            self.totalOutcome = 500000
            self.loadingTotals = false
        }
    }

    func getRegisters() {
        // TODO: - Cambiar esta logica para obtener la data desde un servicio de BD
        self.loading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.registers = MockRegisterHelper.applyFilter(to: self.mockRegisters,
                                                            by: self.activeFilter)
            self.loading = false
        }
    }

    func filterSelected(_ filter: FilterItem) {
        self.activeFilter = filter
        self.getRegisters()
    }

    func isFilterSelected(_ filter: FilterItem) -> Bool {
        self.activeFilter == filter
    }

    func reorganizeFilters() -> [FilterItem] {
        guard let index = filters.firstIndex(of: activeFilter),
              index != 0 else { return filters }
        var newFilters = filters
        let selectedFilter = newFilters.remove(at: index)
        newFilters.insert(selectedFilter, at: 0)
        return newFilters
    }

    func newRegister() {
        self.sheet = .newRegister
    }
}
