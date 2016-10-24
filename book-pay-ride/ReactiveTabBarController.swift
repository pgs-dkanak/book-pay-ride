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
    var viewModel = RidesViewModel()
    
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
                viewModel.setRidesVisible(index)
            }
        })
    }
    
    func setSharedViewModel() {
        for vc in viewControllers ?? [] {
            if let rvc = vc as? RidesViewController {
                rvc.viewModel = self.viewModel
            }
        }
    }
    
}