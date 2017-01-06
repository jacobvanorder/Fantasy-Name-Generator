//
//  ViewController.swift
//  Bernard
//
//  Created by Michael Johnson on 12/5/16.
//  Copyright © 2016 Michael Johnson. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    var nameText : String? {get set}
    var favoriteToggleIsOn : Bool {get set}
}

class ViewController: UIViewController, ViewControllerProtocol {

    @IBOutlet weak var previousNameButton: UIButton!
    @IBOutlet weak var nextNameButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteToggle: UISwitch!
    
    var delegate : ViewControllerDelegateProtocol!
    
    var nameText : String? {
        get {
            return nameLabel?.text
        }
        set {
            nameLabel?.text = newValue
        }
    }
    
    var favoriteToggleIsOn : Bool {
        get {
            return favoriteToggle.isOn
        }
        set {
            favoriteToggle.setOn(newValue, animated: true)
        }
    }
    
    @IBAction func nextNameButtonAction(_ sender: UIButton) {
        delegate.nextNameButtonAction()
    }

    @IBAction func previousNameButtonAction(_ sender: UIButton) {
        delegate.previousNameButtonAction()
    }

    @IBAction func favoriteToggleWasUpdatedAction(_ sender: UISwitch) {
        delegate.favoriteToggleWasUpdatedAction()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if delegate == nil {
            delegate = ViewControllerDelegate.init(viewController:self)
        }
    }

}

