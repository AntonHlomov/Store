//
//  Login.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class Login: UIViewController {
    var presenter: LoginPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
}
extension Login: LoginProtocol{
    func failure(error: Error) {
     print("Login error")
    }
}
