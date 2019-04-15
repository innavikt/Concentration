//
//  ThemeChooserViewController.swift
//  Concentration
//
//  Created by inna on 12/04/2019.
//  Copyright © 2019 inna. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports" :  "🏄🏻‍♀️🤽🏻‍♀️🚴🏻‍♀️🏊🏻‍♀️🏋🏻‍♂️🏇🏻⛷🏸🏎🏌🏻‍♂️",
        "Animals" : "🦔🐄🐖🐴🐢🐕🐘🐍🦀🐇",
        "Faces" :   "😐😬🙄😳🤯🤑🤠😷😱😣",
        ]
    
    
    @IBAction func chooseTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Coose Theme", sender: sender)
        }
    }
    
    var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    var lastSeguedToConcentrationViewController: ConcentrationViewController? //strong pointer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                
                }
            }
        }
    }


}
