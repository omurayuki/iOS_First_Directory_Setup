import XCTest
import RxSwift
@testable import LogTummy_iOS

class LoginViewModelTest: XCTestCase {
    
    var viewModelMock: LoginViewModelProtocol?
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        viewModelMock = LoginViewModel(usecase: LoginUsecaseMock())
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModelMock = nil
        disposeBag = nil
    }
    
    func testWetherTWUserBusinessModelCanBeAcquire() {
        viewModelMock?.getTWUserBusinessModel()
            .subscribe(onNext: { businessModel in
                XCTAssert(businessModel?.verifier == "verifier")
                XCTAssert(businessModel?.screenName == "screenName")
                XCTAssert(businessModel?.userId == "12345")
            }).disposed(by: disposeBag)
    }
}
