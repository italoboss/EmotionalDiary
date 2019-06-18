//
//  EmotionDAO.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 18/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import Foundation

class MovieDao {
    
    static let shared = MovieDao()
    
    func save(_ movie: EmotionRecord) -> Bool {
        _ = movie.convertToManagedObject()
        return CoreDataManager.shared.saveContext()
    }
    
    func delete(_ movie: EmotionRecord) -> Bool {
        guard let emotion: Emotion = CoreDataManager.shared.fetchObject(by: movie.id) else { return false }
        return CoreDataManager.shared.delete(emotion)
    }
    
    func get(by id: Int) -> EmotionRecord? {
        guard let local: Emotion = CoreDataManager.shared.fetchObject(by: id) else { return nil }
        let emotion = EmotionRecord(from: local)
        return emotion
    }
    
    func getAll(in alphabeticOrder: Bool = true) -> [EmotionRecord]? {
        var sorters: [NSSortDescriptor]? = nil
        if alphabeticOrder {
            sorters = [ NSSortDescriptor(key: "title", ascending: true) ]
        }
        guard let locals: [Emotion] = CoreDataManager.shared.fecth(sorting: sorters) else { return nil }
        let movies = locals.compactMap { (local) -> EmotionRecord? in EmotionRecord(from: local) }
        return movies
    }
    
}

