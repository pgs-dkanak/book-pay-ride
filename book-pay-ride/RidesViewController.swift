//
//  RidesViewController.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 24/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import UIKit


class RidesViewController: UIViewController {
    
    var viewModel = RidesViewModel()


    @IBOutlet weak var sortButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        viewModel.ridesVisible = Ride(n: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //TODO: this should not be directed this way. It is against good design, but created here in sake of speed and because tabbarController is controlled by storyboard

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
