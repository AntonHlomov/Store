//
//  FontSettings.swift
//  Store
//
//  Created by Anton Khlomov on 21/03/2023.
//

import Foundation
import UIKit

extension UIImageView {
    class func logoImage (image: UIImage) -> UIImageView{
  //    let iv = UIImageView(image: #imageLiteral(resourceName: "icons8-булавка-для-карты-24").withRenderingMode(.alwaysOriginal))
        let iv = UIImageView(image: image)
        iv.backgroundColor = .clear
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        return iv
    }
}
extension UILabel {
    class func headerMiddle (title: String,textAlignment: NSTextAlignment) -> UILabel{
        let text = UILabel()
        text.text = title
        text.textAlignment = textAlignment
        text.textColor = UIColor.appColor(.HeaderColorText)
        text.font = UIFont.boldSystemFont(ofSize: 25)
        text.numberOfLines = 1
        return text
    }
}
class CustomTextField: UITextField{
    let padding: CGFloat
    init(padding:CGFloat) {
        self.padding = padding
        super.init(frame: .zero)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    override var intrinsicContentSize: CGSize{
        return .init(width: 0, height: 50)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UITextField{
    class func setupTextField(title: String, hideText: Bool, enabled: Bool) -> UITextField {
        let tf = CustomTextField(padding: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        tf.backgroundColor = UIColor.appColor(.FonTextField)
        tf.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
            .paragraphStyle: paragraphStyle])
        tf.layer.cornerRadius = 18
        tf.font = UIFont .systemFont(ofSize: 16)
        tf.textColor = UIColor.appColor(.BalackStore)
        tf.isSecureTextEntry = hideText         // скрытие пороля
        tf.isEnabled = enabled
        
        return tf
    }
}
extension UITextField {
    // коррекция курсора для смены режимов видимости пароля
    func togglePasswordVisibility() {
        if let existingText = text, isSecureTextEntry {
            /* When toggling to secure text, all text will be purged if the user
             continues typing unless we intervene. This is prevented by first
             deleting the existing text and then recovering the original text. */
            deleteBackward()

            if let textRange = textRange(from: beginningOfDocument, to: endOfDocument) {
                replace(textRange, withText: existingText)
            }
        }
        /* Reset the selected text range since the cursor can end up in the wrong
         position after a toggle because the text might vary in width */
        if let existingSelectedTextRange = selectedTextRange {
            selectedTextRange = nil
            selectedTextRange = existingSelectedTextRange
        }
    }
}
extension UIButton{
    class func setupButton(title: String, activation: Bool, invisibility: Bool) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.appColor(.WhiteStore), for: .normal)
        button.backgroundColor = UIColor.appColor(.ColorButtonStore)
        button.layer.cornerRadius = 12 //30/2  // скругляем кнопку
        button.isEnabled = activation   //диактивация кнопки изначально кнопка не активна (активна после заполнения всех полей)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isHidden = invisibility
        
        return button
    }
    
    class func stringButton(firstText:String,secondText:String,firstColor:UIColor,secondColor:UIColor,contentHorizontalAlignment: UIControl.ContentHorizontalAlignment ) -> UIButton{
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: firstText, attributes: [.font:UIFont.systemFont (ofSize: 12), .foregroundColor: firstColor ])
        attributedTitle.append(NSAttributedString(string: secondText, attributes: [.font:UIFont.systemFont (ofSize: 12), .foregroundColor: secondColor ]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.contentHorizontalAlignment = contentHorizontalAlignment
        return button
    }
    class func imageButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.tintColor = UIColor(white: 1, alpha: 1)
        return button
        
    }
}
