//
//  SceneDelegate.swift
//  LifeCycle
//
//  Created by 조주은 on 2022/06/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // ToDo: 1. UIVisualEffectView 생성
    var blurView: UIVisualEffectView?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // ToDo: 3. 앱이 다시 활성화 상태가 되면 blurView를 superView(window)에서 제거한다
        if let blurView = blurView {
            blurView.removeFromSuperview()
        }
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // ToDo: 2. will resign active 상태가 호출되면 blurView를 window 크기로 잡아주고 window에 추가한다
        guard let window = window else {
            return
        }
        let effect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: effect)
        blurView?.frame = window.frame

        window.addSubview(blurView!)
        
        showAlert(message: "이어서 입력하시겠습니까?")
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

    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            alert.dismiss(animated: true)
        }
        
        alert.addAction(okAction)
        window?.rootViewController?.present(alert, animated: true)
    }
}

