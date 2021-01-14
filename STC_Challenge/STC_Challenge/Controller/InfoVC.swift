//
//  InfoVC.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

class InfoVC: UIViewController {
    // MARK: - Properties
    private var senator: Objects?
    private lazy var containerInfo  = STCContainer(cornerRadius: 18)
    private lazy var imageView      = STCImageView(cornerRadius: 100 / 2)
    private lazy var name           = STCLabel(textAlignment: .left, fontSize: 28, weight: .bold, color: .label )
    private lazy var link           = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: .gray )
    
    private lazy var role           = STCLabel(textAlignment: .center, fontSize: 12, weight: .regular, color: .gray )
    private lazy var team           = STCLabel(textAlignment: .center, fontSize: 12, weight: .regular, color: .gray )
    private lazy var admin          = STCLabel(textAlignment: .center, fontSize: 12, weight: .regular, color: .gray )
    private lazy var product        = STCLabel(textAlignment: .center, fontSize: 12, weight: .regular, color: .gray )
    
    private lazy var address        = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: #colorLiteral(red: 0.5450980392, green: 0.5529411765, blue: 0.631372549, alpha: 1) )
    private lazy var addressText    = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: .label )
    private lazy var zipcode        = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: #colorLiteral(red: 0.5450980392, green: 0.5529411765, blue: 0.631372549, alpha: 1) )
    private lazy var zipcodeText    = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: .label )
    private lazy var city           = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: #colorLiteral(red: 0.5450980392, green: 0.5529411765, blue: 0.631372549, alpha: 1) )
    private lazy var cityText       = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: .label )
    private lazy var country        = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: #colorLiteral(red: 0.5450980392, green: 0.5529411765, blue: 0.631372549, alpha: 1) )
    private lazy var countryText    = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: .label )
    
    
    private var line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        line.widthAnchor.constraint(equalToConstant: 0.2).isActive = true
        line.heightAnchor.constraint(equalToConstant: 5).isActive = true
        line.translatesAutoresizingMaskIntoConstraints = false
       return line
    }()
    
    // MARK: - Initialization
    init(senator: Objects) {
        self.senator = senator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage    = UIImage()
        self.navigationController?.navigationBar.isTranslucent  = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage    = nil
        self.navigationController?.navigationBar.isTranslucent  = false
    }
    
    // MARK: - Helpers
    func configure(){
        view.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9921568627, alpha: 1)
        
        view.addSubview(containerInfo)
        NSLayoutConstraint.activate([
            containerInfo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            containerInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            containerInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            containerInfo.heightAnchor.constraint(equalToConstant: 350),
        ])
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: containerInfo.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: containerInfo.topAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
        ])
        
        view.addSubview(name)
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: containerInfo.centerXAnchor),
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
        ])
        
        view.addSubview(link)
        NSLayoutConstraint.activate([
            link.centerXAnchor.constraint(equalTo: containerInfo.centerXAnchor),
            link.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
        ])
        
        
        let leftStack = UIStackView(arrangedSubviews: [role, admin])
        leftStack.axis = .vertical
        leftStack.distribution = .fill
        
        let rightStack = UIStackView(arrangedSubviews: [team, product])
        rightStack.axis = .vertical
        rightStack.distribution = .fillEqually
        
        let infoStack = UIStackView(arrangedSubviews: [leftStack, UIView(), rightStack])
        infoStack.axis = .horizontal
        infoStack.distribution = .equalSpacing
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.centerXAnchor.constraint(equalTo: containerInfo.centerXAnchor),
            infoStack.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 10),
            infoStack.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        let message = UIImageView(image: #imageLiteral(resourceName: "message"))
        let chat = UIImageView(image: #imageLiteral(resourceName: "chat"))
        let call = UIImageView(image: #imageLiteral(resourceName: "phone"))
        
        let bottomStack = UIStackView(arrangedSubviews: [message,chat,call])
        bottomStack.axis = .horizontal
        bottomStack.distribution = .fillEqually
        bottomStack.spacing = 20
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomStack)
        NSLayoutConstraint.activate([
            bottomStack.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 80),
            bottomStack.heightAnchor.constraint(equalToConstant: 60),
            bottomStack.leadingAnchor.constraint(equalTo: containerInfo.leadingAnchor, constant: 30),
            bottomStack.trailingAnchor.constraint(equalTo: containerInfo.trailingAnchor, constant: -30),
        ])
        
        
        let firstStack = UIStackView(arrangedSubviews: [address, addressText])
        firstStack.axis = .vertical
        firstStack.distribution = .fillEqually
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(firstStack)
        NSLayoutConstraint.activate([
            firstStack.topAnchor.constraint(equalTo: containerInfo.bottomAnchor, constant: 20),
            firstStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        
        let secondStack = UIStackView(arrangedSubviews: [zipcode, zipcodeText])
        secondStack.axis = .vertical
        secondStack.distribution = .fillEqually
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondStack)
        NSLayoutConstraint.activate([
            secondStack.topAnchor.constraint(equalTo: firstStack.bottomAnchor, constant: 20),
            secondStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        
        let thirdStack = UIStackView(arrangedSubviews: [city, cityText])
        thirdStack.axis = .vertical
        thirdStack.distribution = .fillEqually
        thirdStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(thirdStack)
        NSLayoutConstraint.activate([
            thirdStack.topAnchor.constraint(equalTo: secondStack.bottomAnchor, constant: 20),
            thirdStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])

        let fourthStack = UIStackView(arrangedSubviews: [country, countryText])
        fourthStack.axis = .vertical
        fourthStack.distribution = .fillEqually
        fourthStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(fourthStack)
        NSLayoutConstraint.activate([
            fourthStack.topAnchor.constraint(equalTo: thirdStack.bottomAnchor, constant: 20),
            fourthStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
    }
    
    func configureInfo(){
        guard let sen = senator else { return }
        
        if sen.party == "Republican" {
            imageView.image = #imageLiteral(resourceName: "logo1")
        } else {
            imageView.image = #imageLiteral(resourceName: "logo2")
        }

        name.text = sen.person.firstname + " " + sen.person.lastname
        link.text = sen.person.link
        
        role.text = "Bio Guide Id"
        admin.text = sen.person.bioguideid
        
        team.text = "Team"
        product.text = sen.party
        
        
        address.text = "Address"
        addressText.text = sen.extra.address
        
        zipcode.text = "Zip code"
        zipcodeText.text = "Zip code"
        
        city.text = "City"
        cityText.text = "City"
        
        country.text = "Country"
        countryText.text = "Country"
    }
}
