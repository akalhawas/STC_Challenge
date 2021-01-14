//
//  TableViewCell.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    // MARK: - Properties
    static let identifier = "TableViewCell"
    
    lazy var imageViewTable     = STCImageView(cornerRadius: 60 / 2)
    lazy var name               = STCLabel(textAlignment: .left, fontSize: 16, weight: .bold, color: #colorLiteral(red: 0.5450980392, green: 0.5529411765, blue: 0.631372549, alpha: 1) )
    lazy var party              = STCLabel(textAlignment: .left, fontSize: 12, weight: .light, color: .label)
    lazy var desc        = STCLabel(textAlignment: .left, fontSize: 12, weight: .regular, color: .label)
    
    
//    var review: YelpReviews?{
//        didSet{configure()}
//    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        addSubview(imageViewTable)
        addSubview(name)
        addSubview(party)
        addSubview(desc)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - Helpers
    private func configure(){
        
        imageViewTable.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            imageViewTable.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageViewTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant:12),
            imageViewTable.heightAnchor.constraint(equalToConstant: 60),
            imageViewTable.widthAnchor.constraint(equalTo: imageViewTable.heightAnchor),
            
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: imageViewTable.trailingAnchor, constant:10),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-5),
            
            party.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 2),
            party.leadingAnchor.constraint(equalTo: imageViewTable.trailingAnchor, constant: 10),
            party.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-5),
            
            desc.topAnchor.constraint(equalTo: party.bottomAnchor, constant: 2),
            desc.leadingAnchor.constraint(equalTo: imageViewTable.trailingAnchor, constant: 10),
            desc.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-5),
            
        ])
    }
}
