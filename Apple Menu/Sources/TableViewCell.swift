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
    
    let photoUser: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        return image
    }()
    
    let nameUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        return label
    }()
    
    let systemInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        return label
    }()
    
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
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 1
        return stack
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск"
        return searchBar
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
        stack.addArrangedSubview(nameUser)
        stack.addArrangedSubview(systemInfo)
        addSubview(rightText)
        addSubview(photoUser)
        addSubview(stack)
    }
    
    private func setupLayout() {
        photoUser.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(contentView).offset(20)
            make.width.height.equalTo(70)
            
        }
        
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
        
        stack.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(25)
            make.left.equalTo(photoUser.snp.right).offset(20)
            
        }
        
        rightText.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(snp.right).offset(-40)
        }
    }
}
