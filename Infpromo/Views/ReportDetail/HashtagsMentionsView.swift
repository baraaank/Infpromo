//
//  HashtagsMentionsView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import Foundation
import TagListView


class HashtagsMentionsView: UIView {
    
    private let tagListView: TagListView = {
        let tagView = TagListView()
        tagView.cornerRadius = 4
        tagView.paddingX = 4
        tagView.paddingY = 4
        tagView.textFont = UIFont.systemFont(ofSize: 12)
        tagView.textColor = .white
        tagView.clipsToBounds = true
        tagView.tagBackgroundColor = UIColor().infpromo
        
        return tagView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagListView)
        backgroundColor = .white
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
    
    func deleteComponents() {
        tagListView.removeAllTags()
    }
}




