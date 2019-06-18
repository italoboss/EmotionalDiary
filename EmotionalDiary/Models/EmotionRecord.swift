//
//  EmotionRecord.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 12/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

struct EmotionRecord: Hashable, Codable {
    
    var id: Int
    var situation: String
    var feelings: [Feeling]
    var thoughts: String
    var result: String
    
    enum Feeling: String, CaseIterable, Codable, Hashable {
        case happiness = "Happiness"
        case surprising = "Surprising"
        case sadness = "Sadness"
    }
    
}
