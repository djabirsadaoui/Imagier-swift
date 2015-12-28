//
//  Mavue.swift
//  imagier
//
//  Created by m2sar on 22/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 8.0, *)
class Mavue: UIView{
    
    let scroll = UIScrollView(frame: UIScreen.mainScreen().bounds)
    let terminal: UIDevice = UIDevice.currentDevice()
    let ecran:UIScreen = UIScreen()
    let buttonleft: UIButton = UIButton(type: UIButtonType.System)
    let buttonright: UIButton = UIButton(type: UIButtonType.System)
    let slider:UISlider = UISlider()
    let label1:UILabel = UILabel()
    let label2:UILabel = UILabel()
    var flou1: UIVisualEffectView?
    var flou2: UIVisualEffectView?
    var v = "hello"+String(26)
   
    

  
    var monImageView = UIImageView(image: UIImage(named: "photo-01.jpg"))
    
    override init (frame: CGRect){
        buttonleft.setTitle("<<<", forState: UIControlState.Normal)
        buttonleft.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        buttonright.setTitle(">>>", forState: UIControlState.Normal)
        buttonright.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        

        flou1 = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        flou1!.hidden = false
        flou2 = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
        flou2!.hidden = false
        
        label1.textAlignment = .Center
        label1.text = "Machu Pichu"
       
        label2.textAlignment = .Center
        label2.text = "10%"
              
        slider.maximumValue = 1.0
        slider.minimumValue = 0.05
        slider.value = 0.1
        
        scroll.backgroundColor = UIColor.whiteColor()
        scroll.maximumZoomScale = 1.0
        scroll.minimumZoomScale = 0.05
        
        let effH = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        effH.minimumRelativeValue = -50.0
        effH.maximumRelativeValue = 50.0
        
        let effV = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        effV.minimumRelativeValue = -50.0
        effV.maximumRelativeValue = 50.0
        
        let groupe = UIMotionEffectGroup()
        groupe.motionEffects = [effH,effV]
        monImageView.addMotionEffect(groupe)
        
        super.init(frame: frame)
        
        scroll.addSubview(monImageView)
        self.addSubview(scroll)
        self.addSubview(flou1!)
        self.addSubview(flou2!)
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(buttonleft)
        self.addSubview(buttonright)
        self.addSubview(slider)
       
        self.backgroundColor = UIColor.whiteColor()
        
    }
    
    override func drawRect(rect: CGRect) {
        
        let portrait: Bool  = terminal.orientation == UIDeviceOrientation.Portrait || terminal.orientation == UIDeviceOrientation.PortraitUpsideDown
        let paysage: Bool = terminal.orientation == UIDeviceOrientation.LandscapeLeft || terminal.orientation == UIDeviceOrientation.LandscapeRight
        let iphone6: Bool = terminal.userInterfaceIdiom == .Phone &&  ecran.scale == 3.0
        let ipode: Bool  =  terminal.userInterfaceIdiom == .Phone
        
        
        if (portrait){
            if  iphone6  {      //iphone6
            let h = rect.size.height
            let w = rect.size.width
                    flou1!.frame = CGRectMake(CGFloat (0.0), CGFloat (0.0), CGFloat (w),  CGFloat (30))
                    flou2!.frame = CGRectMake(CGFloat (0.0), CGFloat (50), CGFloat (w),  CGFloat (30))
                    buttonleft.frame = CGRectMake(CGFloat (20.0), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                    buttonright.frame = CGRectMake(CGFloat (w - 120), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                    scroll.frame = CGRectMake(CGFloat (0.0), CGFloat (50.0), CGFloat (w),  CGFloat (h-50))
                    label1.frame = CGRectMake(CGFloat (w - 150)/2, CGFloat (20.0), CGFloat (150),  CGFloat (30))
                    label2.frame = CGRectMake(CGFloat (w - 120)/2, CGFloat (50.0), CGFloat (120),  CGFloat (30))
                    slider.frame = CGRectMake(CGFloat (20.0), CGFloat (h-50), CGFloat (w-40),  CGFloat (30))
            }else if ipode {         //ipode + iphone
                    let h = rect.size.height
                    let w = rect.size.width
                    flou1!.frame = CGRectMake(CGFloat (0.0), CGFloat (0.0), CGFloat (w),  CGFloat (30))
                    flou2!.frame = CGRectMake(CGFloat (0.0), CGFloat (50), CGFloat (w),  CGFloat (30))
                    buttonleft.frame = CGRectMake(CGFloat (20.0), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                    buttonright.frame = CGRectMake(CGFloat (w - 120), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                    scroll.frame = CGRectMake(CGFloat (0.0), CGFloat (50.0), CGFloat (w),  CGFloat (h-50))
                    label1.frame = CGRectMake(CGFloat (w - 150)/2, CGFloat (20.0), CGFloat (150),  CGFloat (30))
                    label2.frame = CGRectMake(CGFloat (w - 120)/2, CGFloat (50.0), CGFloat (120),  CGFloat (30))
                    slider.frame = CGRectMake(CGFloat (20.0), CGFloat (h-50), CGFloat (w-40),  CGFloat (30))
                
            }else {                 //ipad
                    let h = rect.size.height
                    let w = rect.size.width
                    flou1!.frame = CGRectMake(CGFloat (0.0), CGFloat (0.0), CGFloat (w),  CGFloat (30))
                    flou2!.frame = CGRectMake(CGFloat (0.0), CGFloat (50), CGFloat (w),  CGFloat (30))
                    buttonleft.frame = CGRectMake(CGFloat (20.0), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                    buttonright.frame = CGRectMake(CGFloat (w - 120), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                    scroll.frame = CGRectMake(CGFloat (0.0), CGFloat (50.0), CGFloat (w),  CGFloat (h-50))
                    label1.frame = CGRectMake(CGFloat (w - 150)/2, CGFloat (20.0), CGFloat (150),  CGFloat (30))
                    label2.frame = CGRectMake(CGFloat (w - 120)/2, CGFloat (50.0), CGFloat (120),  CGFloat (30))
                    slider.frame = CGRectMake(CGFloat (20.0), CGFloat (h-50), CGFloat (w-40),  CGFloat (30))
            }
            
            
        }
            // pay
        else if paysage {
            if  iphone6 {      //iphone6
                let h = rect.size.height
                let w = rect.size.width
                flou1!.frame = CGRectMake(CGFloat (0.0), CGFloat (0.0), CGFloat (w),  CGFloat (30))
                flou2!.frame = CGRectMake(CGFloat (0.0), CGFloat (50), CGFloat (w),  CGFloat (30))
                buttonleft.frame = CGRectMake(CGFloat (20.0), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                buttonright.frame = CGRectMake(CGFloat (w - 120), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                scroll.frame = CGRectMake(CGFloat (0.0), CGFloat (50.0), CGFloat (w),  CGFloat (h-50))
                label1.frame = CGRectMake(CGFloat (w - 150)/2, CGFloat (20.0), CGFloat (150),  CGFloat (30))
                label2.frame = CGRectMake(CGFloat (w - 120)/2, CGFloat (50.0), CGFloat (120),  CGFloat (30))
                slider.frame = CGRectMake(CGFloat (20.0), CGFloat (h-50), CGFloat (w-40),  CGFloat (30))
            }else if ipode {         //ipode + iphone
                let h = rect.size.height
                let w = rect.size.width
                flou1!.frame = CGRectMake(CGFloat (0.0), CGFloat (0.0), CGFloat (w),  CGFloat (30))
                flou2!.frame = CGRectMake(CGFloat (0.0), CGFloat (50), CGFloat (w),  CGFloat (30))
                buttonleft.frame = CGRectMake(CGFloat (20.0), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                buttonright.frame = CGRectMake(CGFloat (w - 120), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                scroll.frame = CGRectMake(CGFloat (0.0), CGFloat (50.0), CGFloat (w),  CGFloat (h-50))
                label1.frame = CGRectMake(CGFloat (w - 150)/2, CGFloat (20.0), CGFloat (150),  CGFloat (30))
                label2.frame = CGRectMake(CGFloat (w - 120)/2, CGFloat (50.0), CGFloat (120),  CGFloat (30))
                slider.frame = CGRectMake(CGFloat (20.0), CGFloat (h-50), CGFloat (w-40),  CGFloat (30))
                
            }else {                 //ipad
                let h = rect.size.height
                let w = rect.size.width
                flou1!.frame = CGRectMake(CGFloat (0.0), CGFloat (0.0), CGFloat (w),  CGFloat (30))
                flou2!.frame = CGRectMake(CGFloat (0.0), CGFloat (50), CGFloat (w),  CGFloat (30))
                buttonleft.frame = CGRectMake(CGFloat (20.0), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                buttonright.frame = CGRectMake(CGFloat (w - 120), CGFloat (20.0), CGFloat (100),  CGFloat (30))
                scroll.frame = CGRectMake(CGFloat (0.0), CGFloat (50.0), CGFloat (w),  CGFloat (h-50))
                label1.frame = CGRectMake(CGFloat (w - 150)/2, CGFloat (20.0), CGFloat (150),  CGFloat (30))
                label2.frame = CGRectMake(CGFloat (w - 120)/2, CGFloat (50.0), CGFloat (120),  CGFloat (30))
                slider.frame = CGRectMake(CGFloat (20.0), CGFloat (h-50), CGFloat (w-40),  CGFloat (30))
            }
        }

    
    
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}