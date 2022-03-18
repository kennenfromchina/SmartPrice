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
        let originPrice = 388.0
        let priceLabel: UILabel = UILabel().then { label in
            label.frame = CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.size.width, height: view.frame.size.height / 2))
            label.textAlignment = .center
            label.attributedText = price.toDisplayPrice()
        }
        let originPriceLabel: UILabel = UILabel().then { label in
            label.frame = CGRect(origin: CGPoint(x: view.frame.origin.x, y: view.frame.origin.y + priceLabel.frame.size.height), size: CGSize(width: view.frame.size.width, height: view.frame.size.height / 2))
            label.textAlignment = .center
            label.attributedText = originPrice.toOriginPrice()
        }
        view.do { view in
            view.backgroundColor = .white
            view.addSubview(priceLabel)
            view.addSubview(originPriceLabel)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

