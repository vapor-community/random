extension Array {
    public var random: Element {
        let bytes = OSRandom().bytes(count: 8)
        let random = UnsafeRawPointer(bytes)
            .assumingMemoryBound(to: UInt.self)
            .pointee
        let index = random % UInt(count)
        return self[Int(index)]
    }
}
