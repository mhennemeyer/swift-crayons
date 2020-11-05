import XCTest
@testable import swift_crayons

final class swift_crayonsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_crayons().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
