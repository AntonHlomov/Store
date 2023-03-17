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
    
}
class BuilderModels: BuilderModelsProtocol{
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let view = Login()
        let networkServiceRouter = NetworkLayer()
        let presenter = LoginPresenter(view: view, networkService: networkServiceRouter, router:router)
        view.presenter = presenter
        return view
    }
    
}
