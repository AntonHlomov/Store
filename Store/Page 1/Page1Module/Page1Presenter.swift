//
//  Page1Presenter.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation

protocol Page1Protocol: AnyObject{
    func failure(error: Error)
}

protocol Page1PresenterProtocol: AnyObject{
    
    init(view: Page1Protocol, networkService: NetworkLayerProtocol, router: RouterProtocol,user: User?)
    func setPage1Data()
}

class Page1Presenter: Page1PresenterProtocol{
 
    weak var view: Page1Protocol?
    let networkService: NetworkLayerProtocol!
    var router: RouterProtocol?
    var user: User?
    
    required init(view: Page1Protocol, networkService: NetworkLayerProtocol, router:RouterProtocol,user: User?){
        self.view = view
        self.router = router
        self.networkService = networkService
        self.user = user
    }
    func setPage1Data(){}
}

