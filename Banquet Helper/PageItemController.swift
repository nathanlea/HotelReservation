//
//  PageItemController.swift
//  TeamProject
//
//  Created by Nathan on 10/26/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    var pageIndex: Int = 0 {
        didSet {
            switch pageIndex {
            case 0 :
                //Event Planner 1
                if let _ = nameLabel {
                    nameLabel.text = "David Davis"
                    bioTextView.text = "David has been an event coordinator with our team for the past 14 years. David was second baseman for the Cincinnati Reds until he decided to follow his true passion for event planning. He specializes in corporate events, but also enjoys planning events for the community, including our annual Yom Kippur food drive."
                    aboutLabel.text = "About David Davis"
                } else  {
                    nameTitle = "David Davis"
                    bioText = "David has been an event coordinator with our team for the past 14 years. David was second baseman for the Cincinnati Reds until he decided to follow his true passion for event planning. He specializes in corporate events, but also enjoys planning events for the community, including our annual Yom Kippur food drive."
                    about = "About David Davis"
                    imageName = "ddavis"
                }
                
                break
            case 1 :
                //Event Planner 2
                if let _ = nameLabel {
                    nameLabel.text = "Blayne Mayfield"
                    aboutLabel.text = "About Blayne Mayfield"
                    bioTextView.text = "Blayne has been an event coordinator with our team for the past 5 years. Blayne was a professional ukulele player until he decided to follow his true calling for event planning. He specializes in family reuions, nonprofit fundraisers, and rap battles."
                } else  {
                    nameTitle = "Blayne Mayfield"
                    bioText = "Blayne has been an event coordinator with our team for the past 5 years. Blayne was a professional ukulele player until he decided to follow his true calling for event planning. He specializes in family reuions, nonprofit fundraisers, and rap battles."
                    about = "About Blayne Mayfield"
                    imageName = "mayfield"
                }
                break
            case 2 :
                //Event Planner 3
                if let _ = nameLabel {
                    nameLabel.text = "Derrian"
                    aboutLabel.text = "About Derrian"
                    bioTextView.text = "Just testing to see if you actually look completely at what the app does :)"
                } else  {
                    nameTitle = "Derrian"
                    bioText = "Just testing to see if you actually look completely at what the app does :)"
                    about = "About Derrian"
                    imageName = "FrederickProfile"
                }
                break
            default : break
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var mugShotImageView: UIImageView!
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!
    
    var nameTitle = ""
    var bioText = ""
    var about = ""
    
    var imageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameTitle
        bioTextView.text = bioText
        aboutLabel.text = about
        let frame = mugShotImageView.frame
        mugShotImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, 50, 50)
        mugShotImageView.image = UIImage(named: imageName)
        mugShotImageView.contentMode = .ScaleAspectFit
        mugShotImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, 50, 50)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
