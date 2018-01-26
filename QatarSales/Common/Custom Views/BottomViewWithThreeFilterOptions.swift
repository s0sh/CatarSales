//
//  BottomViewWithThreeFilterOptions.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

@objc protocol BottomViewWithThreeFilterOptionsDelegate {
    
    @objc optional func bottomViewWithThreeFilterOptionDidSelect(_ bottomView : BottomViewWithThreeFilterOptions, atIndex index : Int)
}

@IBDesignable
class BottomViewWithThreeFilterOptions: UIView {
    
    var view: UIView!
    @IBOutlet weak var leftFilterOption: BottomViewWithSingleFilterOption!
    @IBOutlet weak var rightFilterOption: BottomViewWithSingleFilterOption!
    var delegate : BottomViewWithThreeFilterOptionsDelegate?

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
        let nib = UINib(nibName: "BottomViewWithThreeFilterOptions", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    private func setDelegate() {
        
        leftFilterOption.delegate = self
        rightFilterOption.delegate = self
    }

    
    @IBInspectable var firstTitle: String? {
        get {
            
            return leftFilterOption.heading
        }
        set(firstTitle) {
            
            leftFilterOption.heading = firstTitle
        }
    }
    
    @IBInspectable var secondTitle: String? {
        get {
            
            return rightFilterOption.heading
        }
        set(secondTitle) {
            
            rightFilterOption.heading = secondTitle
        }
    }
    @IBAction func btnAddNew(_ sender: Any) {

        if let _delegate = delegate {
            
            _delegate.bottomViewWithThreeFilterOptionDidSelect!(self, atIndex: 1)
        }
    }
}

extension BottomViewWithThreeFilterOptions : BottomViewWithSingleFilterOptionDelegate {
    
    func BottomViewWithSingleFilterOptionDidSelect(_ bottomView : BottomViewWithSingleFilterOption) {
 
        switch bottomView {
        case leftFilterOption:
            
            if let _delegate = delegate {
                
                _delegate.bottomViewWithThreeFilterOptionDidSelect!(self, atIndex: 0)
            }
            return
        case rightFilterOption:
            
            if let _delegate = delegate {
                
                _delegate.bottomViewWithThreeFilterOptionDidSelect!(self, atIndex: 2)
            }
            return
        default:
            break
        }
    }
 
}
