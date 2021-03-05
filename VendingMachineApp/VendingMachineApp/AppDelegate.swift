import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var machine: VendingMachine!
    var encodedData: Data!
    let userDefaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        encodedData = try? PropertyListEncoder().encode(machine)
        userDefaults.set(encodedData, forKey: "data")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        let data = userDefaults.data(forKey: "data")!
        machine = try? PropertyListDecoder().decode(VendingMachine.self, from: data)
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

