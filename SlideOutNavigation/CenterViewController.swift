//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController, SidePanelViewControllerDelegate {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var creatorLabel: UILabel!
    
    var delegate: CenterViewControllerDelegate?

    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
        if let d = delegate {
            d.toggleLeftPanel?()
        }
    }
    
    @IBAction func puppiesTapped(sender: AnyObject) {
        if let d = delegate {
            d.toggleRightPanel?()
        }
    }
    
    func animalSelected(animal: Animal) {
        imageView.image = animal.image
        titleLabel.text = animal.title
        creatorLabel.text = animal.creator
        
        if let d = delegate {
            d.collapseSidePanels!()
        }
    }
}