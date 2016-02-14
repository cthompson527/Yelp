//
//  BusinessCell.swift
//  Yelp
//
//  Created by Cory Thompson on 2/8/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
  
  @IBOutlet weak var thumbImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var distanceLabel: UILabel!
  @IBOutlet weak var moneyLabel: UILabel!
  @IBOutlet weak var reviewsLabel: UILabel!
  @IBOutlet weak var ratingsImageView: UIImageView!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var categoriesLabel: UILabel!
  
  var business: Business! {
    didSet {
      nameLabel.text = business.name
      thumbImageView.setImageWithURL(business.imageURL!)
      categoriesLabel.text = business.categories
      addressLabel.text = business.address
      reviewsLabel.text = "\(business.reviewCount!) Reviews"
      ratingsImageView.setImageWithURL(business.ratingImageURL!)
      distanceLabel.text = business.distance
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    thumbImageView.layer.cornerRadius = 3
    thumbImageView.clipsToBounds = true
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}