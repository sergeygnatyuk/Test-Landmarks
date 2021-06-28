//
//  SceneDelegate.swift
//  LandmarksTest
//
//  Created by Гнатюк Сергей on 24.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController(rootViewController: LandmarksViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let userRouter = LandmarksRouter.start()
//        let initialViewController = userRouter.entry
//        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = initialViewController
//        self.window = window
//        window.makeKeyAndVisible()
//    }
}

