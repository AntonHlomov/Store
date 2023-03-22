//
//  FontSettings.swift
//  Store
//
//  Created by Anton Khlomov on 21/03/2023.
//

import Foundation
import UIKit

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
}
