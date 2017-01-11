//
//  FavoritesTableViewController.swift
//  Bernard
//
//  Created by Michael Johnson on 1/8/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var controller : FavoritesControllerProtocol! = nil
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if (controller == nil) {
//            controller = FavoritesController()
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if (controller == nil) {
            controller = FavoritesController(viewController: self)
//            controller.viewController = self
//            if let tabBarController = self.tabBarController as? TabBarController {
//                self.controller.namesModel = tabBarController.namesModel
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.controller.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = controller.tableView(tableView, cellForRowAt: indexPath)
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}