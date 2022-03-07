//
//  PastReportViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

class PastReportViewController: UIViewController {
    
   
    
    private var expendableCell: PastReportCollectionViewCell?
    private var isStatusBarHidden = false
    private var hiddenCells: [PastReportCollectionViewCell] = []
    
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
 
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            

            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.26))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            
            return section
        }))
        
        collectionView.register(PastReportCollectionViewCell.self, forCellWithReuseIdentifier: PastReportCollectionViewCell.reuseIdentifier)


        
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Reports"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        addSubviews()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    
    func addSubviews() {
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    
}

//UICollectionView
extension PastReportViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PastReportCollectionViewCell.reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor().infpromoBorder.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let dampingRatio: CGFloat = 0.8
        let initialVelocity = CGVector.zero
        let springParameters = UISpringTimingParameters(dampingRatio: dampingRatio, initialVelocity: initialVelocity)
        let animator = UIViewPropertyAnimator(duration: 0.8, timingParameters: springParameters)
        
        

        self.view.isUserInteractionEnabled = false
        
        if let selectedCell = expendableCell {
            
            isStatusBarHidden = false
            animator.addAnimations {
                
                selectedCell.collapse()
                
                selectedCell.changeLayoutLabels()
                
                
                for cell in self.hiddenCells {
                    cell.show()
                }
                
            }
            
            animator.addCompletion { _ in
                collectionView.isScrollEnabled = true
                self.expendableCell = nil
                self.hiddenCells.removeAll()

            }

            
        } else {
            isStatusBarHidden = true
            
            collectionView.isScrollEnabled = false
            
            let selectedCell = collectionView.cellForItem(at: indexPath)! as! PastReportCollectionViewCell
            let frameOfSelectedCell = selectedCell.frame
            
            expendableCell = selectedCell
            hiddenCells = collectionView.visibleCells.map({
                $0 as! PastReportCollectionViewCell
                
            }).filter({
                $0 != selectedCell
            })
            
            
            animator.addAnimations {
                selectedCell.expand(in: collectionView)
                
                
                for cell in self.hiddenCells {
                    cell.hide(in: collectionView, frameOfSelectedCell: frameOfSelectedCell)
                }
            }
        }
        
        animator.addAnimations {
            self.setNeedsStatusBarAppearanceUpdate()
        }
        
        animator.addCompletion { _ in
            self.view.isUserInteractionEnabled = true
        }
        
        animator.startAnimation()
        
//        setNeedsStatusBarAppearanceUpdate()

    }
    
    
    
    
}

