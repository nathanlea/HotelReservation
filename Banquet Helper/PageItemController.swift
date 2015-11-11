//
//  PageItemController.swift
//  TeamProject
//
//  Created by Nathan on 10/26/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    var pageIndex: Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var mugShotImageView: UIImageView!
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!
    
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = mugShotImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
