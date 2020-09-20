//
//  CheckoutView.swift
//  Cup Cakes
//
//  Created by RANGA REDDY NUKALA on 20/09/20.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order


    
    var body: some View {
        GeometryReader { geo in
            
            ScrollView {
                Image("cupcake")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                
                Text("Your total is $\(order.cost, specifier: "%.2f")")
                    .font(.title)
                
                Button("Checkout") {
                    
                }.padding()
//                Form {
//                    Section(header: Text("Your Order")) {
//                        Text(Order.types[order.type])
//                        Text("\(order.quantity) Items")
//                        if(order.specialRequestEnabled) {
//                            HStack {
//                                Text("Added ")
//                                if(order.extraFrosting) {
//                                    Text("Extra Frosting")
//                                }
//                                if(order.extraFrosting && order.addSprinkles) {
//                                    Text("and")
//                                }
//                                if(order.addSprinkles) {
//                                    Text("Sprinkles")
//                                }
//                            }
//
//                        }
//                    }
//
//                    Section(header: Text("Shipped Address")) {
//                        Text(order.name)
//                        Text(order.streetAddress)
//                        Text(order.city)
//                        Text(order.zipCode)
//                    }
//
//                    Text("Thanks for Ordering!!!")
//
//                }.navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
