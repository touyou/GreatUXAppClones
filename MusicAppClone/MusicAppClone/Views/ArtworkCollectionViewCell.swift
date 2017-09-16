//
//  ArtworkCollectionViewCell.swift
//  MusicAppClone
//
//  Created by 藤井陽介 on 2017/09/16.
//  Copyright © 2017年 藤井陽介. All rights reserved.
//

import UIKit

class ArtworkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ArtworkCollectionViewCell: Reusable, NibLoadable {}
