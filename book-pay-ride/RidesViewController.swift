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

    private let disposeBag = DisposeBag()
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var ridesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.onRidesChanged.subscribeNext { _ in
            self.ridesTableView.reloadData()
        }.addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

extension RidesViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rides.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RideTableViewCell", forIndexPath: indexPath) as! RideTableViewCell
        cell.ride = viewModel.rides[indexPath.row]
        return cell
    }
}

extension RidesViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected indexPath: \(indexPath)")
    }
}
