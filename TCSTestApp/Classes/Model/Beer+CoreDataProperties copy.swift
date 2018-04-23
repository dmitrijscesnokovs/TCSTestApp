//
//  Beer+CoreDataProperties.swift
//  
//
//  Created by Dmitrijs Cesnokovs on 23/04/2018.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import Foundation
import CoreData


extension Beer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beer> {
        return NSFetchRequest<Beer>(entityName: "Beer")
    }

    @NSManaged public var brewersTips: String?
    @NSManaged public var contributedBy: String?
    @NSManaged public var descriptionField: String?
    @NSManaged public var firstBrewed: String?
    @NSManaged public var id: Int64
    @NSManaged public var image_url: String?
    @NSManaged public var name: String?
    @NSManaged public var tagline: String?
    @NSManaged public var ingredients: Ingredient?

}
