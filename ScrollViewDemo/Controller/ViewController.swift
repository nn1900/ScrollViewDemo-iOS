//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Eric on 2019/11/5.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

fileprivate struct Item {
  let id: String
  let title: String
  
  init(_ id: String, _ title: String) {
    self.id = id
    self.title = title
  }
}

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  private let items: [Item] = [
    Item("manualLayout", "Manual Layout"),
    Item("autoLayout", "Auto Layout"),
    Item("autoLayoutWithContentLayoutGuide", "Auto Layout With Content Layout Guide"),
    Item("contentView1", "Content View (No Constraints)"),
    Item("contentView2", "Content View Constraints"),
    Item("contentView3", "Content View and Content Constraints"),
    Item("contentView4", "Content Constraints Only")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let identifier = segue.identifier else {
      return
    }
    guard let index = items.firstIndex(where: { $0.id == identifier }) else {
      return
    }
    let item = items[index]
    segue.destination.title = item.title
  }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let item = items[indexPath.row]
    cell.textLabel?.text = item.title
    cell.accessoryType = .disclosureIndicator

    return cell
  }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    self.performSegue(withIdentifier: item.id, sender: self)
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
