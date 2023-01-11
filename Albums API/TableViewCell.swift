//
//  TableViewCell.swift
//  Albums API
//
//  Created by shoeb on 11/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var idLBL : UILabel!
    var titleLBL : UILabel!
    
    static let identifier = "TableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemMint
        
        idLBL = UILabel()
        idLBL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(idLBL)
        NSLayoutConstraint.activate([
            idLBL.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            idLBL.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        titleLBL = UILabel()
        titleLBL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLBL)
        NSLayoutConstraint.activate([
            titleLBL.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLBL.topAnchor.constraint(equalTo: idLBL.bottomAnchor),
            titleLBL.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
