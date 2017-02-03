//
//  NamesController.swift
//  Bernard
//
//  Created by Michael Johnson on 12/6/16.
//  Copyright © 2016 Michael Johnson. All rights reserved.
//

import Foundation
import  UIKit

protocol NamesControllerProtocol {
    func nextNameButtonAction()
    func previousNameButtonAction()
    func updateModel()
    func viewDidLoad()
}

class NamesController : NamesControllerProtocol, NamesModelObserving {
    
    var viewController : NamesViewControllerProtocol
    var namesModel : NamesModelProtocol
    
    convenience init(viewController : NamesViewControllerProtocol) {
        self.init(viewController: viewController, namesModel: PersistanceLayer.sharedInstance.namesModel)
    }

    convenience init(viewController : NamesViewControllerProtocol, nameGenerator : NameGenerating) {
        self.init(viewController: viewController,
                  namesModel: NamesModel(nameGenerator: nameGenerator))
    }

    init(viewController : NamesViewControllerProtocol, namesModel : NamesModelProtocol) {
        self.viewController = viewController
        self.namesModel = namesModel
    }
    
    func nextNameButtonAction() {
        viewController.nameText = namesModel.nextName()
    }
    
    func previousNameButtonAction() {
        viewController.nameText = namesModel.previousName()
    }
    
    func updateModel() {
        namesModel.currentNameIsFavorited = viewController.favoriteToggleIsOn
    }
    
    func viewDidLoad() {
        viewController.favoriteToggleIsOn = namesModel.currentNameIsFavorited
        viewController.nameText = namesModel.currentName ?? ""
        namesModel.addObserver(self)
    }
    
    func namesModelDidUpdate() {
        viewController.favoriteToggleIsOn = namesModel.currentNameIsFavorited
        viewController.nameText = namesModel.currentName
    }
}
