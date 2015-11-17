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
                    nameLabel.text = "Event Planner A"
                } else  {
                    nameTitle = "Event Planner A"
                }
                
                break
            case 1 :
                //Event Planner 2
                if let _ = nameLabel {
                    nameLabel.text = "Event Planner B"
                } else  {
                    nameTitle = "Event Planner B"
                }
                break
            case 2 :
                //Event Planner 3
                if let _ = nameLabel {
                    nameLabel.text = "Event Planner C"
                } else  {
                    nameTitle = "Event Planner C"
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
    
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = mugShotImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameTitle

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
