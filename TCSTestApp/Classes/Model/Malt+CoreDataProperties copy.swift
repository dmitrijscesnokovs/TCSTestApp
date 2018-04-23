//
//  Malt+CoreDataProperties.swift
//  
//
//  Created by Dmitrijs Cesnokovs on 23/04/2018.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import Foundation
import CoreData


extension Malt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Malt> {
        return NSFetchRequest<Malt>(entityName: "Malt")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Amount?
    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension Malt {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredient)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredient)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}
