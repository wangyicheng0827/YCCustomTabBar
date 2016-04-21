//
//  CustomTabBar.swift
//  YCCustomTabBar_Swift
//
//  Created by admin on 16/4/21.
//  Copyright © 2016年 admin. All rights reserved.
//

import UIKit

protocol tabBarDelegate {
    func touchBtnAtIndex(index: NSInteger)
}

class CustomTabBar: UIView {

    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    
    var button1:UIButton!
    var button2:UIButton!
    var button3:UIButton!
    var button4:UIButton!
    var button5:UIButton!
    
    var delegate :tabBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutBtn()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutBtn() {
        button1 = UIButton(type: .Custom)
        button1.selected = true
        button1.setImage(UIImage(named: "tabBar_essence_icon"), forState: .Normal)
        button1.setImage(UIImage(named: "tabBar_essence_click_icon"), forState: .Selected)
        button1.frame = CGRectMake(0, 0, SCREEN_WIDTH/5, self.frame.size.height)
        button1.tag = 101
        button1.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        
        button2 = UIButton(type: .Custom)
        button2.selected = false
        button2.setImage(UIImage(named: "tabBar_new_icon"), forState: .Normal)
        button2.setImage(UIImage(named: "tabBar_new_click_icon"), forState: .Selected)
        button2.frame = CGRectMake(SCREEN_WIDTH/5*1, 0, SCREEN_WIDTH/5, self.frame.size.height)
        button2.tag = 102
        button2.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        
        button3 = UIButton(type: .Custom)
        button3.selected = false
        button3.setImage(UIImage(named: "tabBar_publish_icon"), forState: .Normal)
        button3.setImage(UIImage(named: "tabBar_publish_click_icon"), forState: .Selected)
        button3.frame = CGRectMake(SCREEN_WIDTH/5*2, 0, SCREEN_WIDTH/5, self.frame.size.height)
        button3.tag = 103
        button3.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        
        button4 = UIButton(type: .Custom)
        button4.selected = false
        button4.setImage(UIImage(named: "tabBar_me_icon"), forState: .Normal)
        button4.setImage(UIImage(named: "tabBar_me_click_icon"), forState: .Selected)
        button4.frame = CGRectMake(SCREEN_WIDTH/5*3, 0, SCREEN_WIDTH/5, self.frame.size.height)
        button4.tag = 104
        button4.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        
        button5 = UIButton(type: .Custom)
        button5.selected = false
        button5.setImage(UIImage(named: "tabBar_friendTrends_icon"), forState: .Normal)
        button5.setImage(UIImage(named: "tabBar_friendTrends_click_icon"), forState: .Selected)
        button5.frame = CGRectMake(SCREEN_WIDTH/5*4, 0, SCREEN_WIDTH/5, self.frame.size.height)
        button5.tag = 105
        button5.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        self.addSubview(button4)
        self.addSubview(button5)
    }
    
    func btnClick(sender:UIButton) {
        print("sender is \(sender)")
        switch sender.tag {
        case 101:
            if !sender.selected {
                self.delegate?.touchBtnAtIndex(0)
            }
            self.button1.selected = true;
            self.button2.selected = false;
            self.button3.selected = false;
            self.button4.selected = false;
            self.button5.selected = false;
            break
        case 102:
            if !sender.selected {
                self.delegate?.touchBtnAtIndex(1)
            }
            self.button1.selected = false;
            self.button2.selected = true;
            self.button3.selected = false;
            self.button4.selected = false;
            self.button5.selected = false;
            break
        case 103:
            if !sender.selected {
                self.delegate?.touchBtnAtIndex(2)
            }
            self.button1.selected = false;
            self.button2.selected = false;
            self.button3.selected = true;
            self.button4.selected = false;
            self.button5.selected = false;
            break
        case 104:
            if !sender.selected {
                self.delegate?.touchBtnAtIndex(3)
            }
            self.button1.selected = false;
            self.button2.selected = false;
            self.button3.selected = false;
            self.button4.selected = true;
            self.button5.selected = false;
           break
        case 105:
            if !sender.selected {
                self.delegate?.touchBtnAtIndex(4)
            }
            self.button1.selected = false;
            self.button2.selected = false;
            self.button3.selected = false;
            self.button4.selected = false;
            self.button5.selected = true;
            break
        default:
            print("...")
            break
        }
    }

}
