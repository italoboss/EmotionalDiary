//
//  EmotionDAO.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 18/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

class EmotionDao {
    
    static let shared = EmotionDao()
    
    func save(_ emotion: EmotionRecord) -> Bool {
        _ = emotion.convertToManagedObject()
        return CoreDataManager.shared.saveContext()
    }
    
    func delete(_ emotion: EmotionRecord) -> Bool {
        guard let emotion: Emotion = CoreDataManager.shared.fetchObject(by: emotion.id) else { return false }
        return CoreDataManager.shared.delete(emotion)
    }
    
    func get(by id: Int) -> EmotionRecord? {
        guard let local: Emotion = CoreDataManager.shared.fetchObject(by: id) else { return nil }
        let emotion = EmotionRecord.convert(from: local)
        return emotion
    }
    
    func getAll(in alphabeticOrder: Bool = false) -> [EmotionRecord] {
        var sorters: [NSSortDescriptor]? = nil
        if alphabeticOrder {
            sorters = [ NSSortDescriptor(key: "situation", ascending: true) ]
        }
        guard let locals: [Emotion] = CoreDataManager.shared.fecth(sorting: sorters) else { return [] }
        let emotions = locals.compactMap { (local) -> EmotionRecord? in EmotionRecord.convert(from: local) }
        return emotions
    }
    
}

