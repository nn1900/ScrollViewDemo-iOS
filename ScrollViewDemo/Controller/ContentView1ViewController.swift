//
//  ContentView1ViewController.swift
//  ScrollViewDemo
//
//  Created by Eric on 2019/11/5.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ContentView1ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    createScrollView()
  }
  
  
  func createScrollView() {
    // create the scroll view
    let scrollView = UIScrollView(frame: self.view.bounds)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(scrollView)
    
    if #available(iOS 11.0, *) {
      NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
        self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
      ])
    } else {
      // Fallback on earlier versions
      NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
        self.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        self.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
      ])
    }
    
    let contentView = UIView()
    scrollView.addSubview(contentView)
    
    // build the content view
    var y: CGFloat = 10
    var maxWidth: CGFloat = 0
    for i in 0..<30 {
      let label = UILabel()
      label.text = "This is a label \(i + 1)"
      label.textColor = .black
      label.sizeToFit()
      label.frame.origin = CGPoint(x: 10, y: y)
      contentView.addSubview(label)
      y += label.bounds.size.height + 10
      maxWidth = max(maxWidth, label.frame.maxX + 10)
    }
    
    contentView.frame = CGRect(x: 0, y: 0, width: maxWidth, height: y)
    scrollView.contentSize = contentView.frame.size
  }
}
