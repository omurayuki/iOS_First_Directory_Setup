import Foundation
import RxSwift
import RxRelay

final class RxUtil {
    
    static func filterNil<T>(input: T?) -> Observable<T> {
        guard let input = input else {
            return Observable<T>.never()
        }
        return Observable<T>.just(input)
    }
    
    static func filterNil<T, U>(input: [U: T]?, key: U) -> Observable<T> {
        guard let input = input?[key] else {
            return Observable<T>.never()
        }
        return Observable<T>.just(input)
    }
}
