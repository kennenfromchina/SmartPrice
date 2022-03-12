import XCTest
import SmartPrice

class Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        var price: Double = 3
        XCTAssertEqual(price.toPrice(), "3")
        price = 3.3333333
        XCTAssertEqual(price.toPrice(), "3.33")
        price = 3.335555
        XCTAssertEqual(price.toPrice(), "3.34")
        price = 3.3333333
        XCTAssertEqual(price.toPrice(decimalLength: 3), "3.333")
        price = 3.3333333
        XCTAssertEqual(price.toPrice(decimalLength: 4, smartFlag: false), "3.3333")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }

}
