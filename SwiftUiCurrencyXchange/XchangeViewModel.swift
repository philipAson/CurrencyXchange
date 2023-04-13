//
//  XchangeViewModel.swift
//  SwiftUiCurrencyXchange
//
//  Created by Philip Andersson on 2023-04-12.
//

import Foundation

// ViewModel (think controller ish)
class XchangeViewModel : ObservableObject {
    
    @Published var choosenCurrency = Currency(name: "USD", conversionRateUSD: 1.0)
    @Published var choosenCurrencyToCompare = Currency(name: "USD", conversionRateUSD: 1.0)
    
    @Published var initialCurrencies: [Currency] = []
    
    init() {
        initialCurrencies = [
            Currency(name: "USD", conversionRateUSD: 1.0),
            Currency(name: "EUR", conversionRateUSD: 1.1),
            Currency(name: "GBP", conversionRateUSD: 1.25),
            Currency(name: "SEK", conversionRateUSD: 0.097),
            Currency(name: "NOK", conversionRateUSD: 0.096),
            Currency(name: "DKK", conversionRateUSD: 0.15),
            Currency(name: "AUD", conversionRateUSD: 0.67),
            Currency(name: "RUB", conversionRateUSD: 0.012),
            Currency(name: "JPY", conversionRateUSD: 0.0075)
        ]
    }
    
    func result(amount : Double) -> Double {
        var result = 0.0
        result = amount*(choosenCurrency.conversionRateUSD/choosenCurrencyToCompare.conversionRateUSD)
        return result
    }
    
}
