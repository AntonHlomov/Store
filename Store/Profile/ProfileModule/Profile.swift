//
//  Profile.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class Profile: UIViewController {
    var presenter: ProfilePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
}
extension Profile: ProfileProtocol{
    func failure(error: Error) {
        print("Profile error")
    }
    
    func setBalance(item: Double, currency: Currency) {
        print("setBalance",currency.description)
    }

}
