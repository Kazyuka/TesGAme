//
//  TopView.swift
//  TestGame
//
//  Created by Руслан Казюка on 20.03.2018.
//  Copyright © 2018 Казюка Руслан Сергеевич. All rights reserved.
//

import UIKit
class TopView: UIView {
    
    var modelCell = ModelForTableCell()
    var homeController: HomeController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.addSubview(wirTextField)
        self.addSubview(warTextField)
        self.addSubview(labelBip)
        self.addSubview(labelBop)
        
        labelBip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -22).isActive = true
        labelBip.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50).isActive = true
        labelBip.heightAnchor.constraint(equalToConstant: 40).isActive = true
        labelBip.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        labelBop.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -22).isActive = true
        labelBop.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 60).isActive = true
        labelBop.heightAnchor.constraint(equalToConstant: 40).isActive = true
        labelBop.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        wirTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        wirTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50).isActive = true
        wirTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        wirTextField.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        warTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        warTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 60).isActive = true
        warTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        warTextField.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    lazy var labelBip: UILabel = {
        var lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textAlignment = .center
        lab.text = "Select Bip"
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    lazy var labelBop: UILabel = {
        var lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textAlignment = .center
        lab.text = "Select Bop"
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    lazy var wirTextField: UITextField = {
        let textField = UITextField()
        textField.tag = 1
        textField.placeholder = "Вip"
        textField.text = "3"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.layer.cornerRadius = 10.0
        textField.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        textField.layer.borderWidth = 1.0
        return textField
        
    }()
    
    lazy var warTextField: UITextField = {
        let textField = UITextField()
        textField.tag = 2
        textField.placeholder = "Вop"
        textField.textAlignment = .center
        textField.text = "5"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.layer.cornerRadius = 10.0
        textField.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    lazy var wirLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var worLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension TopView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        checkIsEmpty(text: newString, textF: textField)
        return true
    }
    
    func checkIsEmpty(text: String, textF: UITextField) {
        
        guard let textLetter = Int(text) else {
            return
        }
        if text != "" && text != "0" {
            switch textF.tag {
            case 1:
                homeController?.dataForTableView.wir = Int(text)!
            case 2:
                homeController?.dataForTableView.wor = Int(text)!
            default:
                break
            }
        }
    }
}
