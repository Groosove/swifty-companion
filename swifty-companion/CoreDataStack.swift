//
//  CoreDataStack.swift
//  swifty-companion
//
//  Created by Fenix Lavon on 8/9/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    private var modelName: String
	private let container: NSPersistentContainer
	var viewContext: NSManagedObjectContext { container.viewContext }
	lazy var backgroundContext: NSManagedObjectContext = container.newBackgroundContext()
	var coordinator: NSPersistentStoreCoordinator { container.persistentStoreCoordinator }

	init(modelName: String) {
        self.modelName = modelName
		let container = NSPersistentContainer(name: "SearchPhoto")
		self.container = container
	}

	func load() {
		container.loadPersistentStores { _, error in
			if let error = error {
				assertionFailure(error.localizedDescription)
			}
		}
	}

    func saveContext (context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
