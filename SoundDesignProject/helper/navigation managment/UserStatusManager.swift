//
//  UserStatusManager.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import Foundation
import Combine

class UserStatusManager: ObservableObject {
    
    @Published var showOnboarding: Bool
    
    var subscriptions = Set<AnyCancellable>()

    init() {
        
        if let new = UserDefaults.standard.object(forKey: onboardingKey) as? Bool {
            print("user has seen onboarding before")
            self.showOnboarding = new
        }else {
            print("start application with showing onboarding")
            self.showOnboarding = true
        }

        $showOnboarding.sink { (value) in
            UserDefaults.standard.set(value, forKey: self.onboardingKey)
            print("set user has seen onboarding to: \(value)")
        }.store(in: &subscriptions)
    }
    
    let onboardingKey: String = "userHasSeenOnboarding"
}
