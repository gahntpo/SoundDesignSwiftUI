//
//  SettingsManager.swift
//  ControlViewProject
//
//  Created by Karin Prater on 14.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import Foundation
import SwiftUI

class SettingsManager: ObservableObject {
    
    @Published var username: String = ""
    @Published var isPrivate: Bool = true
    @Published var notificationsEnabled: Bool = false
    @Published var selectedPreviewOption: PreviewOptions = .never
    
}

enum PreviewOptions: String, CaseIterable {
    case always = "Always"
    case whenUnlocked = "When unlocked"
    case never = "Never"
}
