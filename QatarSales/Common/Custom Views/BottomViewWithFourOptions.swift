//
//  BottomViewWithFourOptions.swift
//  QatarSales
//
//  Created by Usman  on 12/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class BottomViewWithFourOptions: UIView {
    
    var view: UIView!
    @IBOutlet weak var optionFirst: BottomViewWithSingleOption!
    @IBOutlet weak var optionSecond: BottomViewWithSingleOption!
    @IBOutlet weak var optionThird: BottomViewWithSingleOption!
    @IBOutlet weak var optionFourth: BottomViewWithSingleOption!
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
        setDelegate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
        setDelegate()
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "BottomViewWithFourOptions", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBInspectable var firstTabTitle: String? {
        get {
            
            return optionFirst.heading
        }
        set(firstTabTitle) {
            
            optionFirst.heading = firstTabTitle
        }
    }
    
    @IBInspectable var firstTabIcon: String? {
        get {
            
            return optionFirst.icon
        }
        set(firstTabIcon) {
            
            optionFirst.icon = firstTabIcon
        }
    }
    
    @IBInspectable var secondTabTitle: String? {
        get {
            
            return optionSecond.heading
        }
        set(secondTabTitle) {
            
            optionSecond.heading = secondTabTitle
        }
    }
    
    @IBInspectable var secondTabIcon: String? {
        get {
            
            return optionSecond.icon
        }
        set(secondTabIcon) {
            
            optionSecond.icon = secondTabIcon
        }
    }
    
    @IBInspectable var thirdTabTitle: String? {
        get {
            
            return optionThird.heading
        }
        set(thirdTabTitle) {
            
            optionThird.heading = thirdTabTitle
        }
    }
    
    @IBInspectable var thirdTabIcon: String? {
        get {
            
            return optionThird.icon
        }
        set(thirdTabIcon) {
            
            optionThird.icon = thirdTabIcon
        }
    }
    
    @IBInspectable var fourthTabTitle: String? {
        get {
            
            return optionFourth.heading
        }
        set(fourthTabTitle) {
            
            optionFourth.heading = fourthTabTitle
        }
    }
    
    @IBInspectable var fourthTabIcon: String? {
        get {
            
            return optionFourth.icon
        }
        set(fourthTabIcon) {
            
            optionFourth.icon = fourthTabIcon
        }
    }
    
    private func setDelegate() {
        
        optionFirst.delegate = self
        optionSecond.delegate = self
        optionThird.delegate = self
        optionFourth.delegate = self
    }
    
    func setSelction(AtIndex index : Int) {
        
        switch index {
        case 0:
            
            optionFirst.setSelectedState()
            optionSecond.setUnselectedState()
            optionThird.setUnselectedState()
            optionFourth.setUnselectedState()
            break
        case 1:
            
            optionFirst.setUnselectedState()
            optionSecond.setSelectedState()
            optionThird.setUnselectedState()
            optionFourth.setUnselectedState()
            break
        case 2:
            optionFirst.setUnselectedState()
            optionSecond.setUnselectedState()
            optionThird.setSelectedState()
            optionFourth.setUnselectedState()
            break
        case 3:
            optionFirst.setUnselectedState()
            optionSecond.setUnselectedState()
            optionThird.setUnselectedState()
            optionFourth.setSelectedState()
            break
        case 4:
            optionFirst.setUnselectedState()
            optionSecond.setUnselectedState()
            optionThird.setUnselectedState()
            optionFourth.setUnselectedState()
            break
        default:
            break
        }
    }
}

extension BottomViewWithFourOptions : BottomViewWithSingleOptionDelegate {
    
    func singleOptionBottomViewDidSelect(_ bottomView : BottomViewWithSingleOption) {
        
        switch bottomView {
        case optionFirst:
            setSelction(AtIndex: 0)
            break
        case optionSecond:
            setSelction(AtIndex: 1)
            break
        case optionThird:
            setSelction(AtIndex: 2)
            break
        case optionFourth:
            setSelction(AtIndex: 3)
            break
        default:
            break
        }
    }
}
