//
//  ApiManager.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation



class ApiManager {
    
    // MARK: property
    static let shared: ApiManager = ApiManager()
    var session: URLSession
    
    // MARK: init
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: request
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        let dataURL = URL(string: url)!
        let request = URLRequest(url: dataURL)
        print("[dataRequest] request:", request)
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(.failure(ApiError.networkError(error!)))
                return
            }
            
            guard let data = data else {
                completion(.failure(ApiError.dataNotFound))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(.success(decodedObject))
            } catch let error {
                completion(.failure(ApiError.jsonParsingError(error)))
            }
        })
        
        task.resume()
    }
}
