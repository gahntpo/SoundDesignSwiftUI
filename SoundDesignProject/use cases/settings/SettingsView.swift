//
//  SettingsView.swift
//  ControlViewProject
//
//  Created by Karin Prater on 14.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @ObservedObject var settings = SettingsManager()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("username", text: $settings.username)
                    Toggle(isOn: $settings.isPrivate) {
                        Text("Private Account")
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                    }
                }
                
                Section(header: Text("Notification")) {
                    Toggle(isOn: $settings.notificationsEnabled) {
                        Text("enable Notifications")
                    }
                    
                    Picker(selection: $settings.selectedPreviewOption, label: Text("preview option")) {
                        ForEach(PreviewOptions.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    
                }
                
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.0")
                    }
                    
                    NavigationLink(destination: WebActiveView(url: URL(string: "https://www.apple.com")!)) {
                         Text("Terms of Use")
                    }
                    NavigationLink(destination: WebActiveView(url: URL(string: "https://www.apple.com")!)) {
                        Text("Privacy Policy")
                    }
                    
                }
                
                Section {
                    Button(action: {
                        SKStoreReviewController.requestReview()
                    }) {
                        Text("Giva a 5 stare rating")
                    }
                }
                
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



