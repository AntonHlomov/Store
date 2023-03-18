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
    func createPage1Module(router: RouterProtocol,user: User?) -> UIViewController
    func createMessengerModule(router: RouterProtocol) -> UIViewController
    func createMarketModule(router: RouterProtocol) -> UIViewController
    func createLikeModule(router: RouterProtocol) -> UIViewController
    
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
    func createPage1Module(router: RouterProtocol, user: User?) -> UIViewController {
        let view = Page1()
        let networkService = NetworkLayer()
        let presenter = Page1Presenter(view: view, networkService: networkService, router: router, user: user)
        view.presenter = presenter
        return view
    }
    
    func createMessengerModule(router: RouterProtocol) -> UIViewController {
        let view = MessengerPage()
        let networkServiceRouter = NetworkLayer()
        let presenter = MessengerPresenter(view: view, networkService: networkServiceRouter, router:router)
        view.presenter = presenter
        return view
    }
    func createMarketModule(router: RouterProtocol) -> UIViewController {
        let view = MarketPage()
        let networkServiceRouter = NetworkLayer()
        let presenter = MarketPresenter(view: view, networkService: networkServiceRouter, router:router)
        view.presenter = presenter
        return view
    }
    func createLikeModule(router: RouterProtocol) -> UIViewController {
        let view = LikePage()
        let networkServiceRouter = NetworkLayer()
        let presenter = LikePresenter(view: view, networkService: networkServiceRouter, router:router)
        view.presenter = presenter
        return view
    }
}
