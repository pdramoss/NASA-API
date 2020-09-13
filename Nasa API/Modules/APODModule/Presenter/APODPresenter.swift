//
//  APODPresenter.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

class APODPresenter: APODPresenterProtocol {
    weak var view: APODViewProtocol?
    var router: APODRouterProtocol?
    var interactor: APODInteractorProtocol?
}

extension APODPresenter: APODInteractorOutputProtocol {
    
}
