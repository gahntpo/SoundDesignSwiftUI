//
//  SignAppleButton.swift
//  ControlViewProject
//
//  Created by Karin Prater on 14.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct SignAppleButton: UIViewRepresentable {
  
    @Binding var credentials: ASAuthorizationCredential?
    @Binding var error: ASAuthorizationError?
    @Binding var isProcessing: Bool
  
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton(authorizationButtonType: .signUp, authorizationButtonStyle: .black)
        
        //change style from default to sign up
        
        button.addTarget(context.coordinator, action: #selector(Coordinator.handleAuthoRequest), for: .touchUpInside)
        
        return button
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
    
    
    class Coordinator:  NSObject, ASAuthorizationControllerDelegate,  ASAuthorizationControllerPresentationContextProviding {
      
        var parent: SignAppleButton
        
        init(_ signAppleButton: SignAppleButton) {
            self.parent = signAppleButton
        }
        
        @objc func handleAuthoRequest() {
            let provider = ASAuthorizationAppleIDProvider()
            let request = provider.createRequest()
            request.requestedScopes = [.email, .fullName]
        
            let authController = ASAuthorizationController(authorizationRequests: [request])
            authController.delegate = self
            authController.presentationContextProvider = self
            
            parent.isProcessing = true
            authController.performRequests()
            
        }
        
        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
          
            parent.isProcessing = false
            
            switch authorization.credential {
            case let appleIDCredentials  as ASAuthorizationAppleIDCredential:
                parent.credentials = appleIDCredentials
                
            case _ as ASPasswordCredential:
                print("got password credential")
            default:
                break
            }
            
        }
        
        func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
            
             parent.isProcessing = false
            if let new = error as? ASAuthorizationError {
                parent.error = new
            }
        }
        
        
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            let vc = UIApplication.shared.windows.last?.rootViewController
            return (vc?.view.window)!
        }
    }
}

struct SignAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignAppleButton(credentials: .constant(nil), error: .constant(nil), isProcessing: .constant(false))
        .frame(width: 200, height: 60)
    }
}
