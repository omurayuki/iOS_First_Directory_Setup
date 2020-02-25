import Foundation

struct MemoryCache<T> {

    /// The actual data which want to be cached
    private let data: T
    /// The number of seconds which how long the local file will be valid
    private let age: Double
    /// Timestamp when data fetched from backend and written back to the local file
    private let updatedAt: Double
    
    init(data: T, age: Double, updatedAt: Double? = nil) {
        self.data = data
        self.age = age
        self.updatedAt = updatedAt ?? Date().timeIntervalSince1970
    }

    var value: T? {
        if isExpired() {
            return nil
        }
        return data
    }

    private func isExpired() -> Bool {
        return updatedAt + age < getCurrentTime()
    }
    
    private func getCurrentTime() -> Double {
        return Date().timeIntervalSince1970
    }
}

extension MemoryCache: Codable where T: Codable {
    
}
