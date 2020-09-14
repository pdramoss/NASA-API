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
    
    func getAPODInformation(date: String, hd: Bool) {
        self.interactor?.getAPODData(date: date, hd: hd)
    }
}

extension APODPresenter: APODInteractorOutputProtocol {
    func getAPODSuccess(_ entity: EntityAPOD) {
        self.view?.displayAPODInformation(entity)
        Logger.info(entity)
    }
    
    func getAPODFailure(error: Error) {
        Logger.error(error)
    }
}
