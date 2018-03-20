//
//  ExplanationController.swift
//  TestGame
//
//  Created by Казюка Руслан Сергеевич on 20.03.18.
//  Copyright © 2018 Казюка Руслан Сергеевич. All rights reserved.
//

import UIKit

class ExplanationController: UIViewController {
    
    private var descriptionGame = "Упражнение основано на популярной умственной математической игре. Дети обычно сидят за столом, первый игрок говорит «1», и каждый следующий игрок подсчитывает. Числа, которые делятся на 3 или 5, заменяются соответствующим словом, в нашем случае «Bip» и «Bop». Если число делится на оба числа, оно становится «Bip Bop». Если игрок совершает ошибку или думает слишком много времени, он исключаются из игры."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupView()
    }
    
    func setupView() {
        self.view.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        textView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        textView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    lazy var textView: UITextView = {
        var text = UITextView()
        text.text = descriptionGame
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
}
