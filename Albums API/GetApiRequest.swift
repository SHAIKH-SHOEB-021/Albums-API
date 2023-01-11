//
//  GetApiRequest.swift
//  Albums API
//
//  Created by shoeb on 11/01/23.
//

import UIKit

protocol GetApiRequestDelegate : NSObjectProtocol{
    func didReceivedAlbumData(AlbumData : [AlbumsModel])
    func didReceivedError()
}
class GetApiRequest: NSObject, URLSessionDownloadDelegate, URLSessionDelegate {
    
    weak var delegate : GetApiRequestDelegate?
    var webData : Data?
    var session : URLSession{
        let defualtConfig = URLSessionConfiguration.default
        defualtConfig.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        return URLSession(configuration: defualtConfig, delegate: self, delegateQueue: nil)
    }
    
    func getDatas(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")
        let task = session.downloadTask(with: url!)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        do{
            webData = try Data(contentsOf: location)
            let data = try JSONSerialization.jsonObject(with: webData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String : Any]]
            var AlbumData : [AlbumsModel] = []
            for i in 0..<data.count{
                let album = AlbumsModel(ditionary: data[i])
                AlbumData.append(album)
            }
            DispatchQueue.main.async {
                self.delegate?.didReceivedAlbumData(AlbumData: AlbumData)
            }
            
        }catch{
            delegate?.didReceivedError()
        }
        
    }
}
