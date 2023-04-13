//
//  ContentView.swift
//  SwiftUiCurrencyXchange
//
//  Created by Philip Andersson on 2023-04-12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var xChangeVM = XchangeViewModel()
    
    @State private var selectedCurrencyName = "USD"
    @State private var selectedCurrencyToCompareName = "USD"
    
    @State private var amount : Double = 1.0
    @State private var result : Double = 1.0
    
    
    var body: some View {
        VStack {
            
            TextField("Amount", value: $amount, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .onChange(of: amount) { newValue in
                        result = xChangeVM.result(amount: newValue)
                    }
            
            HStack {
                Spacer()
                Picker(selection: $selectedCurrencyName, label: Text("Currency")) {
                    ForEach(xChangeVM.initialCurrencies, id: \.name) { currency in
                        Text(currency.name)
                    }
                }
                .onChange(of: selectedCurrencyName) { name in
                    if let currency = xChangeVM.initialCurrencies.first(where: {
                        $0.name == name }) {
                        xChangeVM.choosenCurrency = currency
                        result = xChangeVM.result(amount: amount)
                    }
                }
                .padding()
                Text("To")
                
                Picker(selection: $selectedCurrencyToCompareName, label: Text("Currency")) {
                    ForEach(xChangeVM.initialCurrencies, id: \.name) { currency in
                        Text(currency.name)
                    }
                }
                .onChange(of: selectedCurrencyToCompareName) { name in
                    if let currency = xChangeVM.initialCurrencies.first(where: {
                        $0.name == name }) {
                        xChangeVM.choosenCurrencyToCompare = currency
                        result = xChangeVM.result(amount: amount)
                    }
                }
                .padding()
                Spacer()
                
            }
            Text("\(String(format: "%.2f", amount)): \(selectedCurrencyName) = \(String(format: "%.2f", result)): \(selectedCurrencyToCompareName)")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 1. Modellen: Detta är där du kommer att hämta valutakurser och konvertera valutor.
// 2. Vyn: Detta är där du kommer att visa användargränssnittet för valutaomvandlaren.
// 3. Vymodellen: Detta är där du kommer att hantera all affärslogik och uppdatera vyn baserat på modellens tillstånd.

// X välj en basvaluta (USD)
// 



// implementera Open Exchange Rates API?
//
