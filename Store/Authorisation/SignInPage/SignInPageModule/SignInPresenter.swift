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
    func setDataNewUser(firstName:String,lastName:String,email:String)
    func goToLogin()
    func goToLoginGoogle()
    func goToLoginApple()
    func validationSignInData(firstName:String,lastName:String,email:String)
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
    func validationSignInData(firstName:String,lastName:String,email:String){
        // проверка есть ли пользователь в базе уже зарегистрированных если да вернуть alert сообщение о этом если нет добавить в базу данных
        print("-->validationSignInData")
        setDataNewUser(firstName:firstName,lastName:lastName,email:email)
        goToMainPage()
    }
    func setDataNewUser(firstName:String,lastName:String,email:String){
        print("-->setDataNewUser")
    }
    
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
