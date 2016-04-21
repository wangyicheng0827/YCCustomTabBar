//
//  RootTabBarController.swift
//  YCCustomTabBar_Swift
//
//  Created by admin on 16/4/21.
//  Copyright © 2016年 admin. All rights reserved.
//

import UIKit

class RootTabBarController: UIViewController, tabBarDelegate {

    var tabbar: CustomTabBar?
    var arrayViewControllers: NSArray = []
    
    let SELECTED_VIEW_CONTROLLER_TAG = 98456345
//    let tabbarHight = 49
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabbar = CustomTabBar(frame: CGRectMake(0,  UIScreen.mainScreen().bounds.size.height-49, UIScreen.mainScreen().bounds.size.width,49))
        tabbar?.backgroundColor = UIColor.whiteColor()
        tabbar?.delegate = self
        self.view.addSubview(tabbar!)
        
        arrayViewControllers = self.getViewControllers()
        self.touchBtnAtIndex(0)
    }
    
    func getViewControllers() ->(NSArray) {
        
        let first = FirstViewController()
        let second = SecondViewController()
        let third = ThirdViewController()
        let four = FourViewController()
        let five = FiveViewController()
        
        let firstNav:UINavigationController = UINavigationController(rootViewController: first)
        let secondNav:UINavigationController = UINavigationController(rootViewController: second)
        let thirdNav:UINavigationController = UINavigationController(rootViewController: third)
        let fourNav:UINavigationController = UINavigationController(rootViewController: four)
        let fiveNav:UINavigationController = UINavigationController(rootViewController: five)
        let tabBarItems = [firstNav, secondNav, thirdNav, fourNav, fiveNav]

        return tabBarItems
    }
    
    func touchBtnAtIndex(index: NSInteger) {
        let currentView = UIView()
        currentView.tag = SELECTED_VIEW_CONTROLLER_TAG
        currentView.removeFromSuperview()
        let viewController = arrayViewControllers.objectAtIndex(index) as! UIViewController
        viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG
        
        let frame: CGRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
        viewController.view.frame = frame
        self.view.insertSubview(viewController.view, belowSubview: tabbar!)
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
