//
//  ViewController.swift
//  Albums API
//
//  Created by shoeb on 10/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetApiRequestDelegate {
    
    var tableViewUI : UITableView!
    var AlbumData : [AlbumsModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parse = GetApiRequest()
        parse.getDatas()
        parse.delegate = self
        
    }
    func mainViewUI(){
        tableViewUI = UITableView()
        tableViewUI.translatesAutoresizingMaskIntoConstraints = false
        tableViewUI.delegate = self
        tableViewUI.dataSource = self
        tableViewUI.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        view.addSubview(tableViewUI)
        NSLayoutConstraint.activate([
            tableViewUI.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewUI.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlbumData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let album = AlbumData[indexPath.row]
        tableViewCell.userId.text = "\(album.userId!)"
        tableViewCell.idLBL.text = "\(album.id!)"
        tableViewCell.titleLBL.text = "\(album.title!)"
        return tableViewCell
    }
    func didReceivedAlbumData(AlbumData: [AlbumsModel]) {
        self.AlbumData = AlbumData
        mainViewUI()
    }
    func didReceivedError() {
        print("Error")
    }
}

