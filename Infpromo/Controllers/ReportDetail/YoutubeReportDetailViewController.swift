//
//  YoutubeReportDetailViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 30.04.2022.
//

import UIKit

class YoutubeReportDetailViewController: UIViewController {

    var influencerId = ""
    var platform = ""
    
    let headInfosView = HeadInfosView()
    
    let followersView = UserMetricsView()
    let engagementView = UserMetricsView()
    let engagementRateView = UserMetricsView()
    let viewsView = UserMetricsView()
    let commentView = UserMetricsView()
    
    let firstPostView = LastPostsView()
    let secondPostView = LastPostsView()
    let thirdPostView = LastPostsView()
    let fourthPostView = LastPostsView()
    let fifthPostView = LastPostsView()
    let sixthPostView = LastPostsView()
    let seventhPostView = LastPostsView()
    let eighthPostView = LastPostsView()
    let ninthPostView = LastPostsView()
    let tenthPostView = LastPostsView()
    
    let notableSubcribtionView = PercentsFollowersView()
    let followersGenderDistributionView = FollowersGenderDistributionView()
    let followersLocationView = FollowersLocationView()
    
    
    
    
    
    private let popularPostsLabel: UILabel = {
       let label = UILabel()
        label.text = "Popular Videolar"
        return label
    }()
    
    private let audienceDatasLabel: UILabel = {
       let label = UILabel()
        label.text = "Popular Videolar"
        return label
    }()
    
    
    private let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        addSubviews()
        loadViewElements()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        headInfosView.frame = CGRect(x: 10, y: 20, width: scrollView.width - 20, height: scrollView.width * 0.6)
        
        let oneOfThird = ((view.width - 40) / 3)
        let oneOfTwo = ((view.width - 30) / 2)
        followersView.frame = CGRect(x: 10, y: headInfosView.bottom + 10, width: oneOfThird, height: scrollView.width * 0.6)
        engagementView.frame = CGRect(x: followersView.right + 10, y: headInfosView.bottom + 10, width: oneOfThird, height: scrollView.width * 0.6)
        engagementRateView.frame = CGRect(x: engagementView.right + 10, y: headInfosView.bottom + 10, width: oneOfThird, height: scrollView.width * 0.6)
        viewsView.frame = CGRect(x: 10, y: followersView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        commentView.frame = CGRect(x: viewsView.right + 10, y: followersView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        popularPostsLabel.frame = CGRect(x: 10, y: commentView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        firstPostView.frame = CGRect(x: 10, y: popularPostsLabel.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        secondPostView.frame = CGRect(x: firstPostView.right + 10, y: popularPostsLabel.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        thirdPostView.frame = CGRect(x: 10, y: firstPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        fourthPostView.frame = CGRect(x: thirdPostView.right + 10, y: firstPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        fifthPostView.frame = CGRect(x: 10, y: thirdPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        sixthPostView.frame = CGRect(x: fifthPostView.right + 10, y: thirdPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        seventhPostView.frame = CGRect(x: 10, y: fifthPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        eighthPostView.frame = CGRect(x: seventhPostView.right + 10, y: fifthPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        ninthPostView.frame = CGRect(x: 10, y: seventhPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        tenthPostView.frame = CGRect(x: ninthPostView.right + 10, y: seventhPostView.bottom + 10, width: oneOfTwo, height: scrollView.width * 0.6)
        audienceDatasLabel.frame = CGRect(x: 10, y: tenthPostView.bottom + 10, width: view.width, height: view.width * 0.1)
        notableSubcribtionView.frame = CGRect(x: 10, y: audienceDatasLabel.bottom + 10, width: view.width - 20, height: view.width * 0.6)
        followersGenderDistributionView.frame = CGRect(x: 10, y: notableSubcribtionView.bottom + 10, width: view.width - 20, height: view.width * 0.6)
        followersLocationView.frame = CGRect(x: 10, y: followersGenderDistributionView.bottom + 10, width: view.width - 20, height: view.width * 1.2)
        scrollView.contentSize = CGSize(width: view.width, height: 3600)
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(headInfosView)
        scrollView.addSubview(followersView)
        scrollView.addSubview(engagementView)
        scrollView.addSubview(engagementRateView)
        scrollView.addSubview(viewsView)
        scrollView.addSubview(commentView)
        scrollView.addSubview(popularPostsLabel)
        scrollView.addSubview(firstPostView)
        scrollView.addSubview(secondPostView)
        scrollView.addSubview(thirdPostView)
        scrollView.addSubview(fourthPostView)
        scrollView.addSubview(fifthPostView)
        scrollView.addSubview(sixthPostView)
        scrollView.addSubview(seventhPostView)
        scrollView.addSubview(eighthPostView)
        scrollView.addSubview(ninthPostView)
        scrollView.addSubview(tenthPostView)
        scrollView.addSubview(audienceDatasLabel)
        scrollView.addSubview(notableSubcribtionView)
        scrollView.addSubview(followersGenderDistributionView)
        scrollView.addSubview(followersLocationView)
        
    }
    
    func loadViewElements() {
        APICaller.shared.getInfluencerReport(platform: platform, influencerId: influencerId) { result in
            switch result {
            case .failure(let error):
                print("load youtube report error: \(error)")
            case .success(let model):
                let profile = model.data.pdfBody.data.profile
                
                
            
            }
        }
    }

}
