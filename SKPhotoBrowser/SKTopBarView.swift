//
//  SKTopBarView.swift
//  SKPhotoBrowser
//
//  Created by Багров Дмитрий on 02/02/2017.
//  Copyright © 2017 suzuki_keishi. All rights reserved.
//

import Foundation

class SKTopBarView: UIView {
    
    var showFrame: CGRect!
    
    var hideFrame: CGRect!
    
    var size: CGSize!

    fileprivate(set) var closeButton: SKCloseButton!
    
    fileprivate(set) var deleteButton: SKDeleteButton!
    
    fileprivate var browser: SKPhotoBrowser!
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.showFrame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: 44.0)
        self.hideFrame = CGRect(x: 0.0, y: -44.0, width: frame.width, height: 44.0)
        self.size = CGSize(width: frame.width, height: 44.0)
        self.backgroundColor = SKPhotoBrowserOptions.topBarBackgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(frame: CGRect, browser: SKPhotoBrowser) {
        self.init(frame: frame)
        self.browser = browser
    }
    
    func configureCloseButton() {
        closeButton = SKCloseButton(frame: .zero)
        closeButton.addTarget(browser, action: #selector(SKPhotoBrowser.closeButtonPressed(_:)), for: .touchUpInside)
        closeButton.isHidden = !SKPhotoBrowserOptions.displayCloseButton
        self.addSubview(closeButton)
    }
    
    func configureDeleteButton() {
        deleteButton = SKDeleteButton(frame: .zero)
        deleteButton.addTarget(browser, action: #selector(SKPhotoBrowser.deleteButtonPressed(_:)), for: .touchUpInside)
        deleteButton.isHidden = !SKPhotoBrowserOptions.displayDeleteButton
        self.addSubview(deleteButton)
    }
    
}
