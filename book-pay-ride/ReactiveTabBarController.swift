//
//  ReactiveTabBarController.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 24/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import Foundation
import UIKit

class ReactiveTabBarController : UITabBarController {
    override var selectedIndex: Int {
        didSet {
            print("selected index: \(self.selectedIndex)")
        }
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.viewControllers?.forEach({ (vc : UIViewController) in
            if vc.tabBarItem == item {
                let index = self.viewControllers?.indexOf(vc) ?? 0
                print("selected index \(index)")
            }
        })
    }
    
}