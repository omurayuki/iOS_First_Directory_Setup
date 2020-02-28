import Foundation
import SwifteriOS
import RxSwift
import UIKit

protocol LoginRemoteProtocol {
    
    func oAuthLogin(presentingForm: UIViewController?) -> Single<TWUserEntity>
}

final class LoginRemote: LoginRemoteProtocol {
    
    func oAuthLogin(presentingForm: UIViewController?) -> Single<TWUserEntity> {
        return Single.create { observer -> Disposable in
            let swifter = Swifter(consumerKey: SwifterGeneral.TWITTER_CONSUMER_KEY.description,
                                  consumerSecret: SwifterGeneral.TWITTER_CONSUMER_SECRET.description)
            swifter.authorize(withCallback: URL(string: SwifterGeneral.CALLBACK_URL.description)!,
                              presentingFrom: presentingForm, success: { accessToken, response in
                guard let accessToken = accessToken else { return }
                let entity = TWUserEntity(key: accessToken.key, secret: accessToken.secret,
                                          verifier: accessToken.verifier, screenName: accessToken.screenName,
                                          userId: accessToken.userID)
                observer(.success(entity))
            }) { error in
                if DeviceInfo().isOffline {
                    observer(.error(SwifterError(errorKind: .offline)))
                }
                observer(.error(SwifterError(errorKind: .badOAuthResponse)))
            }
            return Disposables.create()
        }
    }
}
