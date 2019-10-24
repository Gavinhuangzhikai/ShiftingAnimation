//
//  ShiftingView.swift
//  Pods
//
//  Created by 8btc on 2019/10/23.
//

import UIKit

open class ShiftingView: UIView {

    var secondPoint : CGPoint  {
        get {
            return CGPoint.init(x: 20  , y : Int(arc4random_uniform(UInt32(Int(self.frame.size.height - 20)))+20))
        }
    }

    var endPoint : CGPoint = CGPoint.init(x: 0, y: 0)
    var oldPoint : CGPoint = CGPoint.init(x: 0, y: 0)

    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: self.frame.size.width/2, y: self.frame.size.height/2, width: 40, height: 40)
        btn.layer.cornerRadius  = 20
        btn.backgroundColor = UIColor.red
        self.addSubview(btn)
        return btn
    }()
    
    lazy var basicAnimation : CABasicAnimation = {
           let  basicAnimation = CABasicAnimation.init(keyPath: "position")
           basicAnimation.speed = 0.1
           basicAnimation.delegate = self
            basicAnimation.isRemovedOnCompletion = false
            basicAnimation.fillMode =  kCAFillModeForwards
           return basicAnimation
    }()
    
   public func startFirstAnimaation()  {
        self.oldPoint = self.btn.center
        self.basicAnimation.speed = 0.1
        self.basicAnimation.fromValue =  self.btn.center
        self.basicAnimation.toValue = secondPoint
          self.btn.layer.add(self.basicAnimation, forKey: "abc")
    }
    
    public func removeAnimation(){
        self.basicAnimation.delegate = nil
    }
    
   public func startAnimaation()  {
        
        let  startPoint  = self.btn.center
         
    
        if oldPoint.y < startPoint.y , oldPoint.x > startPoint.x{
            
            if startPoint.x  ==   self.btn.frame.size.width/2 {
            
                if  (self.frame.size.height - self.btn.frame.size.width/2 - startPoint.y)*(oldPoint.x  - startPoint.x) / (startPoint.y - oldPoint.y) >= self.frame.size.width - self.btn.frame.size.width{
                                  endPoint.x = self.frame.size.width - self.btn.frame.size.width/2
                                  endPoint.y = (self.frame.size.width - self.btn.frame.size.width)*(startPoint.y - oldPoint.y) / (oldPoint.x - startPoint.x) + startPoint.y

                              }else{
                                  endPoint.y = self.frame.size.height - self.btn.frame.size.width/2
                                  endPoint.x = (self.frame.size.height - self.btn.frame.size.width/2 - startPoint.y)*(oldPoint.x  - startPoint.x) / (startPoint.y - oldPoint.y) + self.btn.frame.size.width/2

                }
             
            }else{
              
                if  (startPoint.y - oldPoint.y) * (startPoint.x - self.btn.frame.size.width/2) /  (oldPoint.x - startPoint.x)   >= self.frame.size.height - self.btn.frame.size.width{
                                 endPoint.y =  self.btn.frame.size.width/2
                                 endPoint.x = startPoint.x -  (self.frame.size.height - self.btn.frame.size.width) *  (oldPoint.x - startPoint.x)  / (startPoint.y - oldPoint.y)

                             }else{
                                 endPoint.y =  startPoint.y -  (startPoint.y - oldPoint.y) * (startPoint.x - self.btn.frame.size.width/2) /  (oldPoint.x - startPoint.x)
                                 endPoint.x =  self.btn.frame.size.width/2

                }
            }
                
                
        }else  if oldPoint.y > startPoint.y , oldPoint.x > startPoint.x   {
            if startPoint.x > self.btn.frame.size.width/2 {
                
                if  ( oldPoint.y - self.btn.frame.size.width/2) * (startPoint.x - self.btn.frame.size.width/2) / (oldPoint.x - startPoint.x) >= (self.frame.size.width - self.btn.frame.size.width) {
                      endPoint.x = startPoint.x - (self.frame.size.width - self.btn.frame.size.width) * (oldPoint.x - startPoint.x) / (startPoint.x - self.btn.frame.size.width/2)
                      endPoint.y = self.frame.size.width - self.btn.frame.size.width/2
                    print("555555")
                                                                       print(endPoint)
                  }else{
                      endPoint.x =  self.btn.frame.size.width/2
                      endPoint.y =  self.btn.frame.size.width/2 +  ( oldPoint.y - self.btn.frame.size.width/2) * (startPoint.x - self.btn.frame.size.width/2) / (oldPoint.x - startPoint.x)
                  }
                
            }else{
                if (startPoint.y - self.btn.frame.size.width/2) * (oldPoint.x - startPoint.x) / (oldPoint.y - startPoint.y) >= self.frame.size.width - self.btn.frame.size.width {
                    endPoint.x = self.frame.size.width - self.btn.frame.size.width/2
                    endPoint.y = startPoint.y - (self.frame.size.width - self.btn.frame.size.width) * (oldPoint.y - startPoint.y) / (oldPoint.x - startPoint.x)
                }else{
                    endPoint.y =  self.btn.frame.size.width/2
                    endPoint.x =  (startPoint.y - self.btn.frame.size.width/2) * (oldPoint.x - startPoint.x) / (oldPoint.y - startPoint.y) + startPoint.x
                }
            }
        }else if oldPoint.y < startPoint.y , oldPoint.x < startPoint.x{
            
            if startPoint.y == self.frame.size.height -  self.btn.frame.size.width/2 {
                if (self.frame.size.width - self.btn.frame.size.width/2 - startPoint.x) * (startPoint.y - oldPoint.y) / (startPoint.x - oldPoint.x )
                   >= self.frame.size.height - self.btn.frame.size.width {
                   endPoint.y =  self.btn.frame.size.width/2
                   endPoint.x = startPoint.x + (self.frame.size.width - self.btn.frame.size.width) * (startPoint.x - oldPoint.x) / (startPoint.y - oldPoint.y)
                 
               }else{
                   endPoint.x =  self.frame.size.width - self.btn.frame.size.width/2
                   endPoint.y =  startPoint.y -   (self.frame.size.width - self.btn.frame.size.width/2 - startPoint.x) * (startPoint.y - oldPoint.y) / (startPoint.x - oldPoint.x )
                
               }
            }else{

                if (self.frame.size.height - self.btn.frame.size.width/2 - startPoint.y) * (startPoint.x - oldPoint.x) / (startPoint.y - oldPoint.y )
                            >= self.frame.size.width - self.btn.frame.size.width {
                            endPoint.x =  self.btn.frame.size.width/2
                            endPoint.y =  startPoint.y +  (self.frame.size.width - self.btn.frame.size.width) * (startPoint.y - oldPoint.y) / (startPoint.x - oldPoint.x)
                        }else{
                            endPoint.y =  self.frame.size.height - self.btn.frame.size.width/2
                            endPoint.x =  startPoint.x -    (self.frame.size.height - self.btn.frame.size.width/2 - startPoint.y) * (startPoint.x - oldPoint.x) / (startPoint.y - oldPoint.y )
                         
                        }
                
            }
        }else if oldPoint.y > startPoint.y , oldPoint.x < startPoint.x{
            
            if startPoint.y > self.btn.frame.size.width/2{
                  if (startPoint.y - self.btn.frame.size.width/2) * (startPoint.x - oldPoint.x) / (oldPoint.y - startPoint.y )
                       >= self.frame.size.width - self.btn.frame.size.width {
                    endPoint.x =  self.btn.frame.size.width/2
                    endPoint.y =  startPoint.y  -  (self.frame.size.width - self.btn.frame.size.width) * (oldPoint.y - startPoint.y) / (startPoint.x - oldPoint.x)
                     
                   }else{
                    endPoint.y =  self.btn.frame.size.width/2
                    endPoint.x = startPoint.x - (startPoint.y - self.btn.frame.size.width/2) * (startPoint.x - oldPoint.x) / (oldPoint.y - startPoint.y )
                 }
                
            } else{
               
                if  (self.frame.size.width - self.btn.frame.size.width/2 - startPoint.x) * (oldPoint.y - self.btn.frame.size.width/2) / (startPoint.x - oldPoint.x)
                        <= self.frame.size.width - self.btn.frame.size.width {
                     endPoint.x =  self.frame.size.width - self.btn.frame.size.width/2
                     endPoint.y =   (self.frame.size.width - self.btn.frame.size.width/2 - startPoint.x) * (oldPoint.y - self.btn.frame.size.width/2) / (startPoint.x - oldPoint.x) + self.btn.frame.size.width/2
                    }else{
                     endPoint.x = (self.frame.size.height - self.btn.frame.size.width) * (startPoint.x - oldPoint.x) / (self.frame.size.width - self.btn.frame.size.width/2 - startPoint.x)   + startPoint.x
                     endPoint.y = self.frame.size.height - self.btn.frame.size.width/2
                  }
            }
        }
        
        self.basicAnimation.speed = 0.1
        self.basicAnimation.fromValue =  self.btn.center
        self.basicAnimation.toValue = endPoint
        self.btn.layer.add(basicAnimation, forKey: "abc")
        self.oldPoint = self.btn.center
    }
    
    
    
}

extension ShiftingView : CAAnimationDelegate {
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
       
        if  let toValue =  anim.value(forKey: "toValue") as? CGPoint{
             self.btn.center = toValue
        }
        self.startAnimaation()
    }
    
}
