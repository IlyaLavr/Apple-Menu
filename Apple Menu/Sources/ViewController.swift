//
//  ViewController.swift
//  Apple Menu
//
//  Created by Илья on 03.09.2022.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Elements
    
    private let cellIdentifier = "cell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.idetifier)
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск"
        return searchBar
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

// MARK: - Extensions

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Настройки"
        default:
            return ""
        }
    }
    
    //MARK: - Functions
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = .white
        header?.textLabel?.font = UIFont(name: "AlNile-Bold", size: 30)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 6
        case 3: return 4
        default: return 8
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.idetifier, for: indexPath) as! TableViewCell
        
        switch indexPath.section {
        case 0:
            cell.addSubview(searchBar)
            searchBar.snp.makeConstraints { make in
                make.top.left.right.bottom.equalTo(cell)
                
            }
            return cell
        case 1:
            cell.photoUser.image = UIImage(named: "user")
            cell.nameUser.text = "Илья Лавринов"
            cell.systemInfo.text = "Apple ID, iCloud, контент и покупки"
            cell.accessoryType = .disclosureIndicator
        case 2:
            switch indexPath.row {
            case 0:
                cell.photoSettings.image = UIImage(named: "aviamode")
                cell.name.text = "Авиарежим"
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
                cell.accessoryView = switchView
            case 1:
                cell.photoSettings.image = UIImage(named: "wifi")
                cell.name.text = "Wi-Fi"
                cell.rightText.text = "Выкл."
                cell.accessoryType = .disclosureIndicator
            case 2:
                cell.photoSettings.image = UIImage(named: "bluetooth")
                cell.name.text = "Bluetooth"
                cell.accessoryType = .disclosureIndicator
                cell.rightText.text = "Вкл."
            case 3:
                cell.photoSettings.image = UIImage(named: "cellular")
                cell.name.text = "Сотовая связь"
                cell.accessoryType = .disclosureIndicator
            case 4:
                cell.photoSettings.image = UIImage(named: "modemmode")
                cell.name.text = "Режим модема"
                cell.accessoryType = .disclosureIndicator
            case 5:
                cell.photoSettings.image = UIImage(named: "vpn")
                cell.name.text = "VPN"
                cell.rightText.text = "Не подключено"
                cell.accessoryType = .disclosureIndicator
            default:
                return cell
            }
        case 3:
            switch indexPath.row {
            case 0:
                cell.photoSettings.image = UIImage(named: "notification")
                cell.name.text = "Уведомления"
                cell.accessoryType = .disclosureIndicator
            case 1:
                cell.photoSettings.image = UIImage(named: "sounds")
                cell.name.text = "Звуки, тактильные сигналы"
                cell.accessoryType = .disclosureIndicator
            case 2:
                cell.photoSettings.image = UIImage(named: "focusing")
                cell.name.text = "Фокусирование"
                cell.accessoryType = .disclosureIndicator
            case 3:
                cell.photoSettings.image = UIImage(named: "screentime")
                cell.name.text = "Экранное время"
                cell.accessoryType = .disclosureIndicator
            default:
                return cell
            }
        default:
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0 {
            return 100
        } else {
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(DetailViewSecond(), animated: true)
        default:
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(DetailView(), animated: true)
        }
    }
}
