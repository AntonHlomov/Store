//
//  MessengerPresenter.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation

protocol MessengerProtocol: AnyObject{
    func failure(error: Error)
}
protocol MessengerPresenterProtocol: AnyObject{
    init(view: MessengerProtocol,networkService: NetworkLayerProtocol, router: RouterProtocol)
}
class  MessengerPresenter: MessengerPresenterProtocol{
    weak var view: MessengerProtocol?
    let networkService: NetworkLayerProtocol!
    var router: RouterProtocol?
    
    required init(view: MessengerProtocol,networkService: NetworkLayerProtocol, router: RouterProtocol){
        self.view = view
        self.router = router
        self.networkService = networkService
    }
}
