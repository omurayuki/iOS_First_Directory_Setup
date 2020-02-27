import XCTest
@testable import LogTummy_iOS
import RxSwift
import RxRelay

class MemoryCacheTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExpirationLogic() {
        let testValue = "TestValue"
        let cache = MemoryCache(data: testValue, age: 3)
        
        XCTAssert(cache.value == testValue)
        
        let exp = expectation(description: "cache expired.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            XCTAssert(cache.value == nil)
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
