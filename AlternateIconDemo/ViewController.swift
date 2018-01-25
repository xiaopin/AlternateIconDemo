//
//  ViewController.swift
//  AlternateIconDemo
//
//  Created by nhope on 2018/1/24.
//  Copyright © 2018年 xiaopin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControlAction(segmentedControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        if #available(iOS 10.3, *) {
            if !UIApplication.shared.supportsAlternateIcons {
                return
            }
            let iPad = (UI_USER_INTERFACE_IDIOM() == .pad)
            var iconName: String? // nil表示使用App原来的图标
            if segmentedControl.selectedSegmentIndex == 1 { // 图标1
                iconName = iPad ? "AppAlternateIconiPad" : "AppAlternateIcon"
            } else if segmentedControl.selectedSegmentIndex == 2 { // 图标2
                iconName = iPad ? "AppAlternateIconiPad2" : "AppAlternateIcon2"
            }
            
            if UIApplication.shared.alternateIconName == iconName {
                let alert = UIAlertController(title: nil, message: "App图标已是当前选中的图标，无需更换", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "知道了", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            UIApplication.shared.setAlternateIconName(iconName, completionHandler: nil)
        }
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        let iPad = (UI_USER_INTERFACE_IDIOM() == .pad)
        switch sender.selectedSegmentIndex {
        case 1:
            imageView.image = UIImage(named: iPad ? "AppAlternateIconiPad" : "AppAlternateIcon")
        case 2:
            imageView.image = UIImage(named: iPad ? "AppAlternateIconiPad2" : "AppAlternateIcon2")
        default:
            imageView.image = UIImage(named: "AppIcon")
        }
    }
    
}

