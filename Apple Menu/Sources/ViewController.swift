//
//  ViewController.swift
//  Apple Menu
//
//  Created by Илья on 03.09.2022.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    var models: [Sections] = Sections.getSections()
    
    // MARK: - Elements
    
    private let cellIdentifier = "cell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.idetifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.idetifier)
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarhy()
        setupLayout()
    }
    
    //MARK: - Setup
    
    private func setupHierarhy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

    // MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].settings[indexPath.row]
        
        switch model {
            
        case .labelCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.idetifier, for: indexPath) as? TableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            cell.accessoryType = .disclosureIndicator
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.idetifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

    // MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(DetailView(imageView: UIImageView(image: UIImage(named: "apple"))), animated: true)
        case 1:
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(DetailView(imageView: UIImageView(image: UIImage(named: "bin"))), animated: true)
        default:
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(DetailView(imageView: UIImageView(image: UIImage(named: "nature"))), animated: true)
        }
    }
}
