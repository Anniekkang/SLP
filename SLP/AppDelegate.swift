//
//  AppDelegate.swift
//  SLP
//
//  Created by 나리강 on 2022/11/07.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseMessaging




@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {
       
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      
        FirebaseApp.configure()
        UIView.appearance().tintColor = colorCustom.shared.greenBrandColor
        
        
        //원격알림시스템에 앱을 등록
         if #available(iOS 10.0, *) {
           // For iOS 10 display notification (sent via APNS)
           UNUserNotificationCenter.current().delegate = self

           let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
           UNUserNotificationCenter.current().requestAuthorization(
             options: authOptions,
             completionHandler: { _, _ in }
           )
         } else {
           let settings: UIUserNotificationSettings =
             UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
           application.registerUserNotificationSettings(settings)
         }

         application.registerForRemoteNotifications()
        
        //메세지대리자 설정
        Messaging.messaging().delegate = self
        
        //등록 토큰 가져오기 -> 회원탈퇴했을 때
        Messaging.messaging().token { token, error in
          if let error = error {
            print("Error fetching FCM registration token: \(error)")
          } else if let token = token {
            print("FCM registration token: \(token)")
            
          }
        }
        
      
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}
extension AppDelegate {
    //토큰이 업데이트 될 때마다 알림
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")

      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
    
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    
    
    //포그라운드 알림 수신, 화면마다 푸시마다 설정할 수도 있음(카카오톡처럼)
       func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           completionHandler([.sound, .list, .banner])
       }

       
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse) async {
        print("사용자가 푸시를 클릭함")
        print(response.notification.request.content.body) // 바디는 알림메세지의 내용
        print(response.notification.request.content.userInfo)// 파이어베이스에서 등록했던 키 밸류
        
        let userInfo = response.notification.request.content.userInfo
        
        // ...
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print full message.
        print(userInfo)
    }
    
 
   
    
}


    
    
    



