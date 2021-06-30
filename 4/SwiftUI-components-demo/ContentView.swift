//
//  ContentView.swift
//  SwiftUI-components-demo
//
//

import SwiftUI

// Нужно раскомментировать часть которую нужно продемонстрировать и открыть канвас для Live Preview


// toggle – для проверки нажать Live Preview

//struct ContentView: View {
//    @State private var isPushEnable = false
//
//    var body: some View {
//        Form {
//            Section {
//                Toggle(isOn: $isPushEnable) {
//                    Text("Toggle")
//                }
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//        }
//    }
//}


// Scroller

//struct ContentView: View {
//    @State private var speed = 50.0
//    @State private var isEditing = false
//
//    var body: some View {
//        VStack {
//            Slider (
//                value: $speed,
//                in: 0...100,
//                onEditingChanged: {
//                    editing in isEditing = editing
//                }
//            )
//            Text("\(speed)")
//                .foregroundColor(isEditing ? .red : .blue)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//        }
//    }
//}


// Buttons and alerts

//struct Universe: Identifiable {
//    var id: String { name }
//    let name: String
//}
//
//struct ContentView: View {
//    @State private var selectedShow: Universe?
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Какая киновселенная вам нравится больше?")
//                .font(.headline)
//            Button("Marvel") {
//                selectedShow = Universe(name: "Вы выбрали Marvel")
//            }
//            Button("DC") {
//                selectedShow = Universe(name: "Вы выбрали DC")
//            }
//        }
//        .alert(item: $selectedShow) { show in
//            Alert(title: Text(show.name), message: Text("Нажмите чтобы вернуться"), dismissButton: .cancel())
//        }
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//        }
//    }
//}
