//
//  MoyaProvider+Promise.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/25/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import Moya
import PromiseKit

extension MoyaProvider {
    func request(_ target: Target) -> Promise<Response> {
        return Promise<Moya.Response> { seal in
            self.request(target, callbackQueue: .main, progress: nil, completion: { result in
                switch result {
                case let .success(response):
                    do {
                        _ = try response.filterSuccessfulStatusCodes()
                        seal.fulfill(response)
                    } catch {
                        seal.reject(error)
                    }
                case let .failure(error):
                    seal.reject(error)
                }
            })
        }
    }
}

extension Promise where T: Moya.Response {
    func decode<D: Decodable>(on queue: DispatchQueue = .global(qos: .utility), to type: D.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder()) -> Promise<D> {
        return map (on: queue, { (response) in
            try response.map(D.self, atKeyPath: keyPath, using: decoder)
        })
    }
}
