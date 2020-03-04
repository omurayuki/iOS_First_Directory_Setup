import Foundation
import RxSwift
import RxRelay

protocol TweetLogDataManagerProtocol {
}

final class TweetLogDataManager: TweetLogDataManagerProtocol {
    
    private let remote: TweetLogRemoteProtocol = TweetLogRemote()
    private let local: TweetLogLocalProtocol = TweetLogLocal()
    
}
