//
//  Amount+CoreDataProperties.swift
//  
//
//  Created by Dmitrijs Cesnokovs on 23/04/2018.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import Foundation
import CoreData


extension Amount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Amount> {
        return NSFetchRequest<Amount>(entityName: "Amount")
    }

    @NSManaged public var value: Double
    @NSManaged public var unit: String?
    @NSManaged public var malts: NSSet?

}

// MARK: Generated accessors for malts
extension Amount {

    @objc(addMaltsObject:)
    @NSManaged public func addToMalts(_ value: Malt)

    @objc(removeMaltsObject:)
    @NSManaged public func removeFromMalts(_ value: Malt)

    @objc(addMalts:)
    @NSManaged public func addToMalts(_ values: NSSet)

    @objc(removeMalts:)
    @NSManaged public func removeFromMalts(_ values: NSSet)

}
