//
//  LikePresenter.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation

protocol LikeProtocol: AnyObject{
    func failure(error: Error)
}
protocol LikePresenterProtocol: AnyObject{
    init(view: LikeProtocol,networkService: NetworkLayerProtocol, router: RouterProtocol)
}
class LikePresenter: LikePresenterProtocol{
    weak var view: LikeProtocol?
    let networkService: NetworkLayerProtocol!
    var router: RouterProtocol?
    
    required init(view: LikeProtocol,networkService: NetworkLayerProtocol, router: RouterProtocol){
        self.view = view
        self.router = router
        self.networkService = networkService
    }
}
