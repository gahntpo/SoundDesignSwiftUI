//
//  AccountManager.swift
//  DesignProject
//
//  Created by Karin Prater on 18.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import Foundation
import Combine
import AuthenticationServices

class AccountManager: ObservableObject {
 
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    
    @Published var signUpAllowed: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var credentials: ASAuthorizationCredential?
       @Published var error: ASAuthorizationError?
       @Published var isProcessing: Bool = false
    
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $email.sink { (value) in
            
            if value.count > 4 || value.count == 0 {
                self.errorMessage = ""
            }else {
                self.errorMessage = "error: use valid email"
            }
            
        }.store(in: &subscriptions)
        
        
        $email.combineLatest($password, $repeatPassword).map { (email, pass, repeatedPass) -> Bool in
            if email.count > 4 && pass.count > 4 && pass == repeatedPass {
                return true
            }else {
                return false
            }
        
        }.assign(to: \.signUpAllowed, on: self)
        .store(in: &subscriptions)
        
    }
    
    func makeAccount() {
        
    }
}


