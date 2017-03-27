import XCTest
import Core
@testable import Random

class RandomTests: XCTestCase {
    static var allTests = [
        ("testURandom", testURandom),
        ("testOSRandom", testOSRandom),
        ("testURandomCount", testURandomCount),
        ("testForTrailingZeros", testForTrailingZeros)
    ]

    func testURandom() throws {
        let rand = try URandom.makeInt8()
        print(rand)
    }

    func testOSRandom() throws {
        let rand = try OSRandom.makeInt64()
        print(rand)
        let bytes = try OSRandom.bytes(count: 32)
        print(bytes.makeString())
    }

    func testURandomCount() throws {
        let rand = try URandom.bytes(count: 65_536)
        XCTAssertEqual(rand.count, 65_536)
    }

    func testForTrailingZeros() throws {
        let rand = try URandom.bytes(count: 65_536)
        let tail = Bytes(rand.suffix(8))
        let zeros = Bytes(repeating: 0, count: 8)
        XCTAssertNotEqual(tail, zeros)
    }
}
