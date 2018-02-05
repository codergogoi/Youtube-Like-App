//
//  ViewController.swift
//  YoutubeLikeApp
//
//  Created by MAC01 on 05/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {

    private var homeIdentifier = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        navigationItem.title = "Home"
        collectionView?.register(HomeCellView.self, forCellWithReuseIdentifier: homeIdentifier)
        collectionView?.alwaysBounceVertical = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: homeIdentifier, for: indexPath) as! HomeCellView
        
        return cell
        
    }
    

}

extension HomeController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}


class HomeCellView : UICollectionViewCell{
 
    var thumbnailImg: UIImageView = {
        
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = UIColor.lightGray
        
        return imgView
 
    }()
    
    var profileImg : UIImageView = {
        
        let imgView = UIImageView()
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = UIColor.cyan
       
        return imgView
    }()
    
    var titleLabal : UILabel = {
       
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.backgroundColor = UIColor.blue
        lbl.text = "Title will be display here"
        
        return lbl
        
    }()
    
    var detailsLable : UILabel = {
       
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.backgroundColor = UIColor.red
        lbl.text = "Description will display here"
        return lbl
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    
 
    func setupSubViews(){
        
        addSubview(thumbnailImg)
        addSubview(profileImg)
        addSubview(titleLabal)
        addSubview(detailsLable)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0(40)]-14-[v2]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImg,"v2": titleLabal]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailsLable]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(200)]-[v1(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImg, "v1": profileImg]))
       
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleLabal]))
        
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailsLable]))
        
        
        addConstraint(NSLayoutConstraint.init(item: self.titleLabal, attribute: .top, relatedBy: .equal, toItem: self.profileImg, attribute: .top, multiplier: 1, constant: 0))
        
        
        addConstraint(NSLayoutConstraint.init(item: self.detailsLable, attribute: .top, relatedBy: .equal, toItem: self.profileImg, attribute: .top, multiplier: 1, constant: 20))
        
        addConstraint(NSLayoutConstraint.init(item: self.detailsLable, attribute: .left, relatedBy: .equal, toItem: self.titleLabal, attribute: .left, multiplier: 1, constant: 0))
 
        
        
        
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
}

