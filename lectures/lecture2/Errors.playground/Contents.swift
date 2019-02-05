import Foundation

enum NetworkingError: Error {
    case connectionIssue
    case badStatusCode(Int)
}

func makeRequest() throws {
    guard Int.random(in: 1...10) > 5 else {
        throw NetworkingError.badStatusCode(404)
    }
}

do {
    try makeRequest()
} catch NetworkingError.badStatusCode(let code) {
    // handling somehow
} catch {
    print("Unexpected error: \(error).")
}


struct User {
    
}

func makeAsyncRequest(withCompletion completion: @escaping (User?, Error?) ->() ) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        
        guard Int.random(in: 1...10) > 5 else {
            completion(nil, NetworkingError.badStatusCode(404))
            return
        }
        
        completion(User(), nil)
    }
}

enum Result<Value> {
    case success(Value)
    case error(Error)
}


func makeAsyncRequestWithResult(completion: @escaping (Result<User>) ->() ) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        
        guard Int.random(in: 1...10) > 5 else {
            completion(Result<User>.error(NetworkingError.badStatusCode(404)))
            return
        }
        
        completion(Result<User>.success(User()))
    }
}

makeAsyncRequestWithResult { (result) in
    switch result {
    case .success(let user):
        print(user)
    case .error(let error):
        print(error)
    }
}


extension Result {
    func getResult() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .error(let error):
            throw error
        }
    }
}


makeAsyncRequestWithResult { (result) in
    do {
        try result.getResult()
    } catch {
        print("handing \(error)")
    }
}


