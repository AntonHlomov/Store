//
//  Page1.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class Page1: UIViewController {
    var presenter: Page1PresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }

}
extension Page1: Page1Protocol{
    func failure(error: Error) {
        print("Page1 error")
    }

}
