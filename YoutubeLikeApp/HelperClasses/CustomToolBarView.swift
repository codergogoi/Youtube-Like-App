//
//  CustomToolBarView.swift
//  YoutubeLikeApp
//
//  Created by MAC01 on 06/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class CustomToolBarView: UIView {
    
    var iconNameArray  = ["home", "trends", "videos","account"]

    private let identifier = "customToolbarCell"
    
    lazy var buttonCollectionView : UICollectionView = {
      
        let layout = UICollectionViewFlowLayout()

        let collView =  UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor =  UIColor(red: 227/255, green: 37/255, blue: 36/255, alpha: 1)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.delegate  = self
        collView.dataSource = self
        collView.register(ButtonCell.self, forCellWithReuseIdentifier: identifier)
        return collView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView(){
        
        addSubview(buttonCollectionView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": buttonCollectionView]))
        
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": buttonCollectionView]))
        
    }
    
}

extension CustomToolBarView : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ButtonCell
        
        cell.iconImg.image = UIImage(named: self.iconNameArray[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Int(self.frame.size.width/4), height: Int(self.frame.size.height))
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    
    
}


class ButtonCell : UICollectionViewCell {
    
    var iconImg: UIImageView = {
       
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.tintColor = UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        
        return icon
    }()
    
    override var isSelected : Bool{
        
        didSet{
            iconImg.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
         }
        
    }
    

    
    override var isHighlighted: Bool{
    
        didSet{
           // iconImg.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
        
    }
    
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews(){
        
        addSubview(iconImg)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": iconImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": iconImg]))
        
        addConstraint(NSLayoutConstraint(item: iconImg, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: iconImg, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

 
    }
    
    
}


