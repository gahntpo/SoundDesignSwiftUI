//
//  ContentView.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 05.09.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//       var body: some View {
//          
//          AudioTestView()
//       }
//}

struct ContentView: View {

       @ObservedObject var userStats = UserStatusManager()

       var body: some View {

           Group {
               if self.userStats.showOnboarding {
                   OnboardingView(showOnboarding: self.$userStats.showOnboarding)
               }else {
                   MenuView()
               }
           }
       }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
