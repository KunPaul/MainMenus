
import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
 

    private let tableView: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier:SettingTableViewCell.identifier)
        table.register(SwitchTableView.self, forCellReuseIdentifier: SwitchTableView.identifier)
        
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        title = "Настройки"
        configure()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        models.append(Section(title: "", options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(named:"airplane") ,iconBackgroundColor: .systemOrange,handler: {
                print("Нажали на Авиарежим")
            },isOn: true)),
        
                .staticCell(model:SettingsOption(title: "Wi-Fi", icon: UIImage(named:"wifi") ?? UIImage(),iconBackgroundColor: .systemBlue, righttext: "Не подключено") {

            }),
            .staticCell(model:SettingsOption(title: "Bluetooth", icon: UIImage(named:"bluetooth") ?? UIImage(),iconBackgroundColor: .systemBlue, righttext: "Вкл.") {
                print("Нажали на Bluetooth")

            }),
            .staticCell(model:SettingsOption(title: "Cотовая связь", icon: UIImage(named:"antenna") ?? UIImage(),iconBackgroundColor: .systemGreen, righttext: " ") {
                print("Нажали на Cотовая связь")

            }),
            .staticCell(model:SettingsOption(title: "Режим модема", icon: UIImage(named:"personalhotspot") ?? UIImage(),iconBackgroundColor: .systemGreen, righttext: "") {
                print("Нажали на Режим модема")

            }),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(named:"vpn") ,iconBackgroundColor: .systemBlue,handler: {
                print("Нажали на VPN")
            },isOn: true)),
        ]))
        models.append(Section(title: "", options: [
            .staticCell(model:SettingsOption(title: "Уведомления", icon: UIImage(named:"exclamation") ?? UIImage(),iconBackgroundColor: .systemRed, righttext: " ") {
                print("Нажали на Уведомления")

            }),
            .staticCell(model:SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(named:"speaker") ?? UIImage(),iconBackgroundColor: .systemPink, righttext: "") {
                print("Нажали на Звуки, тактильные сигналы")

            }),
            .staticCell(model:SettingsOption(title: "Не беспокоить", icon: UIImage(named:"moon") ?? UIImage(),iconBackgroundColor: .systemIndigo, righttext: "") {
                print("Нажали на Не беспокоить")

            }),
            .staticCell(model:SettingsOption(title: "Экранное время", icon: UIImage(named:"hourglass") ?? UIImage(),iconBackgroundColor: .systemIndigo, righttext: "") {
                print("Нажали на Экранное время")

            })
        ]))
        models.append(Section(title: "", options: [
            .staticCell(model:SettingsOption(title: "Основные", icon: UIImage(named:"settings") ?? UIImage(),iconBackgroundColor: .systemGray, righttext: "Уведомление") {
                print("Нажали на Основные")

            }),
            .staticCell(model:SettingsOption(title: "Пункт управления", icon: UIImage(named:"switch") ?? UIImage(),iconBackgroundColor: .systemGray, righttext: "") {
                print("Нажали на Пункт управления")

            }),
            .staticCell(model:SettingsOption(title: "Экран и яркость", icon: UIImage(named:"brightness") ?? UIImage(),iconBackgroundColor: .systemBlue, righttext: "") {
                print("Нажали на Экран и яркость")

            }),
            .staticCell(model:SettingsOption(title: "Экран «Домой»", icon: UIImage(named:"house") ?? UIImage(),iconBackgroundColor: .systemBlue, righttext: "") {
                print("Нажали на Экран «Домой»")

            }),
            .staticCell(model:SettingsOption(title: "Универсальный доступ", icon: UIImage(named:"i.circle") ?? UIImage(),iconBackgroundColor: .systemBlue, righttext: "") {
                print("Нажали на Универсальный доступ")
            }),
        ]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell( withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell( withIdentifier: SwitchTableView.identifier, for: indexPath) as? SwitchTableView else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}

    
    
   // private var data = ["Авиарежим","Wi-fi","Bluetooth","Сотовая связь","Режим модема","VPN","Уведомления","Звуки тактильные сигналы","Не беспокоить","Экранное время","Основные","Пункт упралвения","Экран и яркость","Экран домой", "Универсальный доступ", ]
    

