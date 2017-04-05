extension Array {
    public var random: Element? {
        guard count > 0 else {
            return nil
        }
        
        let bytes = OSRandom().bytes(count: 8)
        let random = UnsafeRawPointer(bytes)
            .assumingMemoryBound(to: UInt.self)
            .pointee
        let index = random % UInt(count)
        return self[Int(index)]
    }
}
