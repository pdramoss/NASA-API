//
//  APODInteractor.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

class APODInteractor: APODInteractorProtocol {
    weak var presenter: APODInteractorOutputProtocol?
    var networkingAdapter: NetworkingAPODAdapterProtocol?
    
    init(_ networkingAdapter: NetworkingAPODAdapterProtocol = NetworkingAPODAdapter()) {
        self.networkingAdapter = networkingAdapter
    }
    
    func getAPODData(date: String, hd: Bool) {
        self.networkingAdapter?.getAPOD(date: date, hd: hd, completion: { [weak self] (response) in
            switch response {
            case .success(let entity):
                self?.presenter?.getAPODSuccess(entity)
            case .failure(let error):
                self?.presenter?.getAPODFailure(error: error)
            }
        })
    }
}
