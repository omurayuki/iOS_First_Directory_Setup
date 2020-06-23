import Foundation

protocol EntranceDataManagerProtocol { }

final class EntranceDataManager: EntranceDataManagerProtocol {
    
    private let remote: EntranceRemote = EntranceRemote()
    private let local: EntranceLocal = EntranceLocal()
}
