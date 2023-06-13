//
//  File.swift
//  
//
//  Created by Tadreik Campbell on 6/13/23.
//

import UIKit

public class ResultCell: UITableViewCell {
    
    public static let reuseID = "result_cell"
    
    public var titleLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 1
        v.lineBreakMode = .byTruncatingTail
        return v
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {
        contentView.addSubviews(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    public override func prepareForReuse() {
        titleLabel.text = ""
        super.prepareForReuse()
    }
    
}
