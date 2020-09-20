//
//  FormValidationView.swift
//  Cup Cakes
//
//  Created by RANGA REDDY NUKALA on 20/09/20.
//

import SwiftUI

struct FormValidationView: View {
    
    @State private var username = ""
    @State private var email = ""
    
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(username.isEmpty || email.isEmpty)

        }
    }
}

struct FormValidationView_Previews: PreviewProvider {
    static var previews: some View {
        FormValidationView()
    }
}
