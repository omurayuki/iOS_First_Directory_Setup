import Foundation
//import Firebase

final class AppConfigurator {

    static var currentFirebaseFilePath: String {

        let filePath: String?
        #if DEBUG
            filePath = Bundle.main.path(forResource: "GoogleService-debug-Info", ofType: "plist")
        #else
            filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        #endif
        return filePath ?? String.blank
    }

    static func setupFirebase() {

        let optsPath = AppConfigurator.currentFirebaseFilePath
//        guard !optsPath.isEmpty, let fileopts = FirebaseOptions(contentsOfFile: optsPath) else {
//            Logger.info("Invalid Firebase configuration file.")
//            return
//        }
//        FirebaseConfiguration.shared.setLoggerLevel(.min)
//        FirebaseApp.configure(options: fileopts)
    }
}
