//
//  CoreDataManager.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 18/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import CoreData

class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    
    private override init() { }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentCloudKitContainer(name: "EmotionalDiary")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                ErrorHandler.shared.alertErrorMessage(error)
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() -> Bool {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch {
                let nserror = error as NSError
                ErrorHandler.shared.alertErrorMessage(nserror)
                return false
            }
        }
        return true
    }
    
    func fetchObject<T: NSManagedObject>(by id: Int) -> T? {
        let predicate = NSPredicate(format: "id == \(id)")
        let result: [T]? = self.fecth(where: NSCompoundPredicate(andPredicateWithSubpredicates: [predicate]))
        return result?.first
    }
    
    func fecth<T: NSManagedObject>(where predicates: NSCompoundPredicate? = nil, sorting sorters: [NSSortDescriptor]? = nil) -> [T]? {
        let context = persistentContainer.viewContext
        let entityName = String(describing: T.self)
        let request = NSFetchRequest<T>(entityName: entityName)
        if let conditions = predicates {
            request.predicate = conditions
        }
        if let sortDescriptors = sorters {
            request.sortDescriptors = sortDescriptors
        }
        
        do {
            let records = try context.fetch(request)
            return records
        } catch {
            let nserror = error as NSError
            ErrorHandler.shared.alertErrorMessage(nserror)
            return nil
        }
    }
    
    func initManagedObject<T: NSManagedObject>() -> T {
        let managedObj = T(context: persistentContainer.viewContext)
        return managedObj
    }
    
    func delete(_ object: NSManagedObject) -> Bool {
        persistentContainer.viewContext.delete(object)
        return saveContext()
    }
    
}

