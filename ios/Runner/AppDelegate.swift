import UIKit
import Flutter
import Firebase
import FBSDKCoreKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    // Initialize Facebook SDK
    FBSDKCoreKit.ApplicationDelegate.shared.application(
       application,
       didFinishLaunchingWithOptions: launchOptions
    )
    return true
    // return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
