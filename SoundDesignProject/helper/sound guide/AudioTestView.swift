//
//  AudioTestView.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct AudioTestView: View {
    
    @State private var isOn: Bool = false
    @State private var selectedDate = Date()
    @State private var message: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Play Sounds")
                .font(.title)
            
            
            DatePicker(selection: $selectedDate) {
                Text("select date and time")
            }.labelsHidden()
            
            TextField("message", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
            
            Toggle(isOn: $isOn) {
                Text("check")
            }.frame(width: 200)
            
            
            Button(action: {
               
            }) {
                Text("button without sound")
            }
 
        }
    }
}

struct AudioTestView_Previews: PreviewProvider {
    static var previews: some View {
        AudioTestView()
    }
}
