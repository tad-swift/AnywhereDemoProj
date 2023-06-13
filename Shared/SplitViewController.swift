//
//  SplitViewController.swift
//  AnywhereDemoProj
//
//  Created by Tadreik Campbell on 6/13/23.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [MainViewController(), DetailController(title: "Character Detail", cast: nil, url: nil)]
        preferredDisplayMode = .oneBesideSecondary
    }
    

}
