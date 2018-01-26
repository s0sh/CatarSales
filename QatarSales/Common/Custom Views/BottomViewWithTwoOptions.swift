//
//  BottomViewWithTwoOptions.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

@objc protocol BottomViewWithTwoOptionsDelegate {
    
    @objc optional func bottomViewWithTwoOptionsDidSelect(_ bottomView : BottomViewWithTwoOptions, atIndex index : Int)
}


@IBDesignable
class BottomViewWithTwoOptions: UIView {
    
    var view: UIView!
    @IBOutlet weak var optionFirst: BottomViewWithSingleOption!
    @IBOutlet weak var optionSecond: BottomViewWithSingleOption!
    var delegate : BottomViewWithTwoOptionsDelegate?
    
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
        let nib = UINib(nibName: "BottomViewWithTwoOptions", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    private func setDelegate() {
        
        optionFirst.delegate = self
        optionSecond.delegate = self
    }
    
    @IBInspectable var firstTitle: String? {
        get {
            
            return optionFirst.heading
        }
        set(firstTitle) {
            
            optionFirst.heading = firstTitle
        }
    }
    
    @IBInspectable var firstIcon: String? {
        get {
            
            return optionFirst.icon
        }
        set(firstIcon) {
            
            optionFirst.icon = firstIcon
        }
    }
    
    @IBInspectable var secondTitle: String? {
        get {
            
            return optionSecond.heading
        }
        set(secondTitle) {
            
            optionSecond.heading = secondTitle
        }
    }
    
    @IBInspectable var secondIcon: String? {
        get {
            
            return optionSecond.icon
        }
        set(secondIcon) {
            
            optionSecond.icon = secondIcon
        }
    }
}

extension BottomViewWithTwoOptions : BottomViewWithSingleOptionDelegate {
    
    func singleOptionBottomViewDidSelect(_ bottomView : BottomViewWithSingleOption) {
        
        switch bottomView {
        case optionFirst:
            
            if let _delegate = delegate {
                
                _delegate.bottomViewWithTwoOptionsDidSelect!(self, atIndex: 0)
            }
            break
        case optionSecond:
            if let _delegate = delegate {
                
                _delegate.bottomViewWithTwoOptionsDidSelect!(self, atIndex: 1)
            }
            break
        default:
            break
        }
    }
}
