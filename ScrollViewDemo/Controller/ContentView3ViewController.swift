//
//  ContentView3ViewController.swift
//  ScrollViewDemo
//
//  Created by Eric on 2019/11/5.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ContentView3ViewController: UIViewController {
  
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
    var prevLabel: UILabel? = nil
    for i in 0..<30 {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "This is a label \(i + 1)"
      label.textColor = .black
      contentView.addSubview(label)
      
      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
      label.topAnchor.constraint(
        equalTo: prevLabel?.bottomAnchor ?? contentView.topAnchor, constant: 10
      ).isActive = true
      
      prevLabel = label
    }
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    // pin content view to scroll view, sized by its subview constraints
    if #available(iOS 11.0, *) {
      let clg = scrollView.contentLayoutGuide
      NSLayoutConstraint.activate([
        contentView.topAnchor.constraint(equalTo: clg.topAnchor),
        clg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        contentView.leadingAnchor.constraint(equalTo: clg.leadingAnchor),
        clg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
      ])
    } else {
      NSLayoutConstraint.activate([
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
      ])
    }
    
    // need to do something about width
    contentView.trailingAnchor.constraint(
      equalTo: prevLabel!.trailingAnchor, constant: 10
    ).isActive = true
    
    // last one, pin to bottom, this dictates content size height
    contentView.bottomAnchor.constraint(
      equalTo: prevLabel!.bottomAnchor, constant: 10
    ).isActive = true
  }
}
