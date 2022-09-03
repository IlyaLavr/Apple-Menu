//
//  SecondViewController.swift
//  Apple Menu
//
//  Created by Илья on 03.09.2022.
//

import UIKit

class SecondViewController: UIViewController {

    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "apple")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarhy()
        setupLayout()
        view.backgroundColor = .magenta
    }

    
    private func setupHierarhy() {
        view.addSubview(image)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.left.top.bottom.right.equalTo(view)
        }
    }

}
