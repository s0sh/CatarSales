//
//  BottomViewWithTwoFilterOptions.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

@objc protocol BottomViewWithTwoFilterOptionsDelegate {
    
    @objc optional func bottomViewWithTwoFilterOptionsDidSelect(_ bottomView : BottomViewWithTwoFilterOptions, atIndex index : Int)
}


@IBDesignable
class BottomViewWithTwoFilterOptions: UIView {
    
    var view: UIView!
    @IBOutlet weak var optionFirst: BottomViewWithSingleFilterOption!
    @IBOutlet weak var optionSecond: BottomViewWithSingleFilterOption!
    var delegate : BottomViewWithTwoFilterOptionsDelegate?

    
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
        let nib = UINib(nibName: "BottomViewWithTwoFilterOptions", bundle: bundle)
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
    
    @IBInspectable var secondTitle: String? {
        get {
            
            return optionSecond.heading
        }
        set(secondTitle) {
            
            optionSecond.heading = secondTitle
        }
    }
}


extension BottomViewWithTwoFilterOptions : BottomViewWithSingleFilterOptionDelegate {
    
    func BottomViewWithSingleFilterOptionDidSelect(_ bottomView : BottomViewWithSingleFilterOption) {
        
        switch bottomView {
        case optionFirst:
            
            if let _delegate = delegate {
                
                _delegate.bottomViewWithTwoFilterOptionsDidSelect!(self, atIndex: 0)
            }
            break
        case optionSecond:
            if let _delegate = delegate {
                
                _delegate.bottomViewWithTwoFilterOptionsDidSelect!(self, atIndex: 1)
            }
            break
        default:
            break
        }
    }
}



