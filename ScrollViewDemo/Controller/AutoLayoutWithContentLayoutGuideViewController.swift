//
//  AutoLayoutWithContentLayoutGuideViewController.swift
//  ScrollViewDemo
//
//  Created by Eric on 2019/11/5.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class AutoLayoutWithContentLayoutGuideViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    if #available(iOS 11.0, *) {
      createScrollView()
    }
  }
  
  
  @available(iOS 11.0, *)
  private func createScrollView() {
    let scrollView = UIScrollView(frame: self.view.bounds)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(scrollView)
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
      self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
    ])
    
    let clg = scrollView.contentLayoutGuide
   
    var prevLabel: UILabel? = nil
    for i in 0..<30 {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "This is a label \(i + 1)"
      label.textColor = .black
      scrollView.addSubview(label)
      
      label.leadingAnchor.constraint(
        equalTo: clg.leadingAnchor, constant: 10
      ).isActive = true
      label.topAnchor.constraint(
        equalTo: prevLabel?.bottomAnchor ?? clg.topAnchor, constant: 10
      ).isActive = true
      
      prevLabel = label
    }
    
    clg.bottomAnchor.constraint(
      equalTo: prevLabel!.bottomAnchor, constant: 10
    ).isActive = true
    
    // clg.widthAnchor.constraint(equalToConstant: 0).isActive = true
    // or:
    clg.widthAnchor.constraint(
      equalTo: scrollView.frameLayoutGuide.widthAnchor
    ).isActive = true
  }
}
