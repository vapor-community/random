import Foundation
import libc

/// Uses the operating system's Random function
/// uses `random` on Linux and `arc4random` on macOS.
public final class OSRandom: RandomProtocol, EmptyInitializable {
    /// SystemRandom
    public init() {}

    /// Get a random array of Bytes
    public func bytes(count: Int) -> Bytes {
        var bytes: Bytes = []

        for _ in 0..<count {
            let random = Int.random(min: 0, max: .maxByte)
            bytes += Byte(random)
        }

        return bytes
    }
}

extension Int {
    static let maxByte: Int = Int(Byte.max)
}

extension Int {
    #if os(Linux)
        /// Generates a random number between (and inclusive of)
        /// the given minimum and maximum.
        fileprivate static let randomInitialized: Bool = {
            /// This stylized initializer is used to work around dispatch_once
            /// not existing and still guarantee thread safety
            let current = Date().timeIntervalSinceReferenceDate
            let salt = current.truncatingRemainder(dividingBy: 1) * 100000000
            libc.srand(UInt32(current + salt))
            return true
        }()
    #endif

    public static func random(min: Int, max: Int) -> Int {
        let top = max - min + 1
        #if os(Linux)
            // will always be initialized
            guard Int.randomInitialized else { fatalError() }
            return Int(libc.random() % top) + min
        #else
            return Int(arc4random_uniform(UInt32(top))) + min
        #endif
    }
}

