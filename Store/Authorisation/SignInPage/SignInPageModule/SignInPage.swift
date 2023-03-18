//
//  SignInPage.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class SignInPage: UIViewController {
    var presenter: SignInPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkText
    }
}
extension SignInPage: SignInProtocol{
    func failure(error: Error) {
     print("SignIn error")
    }
}
