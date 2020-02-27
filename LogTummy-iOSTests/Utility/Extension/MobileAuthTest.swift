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
        let acquiredUserKey = mobileAuth?.getUserKey() ?? ""
        XCTAssert(acquiredUserKey == userKey)
    }
}
