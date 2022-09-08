//
//  TableViewCell.swift
//  Apple Menu
//
//  Created by Илья on 03.09.2022.
//

import SnapKit
import UIKit

class TableViewCell: UITableViewCell {
    
    static let idetifier = "TableViewCell"
    
    //MARK: - Elements
    
    let photoSettings: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 1
        return imageView
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    let rightText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: TableViewCell.idetifier)
        setupHierarhy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - Setup
    
    private func setupHierarhy() {
        addSubview(photoSettings)
        addSubview(name)
        addSubview(rightText)
    }
    
    private func setupLayout() {
        
        photoSettings.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(7)
            make.left.equalTo(contentView).offset(10)
            make.width.equalTo(35)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(12)
            make.centerX.equalTo(contentView)
            make.left.equalTo(photoSettings.snp.right).offset(15)
        }
        
        rightText.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(snp.right).offset(-40)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        photoSettings.image = nil
        rightText.text = nil
    }
    
    func configure(with model: SettingsCell) {
        name.text = model.name
        photoSettings.image = model.icon
        rightText.text = model.rightLabel
    }
}
