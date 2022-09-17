//
//  MainViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - properties
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var talkView: UIView!
    @IBOutlet weak var myView: UIView!
    
    // homebut
    @IBOutlet weak var homeButImg: UIImageView!
    @IBOutlet weak var homeButLabel: UILabel!
    @IBOutlet weak var homeBut: UIStackView!
    
    // searchbut
    @IBOutlet weak var searchButImg: UIImageView!
    @IBOutlet weak var searchButLabel: UILabel!
    @IBAction func tapSearchBut(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // registbut
    @IBOutlet weak var registButImg: UIImageView!
    @IBOutlet weak var registButLabel: UILabel!
    @IBAction func tapRegistBut(_ sender: Any) {
        let regitsVC = self.storyboard?.instantiateViewController(withIdentifier: "AddNavigationViewController") as! AddNavigationViewController
        regitsVC.modalPresentationStyle = .overCurrentContext
        self.present(regitsVC, animated: true)
    }
    
    // talkbut
    @IBOutlet weak var talkButImg: UIImageView!
    @IBOutlet weak var talkButLabel: UILabel!
    @IBOutlet weak var talkBut: UIStackView!
    
    // mybut
    @IBOutlet weak var myButImg: UIImageView!
    @IBOutlet weak var myButLabel: UILabel!
    @IBOutlet weak var myBut: UIStackView!
    
    
    //MARK: - tab bar
    @IBAction func tabBut(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 1 {
            homeView.alpha = 1
            homeView.isUserInteractionEnabled = true
            homeButImg.isHighlighted = true
            homeButLabel.textColor = .black
            
            talkView.alpha = 0
            talkView.isUserInteractionEnabled = false
            talkButImg.isHighlighted = false
            talkButLabel.textColor = Constant().tabBarIconColor
            myView.alpha = 0
            myView.isUserInteractionEnabled = false
            myButImg.isHighlighted = false
            myButLabel.textColor = Constant().tabBarIconColor
            
            
        }
        else if sender.view?.tag == 2 {
            talkView.alpha = 1
            talkView.isUserInteractionEnabled = true
            talkButImg.isHighlighted = true
            talkButLabel.textColor = .black
            
            homeView.alpha = 0
            homeView.isUserInteractionEnabled = false
            homeButImg.isHighlighted = false
            homeButLabel.textColor = Constant().tabBarIconColor
            myView.alpha = 0
            myView.isUserInteractionEnabled = false
            myButImg.isHighlighted = false
            myButLabel.textColor = Constant().tabBarIconColor
        }
        else if sender.view?.tag == 3 {
            myView.alpha = 1
            myView.isUserInteractionEnabled = true
            myButImg.isHighlighted = true
            myButLabel.textColor = .black
            
            talkView.alpha = 0
            talkView.isUserInteractionEnabled = false
            talkButImg.isHighlighted = false
            talkButLabel.textColor = Constant().tabBarIconColor
            homeView.alpha = 0
            homeView.isUserInteractionEnabled = false
            homeButImg.isHighlighted = false
            homeButLabel.textColor = Constant().tabBarIconColor
        }
    }
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeBut.tag = 1
        talkBut.tag = 2
        myBut.tag = 3
        
        homeView.alpha = 1
        homeView.isUserInteractionEnabled = true
        homeButImg.isHighlighted = true
        homeButLabel.textColor = .black
        
        talkView.alpha = 0
        talkView.isUserInteractionEnabled = false
        talkButImg.tintColor = Constant().tabBarIconColor
        talkButLabel.textColor = Constant().tabBarIconColor
        myView.alpha = 0
        myView.isUserInteractionEnabled = false
        myButImg.tintColor = Constant().tabBarIconColor
        myButLabel.textColor = Constant().tabBarIconColor
        
    }

}
