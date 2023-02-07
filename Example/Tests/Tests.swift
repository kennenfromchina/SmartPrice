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
        let url = "http://localhost:8080/test.php?links[]=http://www.baidu.com&links[]=http://www.google.cn&url=zhilun://rentManager?id=3&name=John"
        XCTAssertEqual(url.urlWithoutQuery(), "http://localhost:8080/test.php")
        guard let links = url.queryDictionary()?["links"] else {
            return
        }
        let equal = links as! [String] == ["http://www.baidu.com", "http://www.google.cn"]
        XCTAssertEqual(equal, true)
        XCTAssertEqual(url.queryDictionary()?["name"] as! String, "John")
        XCTAssertEqual(url.queryDictionary()?["url"] as! String, "zhilun://rentManager?id=3")
        guard let url = url.queryDictionary()?["url"] else {
            return
        }
        let s = url as! String
        XCTAssertEqual(s.urlWithoutQuery() as! String, "zhilun://rentManager")
        XCTAssertEqual(s.queryDictionary()?["id"] as! String, "3")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
}
