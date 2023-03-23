//
//  Login.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import UIKit

class Login: UIViewController {
    var presenter: LoginPresenterProtocol!
    fileprivate var headerText  = UILabel.headerMiddle(title: "Welcome back", textAlignment: .center)
    fileprivate var firstName = UITextField.setupTextField(title: "First name", hideText: false, enabled: true)
    fileprivate var password = UITextField.setupTextField(title: "Password", hideText: true, enabled: true)
    fileprivate var login = UIButton.setupButton(title: "Login", activation: false, invisibility: false)
  // fileprivate var eye = UIImageView.logoImage(image:  #imageLiteral(resourceName: "yeyClose").withRenderingMode(.alwaysOriginal))
    fileprivate var eye = UIButton.imageButton(image:  #imageLiteral(resourceName: "eyeClose").withRenderingMode(.alwaysOriginal))
    lazy var stac =  UIStackView(arrangedSubviews: [firstName,password])


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColor(.WhiteStore)
        setupNotificationObserver()
        configureViewComponents()
        setupTapGesture()
        handlers()
    }
    func configureViewComponents(){
        view.addSubview(headerText)
        headerText.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,pading: .init(top: 158, left: 0, bottom: 0, right:0), size: .init(width: 0, height: 0))
        headerText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stac.axis = .vertical
        stac.spacing = 33
        stac.distribution = .fillEqually
        view.addSubview(stac)
        stac.anchor(top: headerText.bottomAnchor,leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,pading: .init(top: 82, left: 43, bottom: 0, right:43), size: .init(width: 0, height: view.frame.height/8.7))
        stac.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addSubview(login)
        login.anchor(top: stac.bottomAnchor, leading: stac.leadingAnchor, bottom: nil, trailing: stac.trailingAnchor,pading: .init(top: view.frame.height/8.3, left: 0, bottom: 0, right:0), size: .init(width: 0, height: 46))
        login.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
       // eye.frame = CGRect(x:140, y:0, width:30, height:30)
        view.addSubview(eye)
        eye.anchor(top: password.topAnchor, leading: nil, bottom: nil, trailing: password.trailingAnchor,pading: .init(top: 0, left: 15, bottom: 0, right:0), size: .init(width: 30, height: 30))
   
        password.rightViewMode = .always
        password.rightView = eye
    
    }
    // MARK: - Handlers
    fileprivate func handlers(){
        firstName.addTarget(self, action: #selector(formValidation), for: .editingChanged )
        password.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        login.addTarget(self, action: #selector(pressLogin), for: .touchUpInside)
        eye.addTarget(self, action: #selector(iconAction), for: .touchUpInside)
        login.alpha = 0.8
    }
    @objc fileprivate func formValidation(){
        guard
            firstName.hasText,
            password.hasText
        else {
            self.login.isEnabled = false
            login.alpha = 0.8
            return
        }
        login.isEnabled = true
        login.alpha = 1
    }
    @objc fileprivate func pressLogin(){
        guard let name = firstName.text else{return}
        guard let password = password.text else{return}
        presenter.validationSignInData(firstName: name, password: password)
    }
    @objc func iconAction() {
        if password.isSecureTextEntry {
            password.isSecureTextEntry = false
            eye.setImage( #imageLiteral(resourceName: "eye").withRenderingMode(.alwaysOriginal), for: .normal)
            password.togglePasswordVisibility()
           
            } else {
                password.isSecureTextEntry = true
                eye.setImage( #imageLiteral(resourceName: "eyeClose").withRenderingMode(.alwaysOriginal), for: .normal)
                password.togglePasswordVisibility()
            }
    }
    // MARK: - Keyboard
    fileprivate func  setupNotificationObserver(){
        // следит когда подниметься клавиатура
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardSwow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // следит когда пbcxtpftn
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardSwowHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {      //очищает клавиатуру из памяти обязательно делать если вызываешь клаву
         super.viewWillDisappear(animated)
         NotificationCenter.default.removeObserver(self)
     }
    //размеры клавиатуры
    @objc fileprivate func handleKeyboardSwow(notification: Notification){
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardframe = value .cgRectValue    //рамка клавиатуры
        let bottomSpace = view.frame.height - stac.frame.origin.y - stac.frame.height -  login.frame.height - view.frame.height/8.3       //на сколько должна сдвинуть интерфейс
        let difference = keyboardframe.height - bottomSpace
        self.view.transform = CGAffineTransform(translationX: 0, y: -difference - 15)
    }
    //опускание клавиатуры
    @objc fileprivate func handleKeyboardSwowHide(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.transform = .identity     // интерфейс опускаеться в низ
        }, completion: nil)
    }
    fileprivate func setupTapGesture(){
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
    }
    @objc fileprivate func handleTapDismiss(){
        view.endEditing(true)
    }
    
}
extension Login: LoginProtocol{
    func failure(error: Error) {
    let error = "\(error.localizedDescription)"
    print(error)
    }
}
