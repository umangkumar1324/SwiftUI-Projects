//
//  ContentView.swift
//  weSplit
//
//  Created by Umang Kumar on 8/1/20.
//  Copyright © 2020 Umang Kumar. All rights reserved.
//make an app that takes the original bill amount adds the tip  based on the amount you select then gives you the total


import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var percent = 2
    @State private var amountOfPeople = 2
    
    let percentAmounts = [0,10,15,20,25]
    
    var amountPerPerson: Double{
        let bill = Double(billAmount) ?? 0
        let tipPercent = Double(percent)
        let people = Double(amountOfPeople)
        
        let tipValue = bill*tipPercent/100
        let totalAmount = bill + tipValue
        let perPerson = totalAmount/people
        return perPerson
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Bill Amount", text: $billAmount)
                    Picker("Number of people", selection: $amountOfPeople){
                        ForEach(0 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip would you like to add?")){
                    Picker("Tip Amount", selection: $percent){
                        ForEach(0 ..< percentAmounts.count){
                            Text("\(self.percentAmounts[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("Total Amount per Person: \(amountPerPerson)")
                }
                
                
            }.navigationBarTitle("WeSplit")
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
