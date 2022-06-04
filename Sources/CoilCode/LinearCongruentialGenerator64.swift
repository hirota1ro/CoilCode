import Foundation

struct LinearCongruentialGenerator64 {
    var x: UInt64
}

extension LinearCongruentialGenerator64 {
    init(seed: UInt64) { self.x = seed }
}

extension LinearCongruentialGenerator64: RandomNumberGenerator {

    mutating func next() -> UInt64 {
        x = 0x5D588B656C078965 &* x &+ 0x269EC3
        return x
    }
}
