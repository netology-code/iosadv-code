//
//  ViewController.swift
//  local notification demo
//
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func registerNotification(_ sender: UIButton) {
        let center: Void = UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("Доступ к уведомлениям получен")
                }
                else {
                    print("Доступ не получен")
                }
            }
    }
    
    @IBAction func scheduleNotification(_ sender: Any) {
        print("Уведомление запланировано")
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        
        let content = UNMutableNotificationContent()
        
        
        content.title = "Сделать домашнее задание"
        content.body = "Нужно настроить уведомления для приложения ВК"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["CustomData": "qwerty"]
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 19
        dateComponents.minute = 30
//        (1) вариант с планированием уведомления по времени
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        (2) вариант с уведомлением через 5 секунд. После нажатия "запланировать уведомление" нажать command + L, через 5 секунд уведомление появится на экране симулятора
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
        
    }
    

}

