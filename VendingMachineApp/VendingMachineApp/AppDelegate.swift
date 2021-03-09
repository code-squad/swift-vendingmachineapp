import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var machine: VendingMachine!
    var dataManager = VendingMachineData()
    var encodedData: Data!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let decodedData = dataManager.loadData() else {
            machine = VendingMachine()
            return true
        }
        machine = decodedData
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }


}

