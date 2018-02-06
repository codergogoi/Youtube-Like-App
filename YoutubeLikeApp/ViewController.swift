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
    
    var topToolBarView : UIView = {
       
        let topView = CustomToolBarView()
        topView.translatesAutoresizingMaskIntoConstraints = false
         return topView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
 
        let titleView = UILabel(frame: CGRect(x: 40, y: 0, width: self.view.frame.size.width - 40, height: 40))
        titleView.text = "Home"
        titleView.textColor = UIColor.white
        titleView.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = titleView
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.register(HomeCellView.self, forCellWithReuseIdentifier: homeIdentifier)
        collectionView?.alwaysBounceVertical = true
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupCustomToolbar()
        
    }
    
    func setupCustomToolbar(){
        
        self.view.addSubview(topToolBarView)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": topToolBarView]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": topToolBarView]))
        
        
        
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
        
        return CGSize(width: self.view.frame.width, height: 280)
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
        imgView.image = #imageLiteral(resourceName: "mock")
        
        return imgView
 
    }()
    
    var profileImg : UIImageView = {
        
        let imgView = UIImageView()
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = UIColor.cyan
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 20
        imgView.image = #imageLiteral(resourceName: "profile")
       
        return imgView
    }()
    
    var titleLabal : UILabel = {
       
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.darkGray
        lbl.text = "WWDC 2017 Event"
        
        return lbl
        
    }()
    
    var detailsLable : UILabel = {
       
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = UIColor.lightGray
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

