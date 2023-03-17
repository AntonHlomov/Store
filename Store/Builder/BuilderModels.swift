//
//  BuilderModels.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation
import UIKit

protocol BuilderModelsProtocol{
    func createLoginModule(router: RouterProtocol) -> UIViewController
    func createSignInModule(router: RouterProtocol) -> UIViewController
    func createUserProfileModule(router: RouterProtocol,user: User?) -> UIViewController
    
}
class BuilderModels: BuilderModelsProtocol{
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let view = Login()
        let networkServiceRouter = NetworkLayer()
        let presenter = LoginPresenter(view: view, networkService: networkServiceRouter, router:router)
        view.presenter = presenter
        return view
    }
    
    func createSignInModule(router: RouterProtocol) -> UIViewController {
        let view = SignInPage()
        let networkServiceRouter = NetworkLayer()
        let presenter = SignInPresenter(view: view, networkService: networkServiceRouter, router:router)
        view.presenter = presenter
        return view
    }
    func createUserProfileModule(router: RouterProtocol, user: User?) -> UIViewController {
        let view = Profile()
        let networkService = NetworkLayer()
        let presenter = ProfilePresenter(view: view, networkService: networkService, router: router, user: user)
        view.presenter = presenter
        return view
    }
    
}
