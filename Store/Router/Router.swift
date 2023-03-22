//
//  Router.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation
import UIKit

protocol RouterAssembly{
    var navigationControler: UINavigationController? {get set}
    var builder: BuilderModelsProtocol? {get set}
    var tabBarControler: UITabBarController? {get set}
}
protocol RouterProtocol: RouterAssembly {
    func initalLogin()
    func showLogin()
    func initalSignIn()
    func showProfileModule(user: User?)
    func initalMainTabControler(user: User?)
}
class Router: RouterProtocol{
    var navigationControler: UINavigationController?
    var tabBarControler: UITabBarController?
    var builder: BuilderModelsProtocol?
    
    init(navigationControler: UINavigationController,tabBarControler: UITabBarController,builder: BuilderModelsProtocol){
        self.navigationControler = navigationControler
        self.builder = builder
        self.tabBarControler = tabBarControler
    }
    func initalLogin() {
        if let navigationControler = navigationControler{
            guard let mainViewControler = builder?.createLoginModule(router: self) else {return}
            navigationControler.navigationBar.isHidden = true
            navigationControler.viewControllers = [mainViewControler]
        }
    }
    func showLogin(){
        if let navigationControler = navigationControler{
            guard let showViewControler = builder?.createLoginModule(router: self) else {return}
            navigationControler.navigationBar.isHidden = true
            navigationControler.pushViewController(showViewControler, animated: true)
        }
    }
    func initalSignIn() {
        if let navigationControler = navigationControler{
            guard let mainViewControler = builder?.createSignInModule(router: self) else {return}
            navigationControler.navigationBar.isHidden = true
            navigationControler.viewControllers = [mainViewControler]
        }
    }
    func showProfileModule(user: User?){
        if let navigationControler = navigationControler{
            guard let showViewControler =  builder?.createUserProfileModule(router: self, user: user) else {return}
            navigationControler.navigationBar.isHidden = false
            navigationControler.pushViewController(showViewControler, animated: true)
        }
    }
    func initalMainTabControler(user: User?) {
        if let tabBarControler = tabBarControler , let navigationControler = navigationControler {
            guard let pag1Module = builder?.createPage1Module(router: self, user: user) else {return}
            guard let LikeModule = builder?.createLikeModule(router:self) else {return}
            guard let MarketModule = builder?.createMarketModule(router:self) else {return}
            guard let MessengerModule = builder?.createMessengerModule(router:self) else {return}
            guard let profileModule = builder?.createUserProfileModule(router: self, user: user) else {return}
            
            let pag1Buttom = addForNavController(viewController: pag1Module, title:nil, selectadImage: #imageLiteral(resourceName: "Page1"), unselectedImage: #imageLiteral(resourceName: "Page1"))
            let likeButtom = addForNavController(viewController: LikeModule, title:nil, selectadImage: #imageLiteral(resourceName: "Group 2"), unselectedImage: #imageLiteral(resourceName: "Group 2"))
            let marketButtom = addForNavController(viewController: MarketModule, title:nil, selectadImage: #imageLiteral(resourceName: "Group 1"), unselectedImage: #imageLiteral(resourceName: "Group 1"))
            let messengerButtom = addForNavController(viewController: MessengerModule, title:nil, selectadImage: #imageLiteral(resourceName: "Group 3"), unselectedImage: #imageLiteral(resourceName: "Group 3"))
            let profileButtom = addForNavController(viewController: profileModule, title: nil, selectadImage: #imageLiteral(resourceName: "Profile"), unselectedImage: #imageLiteral(resourceName: "Profile"))
            
            let controllers = [pag1Buttom,likeButtom,marketButtom,messengerButtom,profileButtom]
            tabBarControler.setViewControllers(controllers, animated: true)
            tabBarControler.tabBar.isTranslucent = false
            tabBarControler.tabBar.tintColor = .darkGray
            tabBarControler.tabBar.barTintColor = UIColor.appColor(.FonTabBarStore)
            tabBarControler.tabBar.backgroundColor = UIColor.appColor(.FonTabBarStore)
            tabBarControler.tabBar.layer.cornerRadius = 25
            tabBarControler.tabBar.layer.masksToBounds = true

            navigationControler.navigationBar.isHidden = false
            navigationControler.viewControllers = [tabBarControler]
        }
    }
    func addForNavController(viewController: UIViewController, title: String?, selectadImage: UIImage, unselectedImage: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = selectadImage
        viewController.tabBarItem.selectedImage = unselectedImage
 
        return viewController
    }
}
