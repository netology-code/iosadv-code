//
//  ViewController.swift
//  LocalizeProgect
//
//  Created by Константин Савялов on 17.05.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let title = tableView.cellForRow(at: indexPath)?.textLabel?.text else {
            return
        }
        
        switch title {
            case "Storyboard":
                let vc = UIStoryboard(
                    name: "StoryboardOnlyLocalization",
                    bundle: .main
                ).instantiateInitialViewController()!
                navigationController?.pushViewController(vc, animated: true)
            case "Info.plist":
                let vc = UIStoryboard(
                    name: "InfoPlist",
                    bundle: .main
                ).instantiateInitialViewController()!
                navigationController?.pushViewController(vc, animated: true)
            case "Data Formatting":
                let vc = FormattingAndLocalizationViewController()
                navigationController?.pushViewController(vc, animated: true)
            case ".strings":
                let vc = StringsViewController()
                navigationController?.pushViewController(vc, animated: true)
            case ".stringsdict":
                let vc = StringDictViewController()
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
        }
    }
}
