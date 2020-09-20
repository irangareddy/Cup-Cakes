//
//  ContentView.swift
//  Cup Cakes
//
//  Created by RANGA REDDY NUKALA on 20/09/20.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select a CupCake",
                           selection: $order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                }
            
                
                Stepper("Number of Cakes:  \(order.quantity)", value: $order.quantity, in: 1...20)
                
                Section(header: Text("More")) {
                    Toggle("Any Special Request", isOn: $order.specialRequestEnabled.animation())
                    if(order.specialRequestEnabled) {
                        Toggle("Add Extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Add Sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink("Delivery Details", destination: AddressView(order: order))
                }
                
                
            }.navigationTitle("Cup Cakes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
