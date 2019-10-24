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
            
            if startPoint.x  ==   20 {
            
                if  (self.frame.size.height - 20 - startPoint.y)*(oldPoint.x  - startPoint.x) / (startPoint.y - oldPoint.y) >= self.frame.size.width - 40{
                                  endPoint.x = self.frame.size.width - 20
                                  endPoint.y = (self.frame.size.width - 40)*(startPoint.y - oldPoint.y) / (oldPoint.x - startPoint.x) + startPoint.y
                              print("1111111")
                              print(endPoint)
                              }else{
                                  endPoint.y = self.frame.size.height - 20
                                  endPoint.x = (self.frame.size.height - 20 - startPoint.y)*(oldPoint.x  - startPoint.x) / (startPoint.y - oldPoint.y) + 20
                               print("2222222")
                               print(endPoint)
                }
             
            }else{
              
                if  (startPoint.y - oldPoint.y) * (startPoint.x - 20) /  (oldPoint.x - startPoint.x)   >= self.frame.size.height - 40{
                                 endPoint.y =  20
                                 endPoint.x = startPoint.x -  (self.frame.size.height - 40) *  (oldPoint.x - startPoint.x)  / (startPoint.y - oldPoint.y)
                    print("3333333")
                                                 print(endPoint)
                             }else{
                                 endPoint.y =  startPoint.y -  (startPoint.y - oldPoint.y) * (startPoint.x - 20) /  (oldPoint.x - startPoint.x)
                                 endPoint.x =  20
                              
                    print("444444")
                                                           print(endPoint)
                }
            }
                
                
        }else  if oldPoint.y > startPoint.y , oldPoint.x > startPoint.x   {
            if startPoint.x > 20 {
                
                if  ( oldPoint.y - 20) * (startPoint.x - 20) / (oldPoint.x - startPoint.x) >= (self.frame.size.width - 40) {
                      endPoint.x = startPoint.x - (self.frame.size.width - 40) * (oldPoint.x - startPoint.x) / (startPoint.x - 20)
                      endPoint.y = self.frame.size.width - 20
                    print("555555")
                                                                       print(endPoint)
                  }else{
                      endPoint.x =  20
                      endPoint.y =  20 +  ( oldPoint.y - 20) * (startPoint.x - 20) / (oldPoint.x - startPoint.x)
                    print("666666")
                                                                       print(endPoint)
                  }
                
            }else{
                if (startPoint.y - 20) * (oldPoint.x - startPoint.x) / (oldPoint.y - startPoint.y) >= self.frame.size.width - 40 {
                    endPoint.x = self.frame.size.width - 20
                    endPoint.y = startPoint.y - (self.frame.size.width - 40) * (oldPoint.y - startPoint.y) / (oldPoint.x - startPoint.x)
                    print("777777")
                                                                                 print(endPoint)
                }else{
                    endPoint.y =  20
                    endPoint.x =  (startPoint.y - 20) * (oldPoint.x - startPoint.x) / (oldPoint.y - startPoint.y) + startPoint.x
                    print("888888")
                                                                                 print(endPoint)
                }
            }
        }else if oldPoint.y < startPoint.y , oldPoint.x < startPoint.x{
            
            if startPoint.y == self.frame.size.height -  20 {
                if (self.frame.size.width - 20 - startPoint.x) * (startPoint.y - oldPoint.y) / (startPoint.x - oldPoint.x )
                   >= self.frame.size.height - 40 {
                   endPoint.y =  20
                   endPoint.x = startPoint.x + (self.frame.size.width - 40) * (startPoint.x - oldPoint.x) / (startPoint.y - oldPoint.y)
                    print("999999")
                                                                                 print(endPoint)
                 
               }else{
                   endPoint.x =  self.frame.size.width - 20
                   endPoint.y =  startPoint.y -   (self.frame.size.width - 20 - startPoint.x) * (startPoint.y - oldPoint.y) / (startPoint.x - oldPoint.x )
                    print("1010101010")
                                                                                 print(endPoint)
                
               }
            }else{

                if (self.frame.size.height - 20 - startPoint.y) * (startPoint.x - oldPoint.x) / (startPoint.y - oldPoint.y )
                            >= self.frame.size.width - 40 {
                            endPoint.x =  20
                            endPoint.y =  startPoint.y +  (self.frame.size.width - 40) * (startPoint.y - oldPoint.y) / (startPoint.x - oldPoint.x)
                          print("aaaaaaa")
                                                                                       print(endPoint)
                        }else{
                            endPoint.y =  self.frame.size.height - 20
                            endPoint.x =  startPoint.y +   (self.frame.size.height - 20 - startPoint.y) * (startPoint.x - oldPoint.x) / (startPoint.y - oldPoint.y )
                    print("bbbbbb")
                                                                                 print(endPoint)
                         
                        }
                
            }
        }else if oldPoint.y > startPoint.y , oldPoint.x < startPoint.x{
            
            if startPoint.y > 20{
                  if (startPoint.y - 20) * (startPoint.x - oldPoint.x) / (oldPoint.y - startPoint.y )
                       >= self.frame.size.width - 40 {
                    endPoint.x =  20
                    endPoint.y =  startPoint.y  -  (self.frame.size.width - 40) * (oldPoint.y - startPoint.y) / (startPoint.x - oldPoint.x)
                print("ccccccc")
                                                                             print(endPoint)
                     
                   }else{
                    endPoint.y =  20
                    endPoint.x = startPoint.x - (startPoint.y - 20) * (startPoint.x - oldPoint.x) / (oldPoint.y - startPoint.y )
                    print("ddddddd")
                                                                                 print(endPoint)
                 }
                
            } else{
               
                if  (self.frame.size.width - 20 - startPoint.x) * (oldPoint.y - 20) / (startPoint.x - oldPoint.x)
                        <= self.frame.size.width - 40 {
                     endPoint.x =  self.frame.size.width - 20
                     endPoint.y =   (self.frame.size.width - 20 - startPoint.x) * (oldPoint.y - 20) / (startPoint.x - oldPoint.x) + 20
                      print("eeeeeee")
                                                                                   print(endPoint)
                    }else{
                     endPoint.x = (self.frame.size.height - 40) * (startPoint.x - oldPoint.x) / (self.frame.size.width - 20 - startPoint.x)   + startPoint.x
                     endPoint.y = self.frame.size.height - 20
                     print("fffff")
                                                                                  print(endPoint)
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
