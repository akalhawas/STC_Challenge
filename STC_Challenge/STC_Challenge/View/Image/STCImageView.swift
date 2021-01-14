//
//  STCImage.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

class STCImageView: UIImageView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(cornerRadius: CGFloat) {
        self.init(frame: .zero)
        self.layer.cornerRadius  = cornerRadius
    }
    
    // MARK: - Helpers
    private func configure() {
        contentMode         = .scaleAspectFill
        layer.borderColor   = UIColor(white: 0.4, alpha: 0.7).cgColor
        layer.borderWidth   = 2
        layer.cornerRadius  = 80 / 2
        clipsToBounds       = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
