import XCTest
import RxSwift
@testable import LogTummy_iOS

class LoginUsecaseTest: XCTestCase {
    
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        super.tearDown()
        disposeBag = nil
    }
}
