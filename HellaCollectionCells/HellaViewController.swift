//
//  ViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var fibonacciArray = [0,1]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        generateFibonacciSequence()
    }
    
    func generateFibonacciSequence() {
        for number in 0...10_000 {
            if number == fibonacciArray[fibonacciArray.count - 1] + fibonacciArray[fibonacciArray.count - 2] {
                fibonacciArray.append(number)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasicCell", for: indexPath)
        if fibonacciArray.contains(indexPath.row) {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.green
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? HellaDetailViewController,
            let indexPath = collectionView.indexPathsForSelectedItems {
            dest.string = String(describing: indexPath[0][1])
            if let cell = sender as? UICollectionViewCell {
                dest.color = cell.backgroundColor
            }
        }
    }
}



