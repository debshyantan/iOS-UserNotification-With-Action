import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asked for the permission First
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
        UNUserNotificationCenter.current().delegate = self
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        let answer1 = UNNotificationAction(identifier: "answer1", title: "365", options: UNNotificationActionOptions.foreground)
        let answer2 = UNNotificationAction(identifier: "answer2", title: "390", options: UNNotificationActionOptions.foreground)

        let category = UNNotificationCategory(identifier:  "myCategory", actions:  [answer1, answer2], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])

        let content = UNMutableNotificationContent()
        content.title  = "How Many Days are in a week?"
        content.subtitle = "Do you Know?"
        content.categoryIdentifier = "myCategory"
//        content.body = " THis is body"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "sendNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //If you don't want to show notification when app is open, do something here else and make a return here.
        //Even you you don't implement this delegate method, you will not see the notification on the specified controller. So, you have to implement this delegate and make sure the below line execute. i.e. completionHandler.
        
        completionHandler([.alert, .badge, .sound])
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "answer1" {
            self.view.backgroundColor = UIColor.green
            print("CORRECT")
        } else {
            self.view.backgroundColor = UIColor.red

            print("WRONG")

        }
        completionHandler()
    }
}

