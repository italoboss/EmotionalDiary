//
//  EmotionRecord.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 12/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct EmotionRecord: Hashable, Codable, Identifiable {
    var id: Int
    var situation: String
    var feeling: Feeling
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
    
    static func convert(from local: Emotion) -> EmotionRecord? {
        let id = Int(local.id)
        
        guard let situation = local.situation,
                let feelingText = local.feeling,
                let feeling = Feeling(rawValue: feelingText),
                let thoughts = local.thoughts,
                let result = local.result,
                let creation = local.createdAt
            else {
                return nil
        }
        
        return EmotionRecord(id: id, situation: situation, feeling: feeling, thoughts: thoughts, result: result, creationDate: creation)
    }
    
    func convertToManagedObject() -> Emotion {
        let emotion: Emotion = CoreDataManager.shared.initManagedObject()
        emotion.id = Int32(self.id)
        emotion.createdAt = Date()
        emotion.feeling = self.feeling.rawValue
        emotion.situation = self.situation
        emotion.thoughts = self.thoughts
        emotion.result = self.result
        return emotion
    }
    
}
