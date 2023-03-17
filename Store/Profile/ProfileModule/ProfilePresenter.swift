//
//  ProfilePresenter.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation

protocol ProfileProtocol: AnyObject{
    func failure(error: Error)
    func setBalance(item: Double,currency:Currency)
}

protocol ProfilePresenterProtocol: AnyObject{
    
    init(view: ProfileProtocol, networkService: NetworkLayerProtocol, router: RouterProtocol,user: User?)
    func getProfileData()
    func logOut()
    func getBalance()
}

class ProfilePresenter: ProfilePresenterProtocol{
 
    weak var view: ProfileProtocol?
    let networkService: NetworkLayerProtocol!
    var router: RouterProtocol?
    var user: User?
    
    required init(view: ProfileProtocol, networkService: NetworkLayerProtocol, router:RouterProtocol,user: User?){
        self.view = view
        self.router = router
        self.networkService = networkService
        self.user = user
        setData()
    }
    func getProfileData(){}
    func logOut(){
        self.router?.initalSignIn()
    }
    func getBalance(){}
    func setData(){
        self.view?.setBalance(item: 1593, currency: .Dollar)
    }
}

