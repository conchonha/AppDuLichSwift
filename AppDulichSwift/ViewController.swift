//
//  ViewController.swift
//  AppDulichSwift
//
//  Created by Sang on 16/06/2022.
//ma

import UIKit
import RxSwift

class ViewController: UIViewController {
    let viewmodel = UserViewModel()
    
    @IBOutlet weak var userNameTextFiel: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextFiel.setLeftImage(image: Resource.email.rawValue)
        userNameTextFiel.bgTextFileAuth()
        userNameTextFiel.placeholder = "Input email"
        
        password.setLeftImage(image: Resource.email.rawValue)
        password.bgTextFileAuth(top: 20)
        password.placeholder = "Input email"
        
//        (self.search.rx.text <-> self.viewmodel.searchInput)
    }

}

