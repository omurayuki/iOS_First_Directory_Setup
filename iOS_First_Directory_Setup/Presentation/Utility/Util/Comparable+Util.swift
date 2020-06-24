public extension Comparable {

    func clamped(to r: ClosedRange<Self>) -> Self {
        let min = r.lowerBound, max = r.upperBound
        if self < min {
            return min
        }
        if self > max {
            return max
        }
        return self
    }
}
