//
//  MenuView.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct MenuView: View {
       @State private var selection = 0
    
       var body: some View {
           TabView(selection: $selection){
               
               EmojiList()
                   .tabItem {
                       VStack {
                           Image(systemName: "smiley")
                           Text("Emojis")
                       }
                   }
                   .tag(0)
               
               SettingsView()
                   .tabItem {
                       VStack {
                           Image(systemName: "gear")
                           Text("Settings")
                       }
                   }
                   .tag(1)
           }.accentColor(Color("Accent"))
       }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
