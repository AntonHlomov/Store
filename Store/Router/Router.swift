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
}
protocol RouterProtocol: RouterAssembly {
    func initalLogin()
}
class Router: RouterProtocol{
    var navigationControler: UINavigationController?
    var builder: BuilderModelsProtocol?
    
    init(navigationControler: UINavigationController,builder: BuilderModelsProtocol){
        self.navigationControler = navigationControler
        self.builder = builder
    }
    func initalLogin() {
        if let navigationControler = navigationControler{
            guard let mainViewControler = builder?.createLoginModule(router: self) else {return}
            navigationControler.navigationBar.isHidden = true
            navigationControler.viewControllers = [mainViewControler]
        }
    }
    
}
