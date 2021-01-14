//
//  STCContainer.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

class STCContainer: UIView {
    
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
        self.layer.cornerRadius = cornerRadius
    }
    
    // MARK: - Helpers
    private func configure() {
        backgroundColor     = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        clipsToBounds       = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
