//
//  Model.swift
//  Apple Menu
//
//  Created by Илья on 07.09.2022.
//

import UIKit
import Foundation

struct Sections {
    let title: String
    let settings: [SettingsCellsType]
}

enum SettingsCellsType {
    case switchCell(model: SettingsSwitchCell)
    case labelCell(model: SettingsCell)
}

struct SettingsSwitchCell {
    let name: String
    let icon: UIImage
    var isTurnOn: Bool
}

struct SettingsCell {
    let name: String
    let icon: UIImage
    let rightLabel: String?
}

extension Sections {
    static func getSections() -> [Sections] {
        return [
            
            // First
            Sections(title: "", settings: [
                .switchCell(model: SettingsSwitchCell(
                    name: "Авиарежим",
                    icon: UIImage(named: "aviamode") ?? UIImage(),
                    isTurnOn: false)),
                .labelCell(model: SettingsCell(
                    name: "Wi-Fi",
                    icon: UIImage(named:"wifi") ?? UIImage(),
                    rightLabel: "Keenetic-3090")),
                .labelCell(model: SettingsCell(
                    name: "Bluetooth",
                    icon: UIImage(named: "bluetooth") ?? UIImage(),
                    rightLabel: "Вкл.")),
                .labelCell(model: SettingsCell(
                    name: "Сотовая связь",
                    icon: UIImage(named: "cellular") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Режим модема",
                    icon: UIImage(named: "modemmode") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "VPN",
                    icon: UIImage(named: "vpn") ?? UIImage(),
                    rightLabel: "Не подключено"))
            ]),
            
            // Second
            Sections(title: "", settings: [
                .labelCell(model: SettingsCell(
                    name: "Уведомления",
                    icon: UIImage(named:"notification") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Звуки, тактильные сигналы",
                    icon: UIImage(named: "sounds") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Фокусирование",
                    icon: UIImage(named:"focusing") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Экранное время",
                    icon: UIImage(named: "screentime") ?? UIImage(),
                    rightLabel: nil))
            ]),
            
            // Third
            Sections(title: "", settings: [
                .labelCell(model: SettingsCell(
                    name: "Основные",
                    icon: UIImage(named:"main") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Пункт управления",
                    icon: UIImage(named: "control") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Экран и яркость",
                    icon: UIImage(named:"screenandbrightness") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Экран Домой",
                    icon: UIImage(named: "home") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Универсальный доступ",
                    icon: UIImage(named:"universal") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Обои",
                    icon: UIImage(named: "wallpaper") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Siri и поиск",
                    icon: UIImage(named:"siri") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Face ID и код-пароль",
                    icon: UIImage(named: "faceid") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Экстренный вызов - SOS",
                    icon: UIImage(named:"universal") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Уведомление о контакте",
                    icon: UIImage(named: "notificationcontact") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Аккумулятор",
                    icon: UIImage(named:"battery") ?? UIImage(),
                    rightLabel: nil)),
                .labelCell(model: SettingsCell(
                    name: "Конфиденциальность",
                    icon: UIImage(named: "privacy") ?? UIImage(),
                    rightLabel: nil))
            ])
        ]
    }
}
