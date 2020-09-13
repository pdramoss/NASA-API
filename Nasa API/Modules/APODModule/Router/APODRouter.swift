//
//  APODRouter.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation
import UIKit

class APODRouter: APODRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> APODViewController {
        let ref = APODViewController()
        let presenter: APODPresenterProtocol & APODInteractorOutputProtocol = APODPresenter()
        
        let router: APODRouterProtocol = APODRouter()
        router.viewController = ref
        
        let interactor: APODInteractorProtocol = APODInteractor()
        interactor.presenter = presenter
        
        presenter.view = ref
        presenter.router = router
        presenter.interactor = interactor
        
        ref.presenter = presenter
        return ref
    }
}
