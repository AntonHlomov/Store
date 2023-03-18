//
//  MarketPresenter.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation

protocol MarketProtocol: AnyObject{
    func failure(error: Error)
}
protocol MarketPresenterProtocol: AnyObject{
    init(view: MarketProtocol,networkService: NetworkLayerProtocol, router: RouterProtocol)
}
class MarketPresenter: MarketPresenterProtocol{
    weak var view: MarketProtocol?
    let networkService: NetworkLayerProtocol!
    var router: RouterProtocol?
    
    required init(view: MarketProtocol,networkService: NetworkLayerProtocol, router: RouterProtocol){
        self.view = view
        self.router = router
        self.networkService = networkService
    }
}
