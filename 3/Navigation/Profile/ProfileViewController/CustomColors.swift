//
//  CustomColors.swift
//  Navigation
//
//  Created by Konstantin Trekhperstov on 05.06.2021.
//  Copyright © 2021 Egor Badaev. All rights reserved.
//

import UIKit

extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }

    static let headerBackground = createColor(lightMode: lightGray, darkMode: .black)
    static let headerTextFieldBackround = createColor(lightMode: .white, darkMode: .black)
    static let headerTextFieldBorder = createColor(lightMode: .black, darkMode: .white)
    static let headerTextFieldText = createColor(lightMode: .black, darkMode: .white)
    static let headerStatusLabel = createColor(lightMode: .gray, darkMode: .red)
    static let headerNameLabel = createColor(lightMode: .black, darkMode: .white)
    static let headerStatusButtonShadow = createColor(lightMode: .black, darkMode: .white)


}
