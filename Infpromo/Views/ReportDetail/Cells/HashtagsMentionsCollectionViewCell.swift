//
//  HashtagsMentionsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 25.04.2022.
//

import UIKit
import TagListView

class HashtagsMentionsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "hashtagsMentionsCollectionViewCellIdentifier"
    
    
    private let tagListView: TagListView = {
       let tagView = TagListView()
        tagView.cornerRadius = 4
        tagView.paddingX = 4
        tagView.paddingY = 4
        
//        tagView.alignment = .center
        
        tagView.textColor = .red
        tagView.clipsToBounds = true

        return tagView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
        contentView.addSubview(tagListView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tagListView.frame = CGRect(x: 20, y: 20, width: width - 40, height: height - 40)
    }
    
    
    func configureHashtags(with viewModel: [HashtagsViewModel]) {
        tagListView.addTags(viewModel.map({$0.clearHashtag}))
    }
    
    
    func configureMentions(with viewModel: [MentionsViewModel]) {
        tagListView.addTags(viewModel.map({$0.clearMention}))
    }
    
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
////        tagListView.removeAllTags()
//    }
    
    
}
