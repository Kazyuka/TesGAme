//
//  HomeCell.swift
//  TestGame
//
//  Created by Руслан Казюка on 20.03.2018.
//  Copyright © 2018 Казюка Руслан Сергеевич. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var data: DataModel! {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        numberLabel.text = String(data.count)
        wirWarLabel.text = data.text
    }
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var wirWarLabel: UILabel = {
        let label = UILabel()
        label.text = "wir"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        
        self.addSubview(numberLabel)
        self.addSubview(wirWarLabel)
        
        numberLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        numberLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        wirWarLabel.leftAnchor.constraint(equalTo: self.numberLabel.rightAnchor, constant: 5).isActive = true
        wirWarLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        wirWarLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        wirWarLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
}
