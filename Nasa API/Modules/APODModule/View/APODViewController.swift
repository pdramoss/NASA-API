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
    private var contentView = APODContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentView()
        // Do any additional setup after loading the view.
    }
    
    private func addContentView() {
        self.contentView = setupContentView()
        let childView = UIHostingController(rootView: contentView)
        addChild(childView)
        childView.view.frame = view.frame
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
    
    private func setupContentView() -> APODContentView {
        let contentView = APODContentView { [weak self] (date) in
            self?.getData(date)
        }
        return contentView
    }
    
    private func getData(_ date: String) {
        self.presenter?.getAPODInformation(date: date, hd: true)
    }
}

extension APODViewController: APODViewProtocol {
}
