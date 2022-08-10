//
//  UserBioViewController.swift
//  LoginApp
//
//  Created by Ariel Golan on 10.08.2022.
//

import UIKit

class UserBioViewController: UIViewController {
    
    @IBOutlet var userBioTextView: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        userBioTextView.backgroundColor = .clear
        userBioTextView.textColor = .white
        title = "\(user.person.fullName) Bio"
        userBioTextView.text = user.person.bio
    }
}
