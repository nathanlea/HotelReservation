//
//  PageViewController.swift
//  TeamProject
//
//  Created by Nathan on 10/26/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
//  Based on this: https://www.veasoftware.com/tutorials/2015/4/2/uipageviewcontroller-in-swift-xcode-62-ios-82-tutorial

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    var parent: CVCalendarViewController = CVCalendarViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageTitles = NSArray(objects: "Algo1", "Algo2", "Algo3")
        self.pageImages = NSArray(objects: "app2-02", "app2-03", "app2-04")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        
        let startVC = self.viewControllerAtIndex(0) as PageItemController
        
        let viewControllers = NSArray(object: startVC)
        
        
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
        
    }
    
    @IBAction func restartAction(sender: AnyObject) {
        
        let startVC = self.viewControllerAtIndex(0) as PageItemController
        
        let viewControllers = NSArray(object: startVC)
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
    }
    
    
    func viewControllerAtIndex(index: Int) -> PageItemController{
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            //parent.eventPlannerIndex = index
            return PageItemController()
        }
        
        let vc: PageItemController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageItemController
        //let rootvc: CVCalendarViewController = self.parentViewController as! CVCalendarViewController
        
        //vc.imageFile = self.pageImages[index]as! String
        //vc.titleText = self.pageTitles[index]as! String
        print("PageIndex: ", terminator: "")
        print(index)
        vc.pageIndex = index
        //rootvc.eventPlannerIndex = index
        //parent.eventPlannerIndex = index
        return vc
        
        
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let vc = viewController as! PageItemController
        var index = vc.pageIndex as Int
        parent.eventPlannerIndex = index
        print("PageIndex B: ", terminator: "")
        print(index)
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        let vc = viewController as! PageItemController
        var index = vc.pageIndex as Int
        parent.eventPlannerIndex = index
        print("PageIndex A: ", terminator: "")
        print(index)
        if (index == NSNotFound){
            return nil
        }
        index++
        if (index == self.pageTitles.count){
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
