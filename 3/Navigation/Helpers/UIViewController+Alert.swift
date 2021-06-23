//
//  UIViewController+Alert.swift
//  Navigation
//
//  Created by Egor Badaev on 04.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorAlert(_ message: String) {
        self.present(AlertFactory.makeErrorAlert(message), animated: true, completion: nil)
    }
}
