//
//  SignInPage.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//
import UIKit

class SignInPage: UIViewController {
    
    var presenter: SignInPresenterProtocol!
    fileprivate var headerText  = UILabel.headerMiddle(title: "Sign in", textAlignment: .center)
    fileprivate var firstName = UITextField.setupTextField(title: "First name", hideText: false, enabled: true)
    fileprivate var lastName = UITextField.setupTextField(title: "Last name", hideText: false, enabled: true)
    fileprivate var email = UITextField.setupTextField(title: "Email", hideText: false, enabled: true)
    fileprivate var signIn = UIButton.setupButton(title: "Sign in", activation: false, invisibility: false)
    fileprivate var logoApple = UIImageView.logoImage(image:  #imageLiteral(resourceName: "VectorAp").withRenderingMode(.alwaysOriginal))
    fileprivate var logoGoogle = UIImageView.logoImage(image:  #imageLiteral(resourceName: "VectorG").withRenderingMode(.alwaysOriginal))
    fileprivate let loginButton = UIButton.stringButton(firstText: "Already have an account? ", secondText: "Log in", firstColor:UIColor.appColor(.GrayStore)!, secondColor: UIColor.appColor(.ColorButtonStore)!,contentHorizontalAlignment: .left)
    fileprivate let signGoogleButton = UIButton.stringButton(firstText: "Sign in witch ", secondText: "Google", firstColor:UIColor.appColor(.BalackStore)!, secondColor: UIColor.appColor(.BalackStore)!,contentHorizontalAlignment: .left)
    fileprivate let signAppleButton = UIButton.stringButton(firstText: "Sign in witch ", secondText: "Apple", firstColor:UIColor.appColor(.BalackStore)!, secondColor: UIColor.appColor(.BalackStore)!,contentHorizontalAlignment: .left)
    lazy var stacMainBlock =  UIStackView(arrangedSubviews: [firstName,lastName,email,signIn])
    lazy var stacApple =  UIStackView(arrangedSubviews: [logoApple,signAppleButton])
    lazy var stacGoogle =  UIStackView(arrangedSubviews: [logoGoogle,signGoogleButton])
    lazy var stacFooterBlock =  UIStackView(arrangedSubviews: [stacGoogle,stacApple])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColor(.WhiteStore)
        setupNotificationObserver()
        configureViewComponents()
        setupTapGesture()
        handlers()
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    // MARK: - ConfigureView
    func configureViewComponents(){
        view.addSubview(headerText)
        headerText.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,pading: .init(top: 155, left: 0, bottom: 0, right:0), size: .init(width: 0, height: 0))
        headerText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stacMainBlock.axis = .vertical
        stacMainBlock.spacing = 35
        stacMainBlock.distribution = .fillEqually
        view.addSubview(stacMainBlock)
        stacMainBlock.anchor(top: headerText.bottomAnchor,leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,pading: .init(top: 77, left: 43, bottom: 0, right:43), size: .init(width: 0, height: view.frame.height/3.1))
        view.addSubview(loginButton)
        loginButton.anchor(top: stacMainBlock.bottomAnchor, leading: stacMainBlock.leadingAnchor, bottom: nil, trailing: stacMainBlock.trailingAnchor,pading: .init(top: 10, left: 0, bottom: 0, right:0), size: .init(width: 0, height: 0))
        stacGoogle.axis = .horizontal
        stacGoogle.spacing = -52
        stacGoogle.distribution = .fillEqually
        stacApple.axis = .horizontal
        stacApple.spacing = -52
        stacApple.distribution = .fillEqually
        stacFooterBlock.axis = .vertical
        stacFooterBlock.spacing = 25
        stacFooterBlock.distribution = .fillEqually
        view.addSubview(stacFooterBlock)
        stacFooterBlock.anchor(top: loginButton.bottomAnchor,leading: nil, bottom: nil, trailing: nil,pading: .init(top: 80, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width/1.3, height: view.frame.height/10))
       stacFooterBlock.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    // MARK: - Handlers
    fileprivate func handlers(){
        firstName.addTarget(self, action: #selector(formValidation), for: .editingChanged )
        lastName.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        email.addTarget(self, action: #selector(formValidationEmail), for: .editingChanged)
        signIn.addTarget(self, action: #selector(goToMainPage), for: .touchUpInside)
        signIn.alpha = 0.8
        loginButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        signGoogleButton.addTarget(self, action: #selector(goToLoginGoogle), for: .touchUpInside)
        signAppleButton.addTarget(self, action: #selector(goToLoginApple), for: .touchUpInside)
    }
    // MARK: - Actions buttons
    @objc fileprivate func goToMainPage(){
        presenter.goToMainPage()
    }
    @objc fileprivate func goToLogin(){
        presenter.goToLogin()
    }
    @objc fileprivate func goToLoginGoogle(){
        presenter.goToLoginGoogle()
    }
    @objc fileprivate func goToLoginApple(){
        presenter.goToLoginApple()
    }
    // MARK: - Validation
    @objc fileprivate func formValidationEmail() {
        guard
            email.hasText,
            isValidEmail(email.text!)
        else{
            self.signIn.isEnabled = false
            signIn.alpha = 0.8
            print("ошибка валидации email")
            return
        }
        formValidation()
    }
    @objc fileprivate func formValidation(){
        guard
            firstName.hasText,
            lastName.hasText,
            email.hasText,
            isValidEmail(email.text!)
        else {
            self.signIn.isEnabled = false
            signIn.alpha = 0.8
            return
        }
        signIn.isEnabled = true
        signIn.alpha = 1
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
        let bottomSpace = view.frame.height - stacMainBlock.frame.origin.y - stacMainBlock.frame.height        //на сколько должна сдвинуть интерфейс
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
extension SignInPage: SignInProtocol{
    func failure(error: Error) {
     print("SignIn error")
    }
}
