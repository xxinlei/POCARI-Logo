//
//  ViewController.swift
//  POCARI
//
//  Created by 楊昕蕾 on 2021/7/30.
//

import UIKit

class ViewController: UIViewController {

    let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    let whiteView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    let mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    
    var pocari = UIImageView(frame: CGRect(x: 3, y: 262, width: 410, height: 410))
    var pocariText = UIImageView(frame: CGRect(x: 3, y: 262, width: 410, height: 410))
    
    //宣告顏色陣列
    let colorArray = [UIColor.RGBA( 0, g: 173, b: 237, a: 1), UIColor.RGBA( 3, g: 167, b: 232, a: 1), UIColor.RGBA( 5, g: 162, b: 227, a: 1), UIColor.RGBA( 8, g: 156, b: 222, a: 1), UIColor.RGBA( 11, g: 151, b: 217, a: 1), UIColor.RGBA( 13, g: 145, b: 211, a: 1), UIColor.RGBA( 16, g: 140, b: 206, a: 1), UIColor.RGBA( 19, g: 134, b: 201, a: 1), UIColor.RGBA( 21, g: 129, b: 196, a: 1), UIColor.RGBA( 24, g: 123, b: 191, a: 1)]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        blueView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        blueView.backgroundColor = UIColor.RGBA( 0, g: 173, b: 237, a: 1)
        view.addSubview(blueView)
        
        whiteView.center = CGPoint(x: 300, y: 320)
        whiteView.backgroundColor = .white
        blueView.addSubview(whiteView)
        
        //加入參考圖
//        pocari.image = UIImage(named: "pocari")
//        pocari.alpha = 0.5
//        view.addSubview(pocari)
        
        //加入文字圖
        pocariText.image = UIImage(named: "pocariText")
//      pocariText.alpha = 0
        view.addSubview(pocariText)
        
        //畫圓形
        let layer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: CGPoint(x: 300, y: 320), radius: 200, startAngle: 0, endAngle: 360, clockwise: true)
        layer.path = path.cgPath
        blueView.layer.addSublayer(layer)
        blueView.layer.mask = layer
        
        //畫波紋
        let curveLayer = CAShapeLayer()
        let curvepath = UIBezierPath()
        curvepath.move(to: CGPoint(x: 408, y: 304))
        curvepath.addCurve(to: CGPoint(x: 87, y: 310.5), controlPoint1: CGPoint(x: 254, y: 343), controlPoint2: CGPoint(x: 222, y: 275))
        curvepath.addCurve(to: CGPoint(x: 408, y: 353), controlPoint1: CGPoint(x: 190, y: 305), controlPoint2: CGPoint(x: 240, y: 380))
        

        curveLayer.path = curvepath.cgPath
        whiteView.layer.addSublayer(curveLayer)
        whiteView.layer.mask = curveLayer
//      whiteView.alpha = 0
        
        //color picker
        let colorPicker = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        colorPicker.image = UIImage(named: "pocariSlider")
        colorPicker.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height - 150)
        colorPicker.contentMode = .scaleToFill
        colorPicker.clipsToBounds = true
        colorPicker.layer.cornerRadius = 25
        view.addSubview(colorPicker)
        
        //加入slider
        mySlider.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height - 150)
        mySlider.minimumValue = 0
        mySlider.maximumValue = 9
        mySlider.value = 0
        mySlider.minimumTrackTintColor = UIColor.clear
        mySlider.maximumTrackTintColor = UIColor.clear
        mySlider.isContinuous = true
        mySlider.addTarget(self,action: #selector(slideDidChange),for: UIControl.Event.valueChanged)
        view.addSubview(mySlider)
        
                                          
    }
    
    @objc func slideDidChange() {
    blueView.backgroundColor = colorArray[Int(mySlider.value)]
//    whiteView.alpha = CGFloat(mySlider.value / mySlider.maximumValue)
//    pocariText.alpha = CGFloat(mySlider.value / mySlider.maximumValue)
    }
    
    
}

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat){
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0);
    }
    //簡化RGB顏色寫法
    class func RGBA(_ r : UInt, g : UInt, b : UInt, a : CGFloat) -> UIColor {
        let redColor = CGFloat(r) / 255.0
        let greenColor = CGFloat(g) / 255.0
        let blueColor = CGFloat(b) / 255.0
        return UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: a)
    }
}
