//
//  ViewController.swift
//  imagier
//
//  Created by m2sar on 22/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class ViewController: UIViewController,UIScrollViewDelegate {
    var vue: Mavue!
    var image = Image()
    override func viewDidLoad() {
        super.viewDidLoad()
        let ecran = UIScreen.mainScreen()
        let rect = ecran.bounds
        
        vue = Mavue(frame: rect)
        vue.scroll.delegate = self
        self.view = vue
        
        vue.buttonleft.addTarget(self, action: "function_bL:", forControlEvents: (UIControlEvents: .TouchDown))
        vue.buttonright.addTarget(self, action: "function_br:", forControlEvents: (UIControlEvents: .TouchDown))
        vue.slider.addTarget(self, action: "function_slider:", forControlEvents: (UIControlEvents: .ValueChanged))
        if (vue.terminal.userInterfaceIdiom == .Pad){
            vue.scroll.setZoomScale(0.2, animated: true)
        }else{
            vue.scroll.setZoomScale(0.1, animated: true)
        }
        
        

    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView)->UIView? {
        return vue.monImageView
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView , withView view: UIView? , atScale scale: CGFloat){
        scrollView.zoomScale = scale
        vue.slider.value = Float (scale)
        vue.label2.text = String(format: "%d %%",Int(scale*100))
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        vue.slider.value = Float (scrollView.zoomScale)
        vue.label2.text = String(format: "%d %%",Int(scrollView.zoomScale*100))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func function_bL(sender: UIButton) {
        update(image.getPrecImage())
    }
      @IBAction func function_br(sender: UIButton) {
        update(image.getNextImage())
    }
     @IBAction func function_slider(sender: UIButton) {
        vue.scroll.zoomScale = CGFloat (vue.slider.value)
        vue.label2.text = String(format: "%d %%",Int(vue.slider.value*100))
    }
        

    func update(tuple:(String,String,Float)){        
        vue.scroll.setZoomScale(1.0, animated: false)
        vue.monImageView.image =  UIImage(named:tuple.1)
        vue.monImageView.sizeToFit()                // prend toujours la taille de image
        vue.slider.value = Float(tuple.2/100)
        vue.label1.text = String(tuple.0)
        vue.label2.text = String(format: "%d %%",Int(tuple.2))
        if (vue.terminal.userInterfaceIdiom == .Pad){
            vue.scroll.setZoomScale(CGFloat ((tuple.2*2)/100), animated: true)
        }else{
           vue.scroll.setZoomScale(CGFloat (tuple.2/100), animated: true) 
        }
        vue.scroll.contentOffset.x = 0
        vue.scroll.contentOffset.y = 0
    }
    

    }

