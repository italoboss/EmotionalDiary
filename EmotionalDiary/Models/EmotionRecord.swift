//
//  EmotionRecord.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 12/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import Foundation

struct EmotionRecord: Hashable, Codable {
    var id: Int
    var situation: String
    var feelings: [Feeling]
    var thoughts: String
    var result: String
    var creationDate: Date
    
    enum Feeling: String, CaseIterable, Codable, Hashable {
        case happiness = "Happiness"
        case surprising = "Surprising"
        case sadness = "Sadness"
        
        var image: String {
            switch self {
            case .happiness:
                return "😄"
            case .surprising:
                return "😲"
            case .sadness:
                return "☹️"
            }
        }
    }
    
    init(id: Int, situation: String, feelings: [Feeling], thoughts: String, result: String, creationDate: Date) {
        self.id = id
        self.situation = situation
        self.feelings = feelings
        self.thoughts = thoughts
        self.result = result
        self.creationDate = creationDate
    }
    
    init?(from local: Emotion) {
        self.id = Int(local.id)
        
        guard let situation = local.situation,
                let thoughts = local.thoughts,
                let result = local.result,
                let creation = local.createdAt
            else {
                return nil
        }
        
        self.situation = situation
        self.thoughts = thoughts
        self.result = result
        self.creationDate = creation
        
        self.feelings = [.happiness]
    }
    
    func convertToManagedObject() -> Emotion {
        let emotion: Emotion = CoreDataManager.shared.initManagedObject()
        emotion.id = Int32(self.id)
        emotion.createdAt = Date()
        // emotion.feelings
        emotion.situation = self.situation
        emotion.thoughts = self.thoughts
        emotion.result = self.result
        return emotion
    }
    
}
