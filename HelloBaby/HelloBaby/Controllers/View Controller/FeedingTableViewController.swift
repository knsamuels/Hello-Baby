//
//  FeedingTableViewController.swift
//  HelloBaby
//
//  Created by Kristin Samuels  on 7/15/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit
import CoreData

class FeedingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeedingController.shared.fetchedResultsControler.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedingController.shared.fetchedResultsControler.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedingCell", for: indexPath)
        let feeding = FeedingController.shared.fetchedResultsControler.object(at: indexPath)
        cell.textLabel?.text = "\(feeding.volume)"
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        cell.detailTextLabel?.text = formatter.string(from: feeding.date!)
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let feeding = FeedingController.shared.fetchedResultsControler.object(at: indexPath)
            FeedingController.shared.deleteFeeding(feeding: feeding)
        }
    }
    
    // Mark: Helper functions
    func updateViews() {
        tableView.reloadData()
    }
}

extension FeedingTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            self.tableView.beginUpdates()
        }
        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            self.tableView.endUpdates()
        }
        
        func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
            switch type {
            case .insert:
                guard let newIndexPath = newIndexPath else {return}
                tableView.insertRows(at: [newIndexPath], with: .fade)
            case .delete:
                guard let indexPath = indexPath else {return}
                tableView.deleteRows(at: [indexPath], with: .fade)
            case .move:
                guard let newIndexPath = newIndexPath, let indexPath = indexPath else {return}
                tableView.moveRow(at: indexPath, to: newIndexPath)
            case .update:
                guard let indexPath = indexPath else {return}
                tableView.reloadRows(at: [indexPath], with: .fade)
            @unknown default:
                fatalError()
            }
        }
        func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
            
            switch type {
            case .insert:
                tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
            case .delete:
                tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
            case .move:
                return
            case .update:
                break
            @unknown default:
                fatalError()
            }
        }
        
        
        
    }


