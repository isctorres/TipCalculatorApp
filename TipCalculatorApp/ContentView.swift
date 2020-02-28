//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by Isc. Torres on 2/22/20.
//  Copyright © 2020 isctorres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var noPersonas = 2
    @State private var porcPropina = 2
    @State private var totalCuenta = ""
    let porcPropinas = [10,15,20,25,0]
    
    var totalPorPersona: Double{
        let nPersonas = Double(noPersonas+2)
        let pPropina = Double(porcPropinas[porcPropina])
        let tCuenta = Double(totalCuenta) ?? 0
        
        let totPropinas = tCuenta * (pPropina/100)
        let granTotal = tCuenta+totPropinas
        let porPersona = granTotal / nPersonas
        
        return porPersona
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Total Cuenta", text: $totalCuenta)
                        .keyboardType(.decimalPad)
                    Picker("No. Personas",selection: $noPersonas){
                        ForEach( 2 ..< 100 ){ index in
                            Text("\(index) personas")
                        }
                    }
                }
                Section(header: Text("¿Cuanta propina deseas dar?")){
                    Picker("Porcentaje Propina",selection: $porcPropina){
                        ForEach( 0 ..< porcPropinas.count ){
                            Text("\(self.porcPropinas[$0]) %")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    //Text("$\(calcular())")
                    Text("$\(totalPorPersona, specifier: "%.2f")")
                }
            }.navigationBarTitle(Text("Tip Calculator App"))
        }
    }
    
    /*func calcular() -> Double{
        let nPersonas = Double(noPersonas+2)
        let pPropina = Double(porcPropinas[porcPropina])
        let tCuenta = Double(totalCuenta) ?? 0
        
        let totPropinas = tCuenta * (pPropina/100)
        let granTotal = tCuenta+totPropinas
        let porPersona = granTotal / nPersonas
        
        return porPersona
    }*/
}

