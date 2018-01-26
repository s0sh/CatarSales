//
//  BottomViewWithSingleFilterOption.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

protocol BottomViewWithSingleFilterOptionDelegate {
    
    func BottomViewWithSingleFilterOptionDidSelect(_ bottomView : BottomViewWithSingleFilterOption)
}


@IBDesignable class BottomViewWithSingleFilterOption: UIView {
    
    var view: UIView!
    @IBOutlet weak var lblHeading: UILabel!
    var delegate : BottomViewWithSingleFilterOptionDelegate?
    
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var heading: String? {
        get {
            return lblHeading.text
        }
        set(heading) {
            lblHeading.text = heading
        }
    }
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
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
        let nib = UINib(nibName: "BottomViewWithSingleFilterOption", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    @IBAction func btnSelect(_ sender: Any) {
        
        if let _delegate = delegate {
            
            _delegate.BottomViewWithSingleFilterOptionDidSelect(self)
        }
    }
}
