//
//  APODProtocols.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation
import UIKit

protocol APODInteractorProtocol: class {
    var presenter: APODInteractorOutputProtocol? { get set }
}

protocol APODPresenterProtocol: class {
    var view: APODViewProtocol? { get set }
    var router: APODRouterProtocol? { get set }
    var interactor: APODInteractorProtocol? { get set }}

protocol APODInteractorOutputProtocol: class {
    
}

protocol APODRouterProtocol: class {
    var viewController: UIViewController? { get set }
    static func createModule() -> APODViewController
}

protocol APODViewProtocol: class {
    var presenter: APODPresenterProtocol? { get set }
}
