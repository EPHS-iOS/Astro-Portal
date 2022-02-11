//
//  AppDelegate.swift
//  FastShooterGame
//
//  Created by 64011731 on 2/22/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        // Stop running when the user releases the left or right arrow key.

        var didHandleEvent = false
        for press in presses {
            
            guard let key = press.key else { continue }
            if(isOnEdge==false){
                if key.charactersIgnoringModifiers == UIKeyCommand.inputRightArrow {
                    rtouch = true
                    didHandleEvent = true
                }
            }
            if(isOnEdge==true){
                if key.charactersIgnoringModifiers == UIKeyCommand.inputRightArrow {
                    rtouch=true
                 rtouch2=true
                    didHandleEvent = true
                }
            }
            if(isOnEdgeLeft==false){
                if key.charactersIgnoringModifiers == UIKeyCommand.inputLeftArrow {
                    ltouch=true
                    didHandleEvent = true
                }
            }
            if(isOnEdgeLeft==true){
                if key.charactersIgnoringModifiers == UIKeyCommand.inputLeftArrow {
                    ltouch=true
                    ltouch2=true
                    didHandleEvent = true
                }
            }

            if(isOnEdge==false&&isOnEdgeLeft==false){
                if key.charactersIgnoringModifiers == UIKeyCommand.inputUpArrow && istouching==true{

                    utouch=true
                        istouching=false
                    didHandleEvent = true
                }
            }
            if(isOnEdge==true||isOnEdgeLeft==true){
                if key.charactersIgnoringModifiers == UIKeyCommand.inputUpArrow {

                    utouch2=true
                        utouch = false
                        istouching=false
                    didHandleEvent = true
                }
            }
    
        }
        
        if didHandleEvent == false {
            // Didn't handle this key press, so pass the event to the next responder.
            super.pressesBegan(presses, with: event)
        }
    }
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        // Stop running when the user releases the left or right arrow key.

        var didHandleEvent = false
        for press in presses {
            
            guard let key = press.key else { continue }
            if key.charactersIgnoringModifiers == UIKeyCommand.inputRightArrow {
                rtouch=false
                didHandleEvent = true
            }

            if key.charactersIgnoringModifiers == UIKeyCommand.inputLeftArrow {
                ltouch=false
                didHandleEvent = true
            }
            if key.charactersIgnoringModifiers == UIKeyCommand.inputLeftArrow {
                ltouch2=false
                didHandleEvent = true
            }
            if key.charactersIgnoringModifiers == UIKeyCommand.inputUpArrow {
                utouch=false
                didHandleEvent = true
            }

            if key.charactersIgnoringModifiers == UIKeyCommand.inputUpArrow {
                utouch2=false
                didHandleEvent = true
            }


            if key.charactersIgnoringModifiers == UIKeyCommand.inputRightArrow {
                rtouch2=false
                didHandleEvent = true
            }
        }
        
        
        if didHandleEvent == false {
            // Didn't handle this key press, so pass the event to the next responder.
            super.pressesBegan(presses, with: event)
        }
    }


}

