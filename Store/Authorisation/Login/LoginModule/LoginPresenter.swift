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
    func validationSignInData(firstName:String,password:String)
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
    func goToMainPage(){
        self.router?.initalMainTabControler(user: nil)
    }
    func validationSignInData(firstName:String,password:String){
        // validation user data in coredata (locol)
        var validationUser = true // validationUser принимает значение после запроса в локальной хранилище
        if validationUser{
            goToMainPage()
        }else{
            let userInformation = [NSLocalizedDescriptionKey: "User not found."]
            let error = NSError(domain: "StoreDomain", code: 401, userInfo:userInformation)
            self.view?.failure(error: error )
        }
    }
}
