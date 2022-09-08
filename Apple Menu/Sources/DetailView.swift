//
//  SecondViewController.swift
//  Apple Menu
//
//  Created by Илья on 03.09.2022.
//
import SnapKit
import UIKit

class DetailView: UIViewController {
    
    // MARK: - Elements
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "apple")
        return image
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarhy()
        setupLayout()
    }
    
    //MARK: - Setup
    
    private func setupHierarhy() {
        view.addSubview(image)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.left.top.bottom.right.equalTo(view)
        }
    }
}
