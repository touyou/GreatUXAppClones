//
//  LibraryViewController.swift
//  MusicAppClone
//
//  Created by 藤井陽介 on 2017/09/16.
//  Copyright © 2017年 藤井陽介. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    internal enum LibraryItem: Int {
        
        case playlist, artist, album, song, video, genre, compilation, composer, downloaded, added
        
        var isAvailable: Bool {
            
            switch self {
            case .playlist:
                return true
            case .artist:
                return true
            case .album:
                return true
            case .song:
                return true
            case .video:
                return true
            case .genre:
                return true
            case .compilation:
                return true
            case .composer:
                return true
            case .downloaded:
                return true
            case .added:
                return true
            }
        }
        
        var title: String {
            
            switch self {
            case .playlist:
                return "プレイリスト"
            case .artist:
                return "アーティスト"
            case .album:
                return "アルバム"
            case .song:
                return "曲"
            case .video:
                return "ビデオ"
            case .genre:
                return "ジャンル"
            case .compilation:
                return "コンピレーション"
            case .composer:
                return "作曲者"
            case .downloaded:
                return "ダウンロード済み"
            case .added:
                return "最近追加した項目"
            }
        }
    }
    let completeItems: [LibraryItem] = [.playlist, .artist, .album, .song, .video, .genre, .compilation, .composer, .downloaded]
    var libraryItems: [LibraryItem] = [.playlist, .artist, .album, .song, .video, .genre, .compilation, .composer, .downloaded]
    
    var libraryCount: Int {
        
        get {
            
            return libraryItems.filter({ $0.isAvailable }).count
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - TableView

extension LibraryViewController: UITableViewDelegate {
    
}

extension LibraryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return libraryCount + (LibraryItem.added.isAvailable ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < libraryCount {
            
            let cell = UITableViewCell()
            cell.textLabel?.text = libraryItems.filter({ $0.isAvailable })[indexPath.row].title
            cell.textLabel?.textColor = UIColor.MusicApp.magenta
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
}

// MARK: - Storyboard Instantiable

extension LibraryViewController: StoryboardInstantiable {}
