import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        // 4d6387, rgba(77, 99, 135, 1)
        // a76539, rgba(167, 101, 57, 1)
        
        let primaryColor = UIColor.init(red: CGFloat(77.0/255), green: CGFloat(99.0/255), blue: CGFloat(135.0/255), alpha: CGFloat(1.0))
        
        let homeViewController = HomeViewController()
        let webViewController = WebViewController()
        let mineViewController = MineViewController()
        
        let tabBarController = UITabBarController()
        
        let homeTabBarItem = UITabBarItem.init(title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home-active")?.withRenderingMode(.alwaysOriginal))
        homeViewController.tabBarItem = homeTabBarItem
        
        let webTabBarItem = UITabBarItem.init(title: "网页", image: UIImage(named: "browse"), selectedImage: UIImage(named: "browse-active")?.withRenderingMode(.alwaysOriginal))
        webViewController.tabBarItem = webTabBarItem
        
        let mineTabBarItem = UITabBarItem.init(title: "我的", image: UIImage(named: "user"), selectedImage: UIImage(named: "user-active")?.withRenderingMode(.alwaysOriginal))
        mineViewController.tabBarItem = mineTabBarItem
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: primaryColor], for: .selected)
        
        tabBarController.viewControllers = [homeViewController, webViewController, mineViewController]
        
        let navigationController = UINavigationController.init(rootViewController: tabBarController)
        
        tabBarController.title = "Marmoset"

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

