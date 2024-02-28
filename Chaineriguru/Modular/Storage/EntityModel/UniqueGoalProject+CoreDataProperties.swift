//
//  UniqueGoalProject+CoreDataProperties.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 21.02.2024.
//
//

import Foundation
import CoreData


extension UniqueGoalProject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UniqueGoalProject> {
        return NSFetchRequest<UniqueGoalProject>(entityName: "UniqueGoalProject")
    }

    @NSManaged public var totalUniqueBudget: String?
    @NSManaged public var uniqueGoalFour: String?
    @NSManaged public var uniqueGoalOne: String?
    @NSManaged public var uniqueGoalThree: String?
    @NSManaged public var uniqueGoalTwo: String?
    @NSManaged public var uniqueName: String?
    @NSManaged public var goalSumOne: String?
    @NSManaged public var goalSumTwo: String?
    @NSManaged public var goalSumThree: String?
    @NSManaged public var goalSumFour: String?

}

extension UniqueGoalProject : Identifiable {

}
