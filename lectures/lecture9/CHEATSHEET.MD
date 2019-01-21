1. Expectations extension
import XCTest

extension XCTestCase {
    func futureTest(timeout seconds: TimeInterval = 0.001, _ execute: @escaping () -> Void) {
        let exp = expectation(description: "Expectation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: {
            execute()
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: seconds + 0.1)
    }
}