//
//  MessengerPage.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class MessengerPage: UIViewController {
    var presenter: MessengerPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
}
extension MessengerPage: MessengerProtocol{
    func failure(error: Error) {
     print("MessengerPage error")
    }
}
