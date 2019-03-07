//
//  TableViewController.swift
//  IaidoTracker
//
//  Created by Martin Pittenauer on 3/6/19.
//  Copyright © 2019 Martin Pittenauer. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let groups = ["Tōhō","Seiza","Battō Hō","Battō Hō Okuiai"]
    let katas = [["Maegiri","Zengōgiri","Kiriage","Shihōgiri","Kissakigaeshi"],
                 ["Mae","Migi","Hidari","Ushiro","Yaegaki","Ukenagashi","Kaishaku","Tsukekomi","Tsukikage","Oikaze","Nukiuchi"],
                 ["Juntō sono Ichi","Juntō sono Ni","Tsuigekito","Shatō","Shihōtō sono Ichi","Shihōtō sono Ni","Zantotsutō"],
                 ["Zenteki Gyakutō","Tatekitō","Kōteki Gyakutō","Kōteki Nukiuchi"]]
    
    var kataCount = [String:Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return katas[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groups[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KataCell", for: indexPath) as! KataTableViewCell

        cell.textLabel?.text = ""
        cell.kataNameTitleLabel?.text = katas[indexPath.section][indexPath.row]
        cell.kataNameIdentifier = katas[indexPath.section][indexPath.row]
        let count = Katas.sharedInstance.counter(forKataWith: katas[indexPath.section][indexPath.row])
        cell.stepper.value = Double(count)
        cell.kataCountLabel?.text = "\(count.formattedAsTallyList)"

        return cell
    }

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
