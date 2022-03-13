//
//  ViewController.swift
//  SmartPrice
//
//  Created by kennenfromchina on 03/12/2022.
//  Copyright (c) 2022 kennenfromchina. All rights reserved.
//

import UIKit
import SmartPrice
import Then

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let price = 1000000000000.324
        let label: UILabel = UILabel().then { label in
            label.frame = view.frame
            label.textAlignment = .center
            label.attributedText = price.toDisplayPrice()
        }
        view.do { view in
            view.backgroundColor = .white
            view.addSubview(label)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

