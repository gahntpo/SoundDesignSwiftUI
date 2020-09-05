//
//  SignUpView.swift
//  DesignProject
//
//  Created by Karin Prater on 18.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var accountManager = AccountManager()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Sign up").header2()
            
            VStack {
            TextField("email", text: $accountManager.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("password", text: $accountManager.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("repeat password", text: $accountManager.repeatPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.accountManager.makeAccount()
            }) {
                Text("Sign Up").frame(width: 160)
            }.buttonStyle(SimpleButtonStyle(isDisabled: !accountManager.signUpAllowed))
                .padding(.top)
            }
            HStack {
                Rectangle().frame(height: 1)
                Text("OR")
                Rectangle().frame(height: 1)
            }.foregroundColor(Color("Gray2"))
            
            SignAppleButton(credentials: $accountManager.credentials, error: $accountManager.error, isProcessing: $accountManager.isProcessing)
                .frame(width: 200, height: 60)
                .modifier(EShadow(elevation: .high))
            //added same shadow as for sign up button
            
            if accountManager.isProcessing {
                ActivityIndicator(isAnimating: accountManager.isProcessing)
            }
            
            Text(String(accountManager.error?.localizedDescription ?? ""))
                .foregroundColor(Color.pink)
            Text(accountManager.errorMessage)
                .errorText()
            
        }.padding().frame(maxWidth: 300)
            .onReceive(accountManager.$error) { (error) in
                if error != nil {
                    //play sound
                }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
