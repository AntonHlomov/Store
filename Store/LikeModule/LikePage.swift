//
//  LikePage.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class LikePage: UIViewController {
    var presenter: LikePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}
extension LikePage: LikeProtocol{
    func failure(error: Error) {
     print("LikePage error")
    }
}
