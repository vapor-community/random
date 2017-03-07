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
            #if os(Linux)
            let random = libc.random() % Int(Byte.max)
            #else
            let random = arc4random() % UInt32(Byte.max)
            #endif

            bytes += Byte(random)
        }

        return bytes
    }
}
