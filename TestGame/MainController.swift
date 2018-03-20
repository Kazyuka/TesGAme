//
//  MainController.swift
//  TestGame
//
//  Created by Руслан Казюка on 20.03.2018.
//  Copyright © 2018 Казюка Руслан Сергеевич. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    private lazy var homeViewController: HomeController = {
        
        var viewController = HomeController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var explanationViewController: ExplanationController = {
        
        var viewController = ExplanationController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    var explanationBarButtom: UIBarButtonItem?
    var homeBarButtom: UIBarButtonItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        explanationBarButtom = UIBarButtonItem(title: "Explanation", style: .plain, target: self, action: #selector(goToExplanation))
        navigationItem.rightBarButtonItem = explanationBarButtom
        
        homeBarButtom = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHomeController))
        navigationItem.leftBarButtonItem = homeBarButtom
        homeBarButtom?.tag = 1
        homeBarButtom?.isEnabled = false
        updateView()
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
    @objc func goToExplanation() {
        homeBarButtom?.tag = 0
        explanationBarButtom?.isEnabled = false
        homeBarButtom?.isEnabled = true
        updateView()
    }
    
    @objc func goToHomeController() {
        homeBarButtom?.tag = 1
        explanationBarButtom?.isEnabled = true
        homeBarButtom?.isEnabled = false
        updateView()
    }
    
    private func updateView() {
        
        if homeBarButtom?.tag == 1 {
            remove(asChildViewController: explanationViewController)
            add(asChildViewController: homeViewController)
        } else {
            remove(asChildViewController: homeViewController)
            add(asChildViewController: explanationViewController)
        }
    }
}
