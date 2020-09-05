//
//  EmojiDataModel.swift
//  ArchitecturProject
//
//  Created by Karin Prater on 21.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import Foundation
import Combine

class EmojiDataModel: ObservableObject {
    
    @Published var emojis = ["🍓", "🥑", "🌎", "🦋", "🐳", "☘️", "🍄"]
    
    @Published var requestedDeleteEmojis: IndexSet? = nil
    
    func delete() {
        if let indices = requestedDeleteEmojis {
            for index in indices.reversed() {
                emojis.remove(at: index)
            }
        }
    }
    
    func emojoToDelet() -> String {
        if let index = requestedDeleteEmojis?.first {
           return self.emojis[index]
        }else {
            return ""
        }
    }
    
    func addNew(emoji: String) {
        emojis.append(emoji)
    }
    
    
}
