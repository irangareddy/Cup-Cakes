//
//  AddressView.swift
//  Cup Cakes
//
//  Created by RANGA REDDY NUKALA on 20/09/20.
//

import SwiftUI


struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        NavigationView {
                Form{
                    Section(header: Text("Fill Your Adreess")) {
                        TextField("Name", text: $order.name)
                        TextField("Street Address", text: $order.streetAddress)
                        TextField("City", text: $order.city)
                        TextField("Zip Code", text: $order.zipCode)
                            .keyboardType(.numberPad)
                    }
                    
                    Section {
                        NavigationLink("Check Out", destination:
                                        CheckoutView(order: order))
                    }.disabled(order.hasValidAddress == false)
                    
                    
            }.navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
