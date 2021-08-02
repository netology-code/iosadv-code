//
//  ContentView.swift
//  local_swiftUI demo
//
//  Created by Никита Павлов on 18.07.2021.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Запросить разрешение") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Разрешение получено")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Запланировать уведомление") {
                let content = UNMutableNotificationContent()
                content.title = "Собрать вещи в путешествие"
                content.subtitle = "Не забыть паспорт"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
