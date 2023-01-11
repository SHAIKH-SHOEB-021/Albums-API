//
//  TableViewCell.swift
//  Albums API
//
//  Created by shoeb on 11/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var userId : UILabel!
    var idLBL : UILabel!
    var titleLBL : UILabel!
    
    static let identifier = "TableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemMint
        
        userId = UILabel()
        userId.translatesAutoresizingMaskIntoConstraints = false
        userId.textColor = .systemBlue
        contentView.addSubview(userId)
        NSLayoutConstraint.activate([
            userId.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0),
            userId.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        idLBL = UILabel()
        idLBL.translatesAutoresizingMaskIntoConstraints = false
        idLBL.textColor = .systemRed
        contentView.addSubview(idLBL)
        NSLayoutConstraint.activate([
            idLBL.leadingAnchor.constraint(equalTo: userId.trailingAnchor),
            idLBL.topAnchor.constraint(equalTo: contentView.topAnchor),
            idLBL.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
        titleLBL = UILabel()
        titleLBL.translatesAutoresizingMaskIntoConstraints = false
        titleLBL.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(titleLBL)
        NSLayoutConstraint.activate([
            titleLBL.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0),
            titleLBL.topAnchor.constraint(equalTo: userId.bottomAnchor),
            titleLBL.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
