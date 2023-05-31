//
//  TableViewController.swift
//  Persons Info
//
//  Created by Диас Нургалиев on 31.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayPerson = [Persons(name: "Dias", surname: "Nurgaliev",info: "My name is Dias. I am currently studying at Kazakh-British Technical University. In my free time I like to play guitar. My favorite series is The boys. ", imagename: "dias"),
                       Persons(name: "Nurtilek", surname: "Turdymuratov",info: "My name is Nurtilek. I am studying at Kazakh-British Technical University and finished 1st year. In my free time I like to read interesting books. My chilhood hobby is play to footbal.", imagename: "nurtilek"),
                       Persons(name: "Nurbek", surname: "Sailau",info: "My name is Nurbek. I am currently studying at KazNU university. In my free time I like to play CS-GO with my friend Ardak. Also, I like to go interesting places.", imagename: "nurbek"),
                       Persons(name: "Arslan", surname: "Koshimov",info: "My name is Arslan. I am studying at Kazakh-British Technical University. In my free time I like to play Dota 2. Also I like to watch funny shows such as ЧБД.", imagename: "arslan")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addPerson(_ sender: Any) {
        arrayPerson.append(Persons(name: "New name", surname: "New surname", info: "Unknown person. Information about this person is not available.", imagename: "avatar"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPerson.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let labelName = cell.viewWithTag(1000) as!UILabel
        labelName.text = "\(arrayPerson[indexPath.row].name)"
        
        let labelSurname = cell.viewWithTag(1001) as! UILabel
        labelSurname.text = "\(arrayPerson[indexPath.row].surname)"
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayPerson[indexPath.row].imagename)

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVC.name = arrayPerson[indexPath.row].name
        detailVC.surname = arrayPerson[indexPath.row].surname
        detailVC.info = arrayPerson[indexPath.row].info
        detailVC.imagename = arrayPerson[indexPath.row].imagename
        
        navigationController?.show(detailVC, sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayPerson.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
