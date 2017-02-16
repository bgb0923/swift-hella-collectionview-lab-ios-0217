//
//  HellaDetailViewController.swift
//  HellaCollectionCells
//
//  Created by William Brancato on 2/15/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class HellaDetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var string: String!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = string
        self.view.backgroundColor = color
    }
}
