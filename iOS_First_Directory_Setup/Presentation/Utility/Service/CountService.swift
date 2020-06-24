import Foundation

struct CountService {
    
    static func countMultipleItem<T: Comparable>(_ value: [T]) -> [(Any, Int)] {
        let multipleItemCodeCount = NSCountedSet(array: value)
        
        let valueToCount = NSOrderedSet(array: value)
        
        let counts = valueToCount.array.map { ($0, multipleItemCodeCount.count(for: $0)) }
        
        return counts.compactMap { $0 }
    }
}
