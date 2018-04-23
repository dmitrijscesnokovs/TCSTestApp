//
//  CoreDataService.swift
//  TCSTestApp
//
//  Created by Dmitrijs Cesnokovs on 4/22/18.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import UIKit
import Sync

class CoreDataService {
    let dataStack: DataStack
    
    static let shared = CoreDataService()
    
    init() {
        self.dataStack = DataStack(modelName: "TCSTestApp")
    }
    
    func fetchBeers() -> [Beer] {
        let request: NSFetchRequest<Beer> = Beer.fetchRequest()
        
        return try! self.dataStack.viewContext.fetch(request)
    }
}
