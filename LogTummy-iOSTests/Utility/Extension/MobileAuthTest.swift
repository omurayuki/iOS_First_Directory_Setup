import XCTest
import RxTest
@testable import LogTummy_iOS

class MobileAuthTest: XCTestCase {
    
    var mobileAuth: MobileAuth?
    
    override func setUp() {
        super.setUp()
        mobileAuth = MobileAuth()
    }
    
    override func tearDown() {
        super.tearDown()
        mobileAuth?.removeUserKey()
        mobileAuth = nil
    }
    
    func testWhetherUserKeyCanBeAcquired() {
        let userKey = "12345"
        mobileAuth?.setUserKey(key: userKey)
        var acquiredUserKey = mobileAuth?.getUserKey() ?? ""
        XCTAssert(acquiredUserKey == userKey)
        
        let exp = expectation(description: "userKey removed.")
        mobileAuth?.removeUserKey()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            acquiredUserKey = self?.mobileAuth?.getUserKey() ?? ""
            XCTAssert(acquiredUserKey.isEmpty)
            exp.fulfill()
        }
        waitForExpectations(timeout: 2.5, handler: nil)
    }
}
