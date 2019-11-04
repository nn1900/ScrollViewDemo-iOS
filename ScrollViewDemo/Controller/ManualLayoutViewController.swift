//
//  ManualLayoutViewController.swift
//  ScrollViewDemo
//
//  Created by Eric on 2019/11/5.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ManualLayoutViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    createScollView()
  }
  
  
  private func createScollView() {
    // create the scroll view
    let scrollView = UIScrollView(frame: self.view.bounds)
    scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    self.view.addSubview(scrollView)
    
    // create the sub views of the scroll view
    var y: CGFloat = 10
    for i in 0..<30 {
      let label = UILabel()
      label.text = "This is a label \(i + 1)"
      label.textColor = .black
      label.sizeToFit()
      label.frame.origin = CGPoint(x: 10, y: y)
      scrollView.addSubview(label)
      y += label.bounds.size.height + 10
    }
    
    var size = scrollView.bounds.size
    size.height = y
    scrollView.contentSize = size
  }
}
