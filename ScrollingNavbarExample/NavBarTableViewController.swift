//
//  NavBarTableViewController.swift
//  ScrollingNavbarExample
//
//  Created by Sachin Nautiyal on 2/27/19.
//  Copyright © 2019 Sachin Nautiyal. All rights reserved.
//

import UIKit

class NavBarTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            hideHeader(isHiding: true)
        }
        let rectOfCellInSuperview = tableView.convert(self.view.frame, to: tableView.superview)
        if let indexPaths = tableView.indexPathsForRows(in: rectOfCellInSuperview), let lastIndexPath = indexPaths.last {
            if lastIndexPath.row < indexPath.row {
            hideHeader(isHiding: false)
        }
        }
    }
    
    func hideHeader(isHiding : Bool) {
        if isHiding {
            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.navigationController?.setToolbarHidden(false, animated: true)
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.navigationController?.setToolbarHidden(true, animated: true)
            }, completion: nil)
        }
    }
}
