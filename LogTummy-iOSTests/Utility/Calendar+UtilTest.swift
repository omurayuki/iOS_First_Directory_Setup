import XCTest
@testable import LogTummy_iOS

class CalendarUtilTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetWeekday() {
        do {
            let cal = Calendar.current
            let dateComponent = DateComponents(year: 2020, month: 2, day: 27)
            let date = cal.date(from: dateComponent)
            let weekday = CalendarUtil.getWeekDay(date: date!)!
            XCTAssertEqual(weekday, .thu)
        }
        
        do {
            let cal = Calendar.current
            let dateComponent = DateComponents(year: 2020, month: 2, day: 29)
            let date = cal.date(from: dateComponent)
            let weekday = CalendarUtil.getWeekDay(date: date!)!
            XCTAssertEqual(weekday, .sat)
        }
    }
}
