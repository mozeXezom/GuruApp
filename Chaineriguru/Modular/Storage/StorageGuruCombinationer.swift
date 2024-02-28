//
//  StorageGuruCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 21.02.2024.
//

import UIKit
import CoreData

class StorageGuruCombinationer {
    static let sharedStorage = StorageGuruCombinationer()

    lazy var combinationerStorageContainer: NSPersistentContainer = {
        let storageFetchContainer = NSPersistentContainer(name: "Chaineriguru")
        
        storageFetchContainer.loadPersistentStores { (_, containerFailure) in
            if let storageFailure = containerFailure as NSError? {
                print("Storage container was not loaded.")
                
                fatalError("Unknown failure: \(storageFailure)")
            }
        }
        
        return storageFetchContainer
    }()
    
    func pregenerateUniqueGoalProjectFromInputData(_ uniqueGoalName: String, _ uniqueGoalOne: String, _ uniqueGoalTwo: String, _ uniqueGoalThree: String, _ uniqueGoalFour: String, _ goalSumOne: String, _ goalSumTwo: String, _ goalSumThree: String, _ goalSumFour: String, _ uniqueTotalBudget: String) -> UniqueGoalProject {
        let generatedUniqueGoalProject = UniqueGoalProject(context: combinationerStorageContainer.viewContext)
        
        generatedUniqueGoalProject.uniqueName = uniqueGoalName
        generatedUniqueGoalProject.uniqueGoalOne = uniqueGoalOne
        generatedUniqueGoalProject.uniqueGoalTwo = uniqueGoalTwo
        generatedUniqueGoalProject.uniqueGoalThree = uniqueGoalThree
        generatedUniqueGoalProject.uniqueGoalFour = uniqueGoalFour
        generatedUniqueGoalProject.goalSumOne = goalSumOne
        generatedUniqueGoalProject.goalSumTwo = goalSumTwo
        generatedUniqueGoalProject.goalSumThree = goalSumThree
        generatedUniqueGoalProject.goalSumFour = goalSumFour
        generatedUniqueGoalProject.totalUniqueBudget = uniqueTotalBudget
        print("Unique goal project was generated successfully!")
        return generatedUniqueGoalProject
    }
    
    func preloadGeneratedUniqueGoalProjectsFromStorage() -> [UniqueGoalProject] {
        let storageGuruFetchRequest: NSFetchRequest<UniqueGoalProject> = UniqueGoalProject.fetchRequest()
        
        do {
            print("Unique goal projects was fetched successfully!")
            return try combinationerStorageContainer.viewContext.fetch(storageGuruFetchRequest)
        } catch {
            print("Something went wrong, fetching unique goal project from storage \(error)")
            return []
        }
    }
    
    func predeleteUniqueGoalProjectFromStorage(uniqueGoalProject: UniqueGoalProject) {
        let combinationerObjectContext = uniqueGoalProject.managedObjectContext
        
        combinationerObjectContext?.delete(uniqueGoalProject)
        do {
            try combinationerObjectContext?.save()
            print("Unique project was deleted correctly!")
        } catch {
            print("Unique project was not deleted from storage!")
        }
    }
}

extension StorageGuruCombinationer {
    func presetStorageGuruCombinationerContextSaving() {
        let combinationerViewContext = combinationerStorageContainer.viewContext
        
        if combinationerViewContext.hasChanges {
            do {
                try combinationerViewContext.save()
                print("combinationerViewContext changes saved!")
            } catch {
                let failureStorageError = error as NSError
                fatalError("\(failureStorageError)")
            }
        } else {
            print("No combinationerViewContext changes to save.")
        }
    }
}
