//
//  App209App.swift
//  App209
//
//  Created by Вячеслав on 10/2/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_SjjVrhB98Qj4RmAgbpPWhSsYfTFHTv")
        Amplitude.instance().initializeApiKey("271823596a60d28ac7db0b2077bcf9ab")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App209App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
