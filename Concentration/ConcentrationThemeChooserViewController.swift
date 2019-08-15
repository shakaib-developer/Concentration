//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Shakaib Akhtar on 08/08/2019.
//  Copyright © 2019 iParagon. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Sports":"🏀🎾🏐🏏⚽️⚾️🎱🏓🎳🥊🚴‍♀️🏊🏻‍♀️",
        "Animals":"🦓🦒🦔🐁🦕🐊🦗🏇🏻🕊🐃🐄🐅",
        "Faces":"😀😆😂😍😇😘🤪😎😝🙁😡😭"]
    
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
