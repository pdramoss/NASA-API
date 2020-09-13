//
//  APODViewController.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import UIKit
import SwiftUI

class APODViewController: UIViewController {

    var presenter: APODPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentView()
        // Do any additional setup after loading the view.
    }
    
    func addContentView() {
        let childView = UIHostingController(rootView: APODContentView())
        addChild(childView)
        childView.view.frame = view.frame
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}

extension APODViewController: APODViewProtocol {
    
}
