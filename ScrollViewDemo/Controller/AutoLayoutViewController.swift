//
//  AutoLayoutViewController.swift
//  ScrollViewDemo
//
//  Created by Eric on 2019/11/5.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    createScrollView()
  }
  
  
  private func createScrollView() {
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
    
    // create the sub views of the scroll view
    var prevLabel: UILabel? = nil
    for i in 0..<30 {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "This is a label \(i + 1)"
      label.textColor = .black
      scrollView.addSubview(label)
      
      label.leadingAnchor.constraint(
        equalTo: scrollView.leadingAnchor, constant: 10
      ).isActive = true
      label.topAnchor.constraint(
        equalTo: prevLabel?.bottomAnchor ?? scrollView.topAnchor, constant: 10
      ).isActive = true
      
      prevLabel = label
    }
    
    scrollView.bottomAnchor.constraint(
      equalTo: prevLabel!.bottomAnchor, constant: 10
    ).isActive = true
    
    prevLabel!.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
  }
}
