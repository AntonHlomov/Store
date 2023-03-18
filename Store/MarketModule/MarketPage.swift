//
//  MarketPage.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class MarketPage: UIViewController {
    var presenter: MarketPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}
extension MarketPage: MarketProtocol{
    func failure(error: Error) {
     print("MarketPage error")
    }
}
