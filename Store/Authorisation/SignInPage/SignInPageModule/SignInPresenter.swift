//
//  SignInPresenter.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation

protocol SignInProtocol: AnyObject{
    func failure(error: Error)
}

protocol SignInPresenterProtocol: AnyObject{
    
    init(view: SignInProtocol, networkService: NetworkLayerProtocol, router: RouterProtocol)
    func setSignInData()
    func goToMainPage()
    func goToLogin()
    func goToLoginGoogle()
    func goToLoginApple()
}

class SignInPresenter: SignInPresenterProtocol{
 
    weak var view: SignInProtocol?
    let networkService: NetworkLayerProtocol!
    var router: RouterProtocol?
    
    required init(view: SignInProtocol, networkService: NetworkLayerProtocol, router:RouterProtocol){
        self.view = view
        self.router = router
        self.networkService = networkService
    }
    func setSignInData(){}
    func goToMainPage(){
        self.router?.initalMainTabControler(user: nil)
    }
    func goToLogin(){
        self.router?.showLogin()
    }
    func goToLoginGoogle(){
        print("-->goToLoginGoogle")
        
    }
    func goToLoginApple(){
        print("-->goToLoginApple")
        
    }
}
