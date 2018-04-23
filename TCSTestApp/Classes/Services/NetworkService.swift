//
//  NetworkService.swift
//  TCSTestApp
//
//  Created by Dmitrijs Cesnokovs on 4/22/18.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import CoreData
import Sync
import Alamofire

class NetworkService{
    
    static let shared = NetworkService()
    
    public enum Result {
        case success
        case failure(MessageError)
    }

    public struct MessageError: Swift.Error, Equatable {
        public let message: String

        public init(message: String) {
            self.message = message
        }

        public static func ==(lhs: MessageError, rhs: MessageError) -> Bool {
            return lhs.message == rhs.message
        }
    }

    public typealias VoidResult = Result
    
    func getBeers(completion: @escaping (_ result: Result) -> ()) {
        Alamofire.request(NetworkConstants.beerURL).responseJSON { response in
            if let jsonObject = response.result.value, let beersJSON = jsonObject as? [[String: Any]] {
                CoreDataService.shared.dataStack.sync(beersJSON, inEntityNamed: Beer.entity().name!) { error in
                    completion(.success)
                }
            } else if let error = response.error {
                completion(.failure((error as NSError) as! NetworkService.MessageError))
            } else {
                fatalError("No error, no failure")
            }
        }
    }
}
