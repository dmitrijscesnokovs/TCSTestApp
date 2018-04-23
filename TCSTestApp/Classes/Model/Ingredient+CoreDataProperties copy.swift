//
//  Ingredient+CoreDataProperties.swift
//  
//
//  Created by Dmitrijs Cesnokovs on 23/04/2018.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: String?
    @NSManaged public var malt: NSSet?
    @NSManaged public var beer: Beer?

}

// MARK: Generated accessors for malt
extension Ingredient {

    @objc(addMaltObject:)
    @NSManaged public func addToMalt(_ value: Malt)

    @objc(removeMaltObject:)
    @NSManaged public func removeFromMalt(_ value: Malt)

    @objc(addMalt:)
    @NSManaged public func addToMalt(_ values: NSSet)

    @objc(removeMalt:)
    @NSManaged public func removeFromMalt(_ values: NSSet)

}
