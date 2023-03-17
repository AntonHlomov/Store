//
//  LoginPresenter.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation

protocol LoginProtocol: AnyObject{
    func failure(error: Error)
}

protocol LoginPresenterProtocol: AnyObject{
    
    init(view: LoginProtocol, networkService: NetworkLayerProtocol, router: RouterProtocol)
    func setLoginData()
}

class LoginPresenter: LoginPresenterProtocol{
 
    weak var view: LoginProtocol?
    let networkService: NetworkLayerProtocol!
    var router: RouterProtocol?
    
    required init(view: LoginProtocol, networkService: NetworkLayerProtocol, router:RouterProtocol){
        self.view = view
        self.router = router
        self.networkService = networkService
    }
    func setLoginData(){}
}
