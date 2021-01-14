//
//  ListVC.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

class ListVC: UIViewController {
    // MARK: - Properties
    private let tableView               = UITableView(frame: .zero, style: .plain)
    private var data: Data?
    private var senator: Response?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getData()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Helpers
    func configureUI(){
        view.addSubview(tableView)
        
        tableView.rowHeight         = 80
        tableView.separatorStyle    = .none
        tableView.dataSource        = self
        tableView.delegate          = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getData(){
        data = Json.readLocalFile(forName: "data")
        parse(jsonData: data!)
        print(data!)
    }
    
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Response.self, from: jsonData)
            senator = decodedData
            //print("Title: ", decodedData.objects.first)
        } catch {
            print("decode error")
        }
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sen = senator?.objects.count else { return 0 }
        return sen
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as! TableViewCell
        
        guard let sen = senator?.objects else { return cell }

        let backgroundView                  = UIView()
        backgroundView.layer.cornerRadius   = 20
        backgroundView.backgroundColor      = UIColor.systemGray.withAlphaComponent(0.2)
        cell.selectedBackgroundView         = backgroundView
        
        
        if sen[indexPath.row].party == "Republican" {
            cell.imageViewTable.image = #imageLiteral(resourceName: "logo1")
        } else {
            cell.imageViewTable.image = #imageLiteral(resourceName: "logo2")
        }

        cell.name.text            = sen[indexPath.row].person.firstname + " " + sen[indexPath.row].person.lastname
        cell.party.text           = sen[indexPath.row].party
        cell.desc.text            = sen[indexPath.row].description

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sen = senator?.objects else { return }
        let select      = sen[indexPath.row]
        let infoVC      = InfoVC(senator: select)
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
}
