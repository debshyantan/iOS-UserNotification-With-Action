import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asked for the permission First
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: {didAllow, error in
        })
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title  = "This is a tests"
        content.subtitle = "Tring this out"
        content.body = " THis is body"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "sendNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    
}

