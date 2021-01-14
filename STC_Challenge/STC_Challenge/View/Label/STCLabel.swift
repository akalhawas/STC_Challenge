//
//  STCLabel.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

class STCLabel: UILabel {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor ) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        textColor          = color
        self.font          = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    // MARK: - Helpers
    private func configure() {
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
