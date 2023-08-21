//
//  SceneDelegate.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 13.08.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController: UITabBarController = {
            let controller = UITabBarController()
            controller.tabBar.backgroundColor = .white
            controller.tabBar.layer.cornerRadius = 16
            // bashga cur nece yazmag olar bilmirem
            let normalFont = Fonts.style(type: .regular, size: 12) ?? UIFont.systemFont(ofSize: 12)
            UITabBarItem.appearance().setTitleTextAttributes([.font: normalFont], for: .normal)
            
            controller.tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            controller.tabBar.layer.shadowOpacity = 1
            controller.tabBar.layer.shadowOffset = CGSize(width: 0, height: 4)
            controller.tabBar.layer.shadowRadius = 10
            return controller
        }()
        
        // MARK: - View Controllers
        let mainViewController: DashboardViewController = {
            let screen = DashboardViewController()
            screen.title = "Accounts"
            //screen.title.font = Fonts.style(type: .regular, size: 12)
            screen.tabBarItem.image = Icons.getIcon(type: .wallet)
            return screen
        }()
            
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        
        let secondViewController: UIViewController = {
            let screen = UIViewController()
            screen.tabBarItem.image = Icons.getIcon(type: .dataPie)
            screen.view.backgroundColor = .green
            screen.title = "Statistics"
            return screen
        }()
        
        let thirdViewController: UIViewController = {
            let screen = UIViewController()
            screen.tabBarItem.image = Icons.getIcon(type: .gift)
            screen.title = "Cashback"
            return screen
        }()
        
        let fourthViewController: UIViewController = {
            let screen = UIViewController()
            screen.tabBarItem.image = Icons.getIcon(type: .settings)
            screen.title = "Settings"
            return screen
        }()
        
        // Установка ваших view controllers для вкладок
        tabBarController.viewControllers = [navigationController, secondViewController, thirdViewController, fourthViewController]
        
        // Установка окна сцены
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        window.backgroundColor = Colors.getColor(type: .backgroundColorView)
        
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

