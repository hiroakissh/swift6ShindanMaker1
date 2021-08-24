//
//  FeedViewController.swift
//  swift6ShindanMaker1
//
//  Created by HiroakiSaito on 2021/08/24.
//

import UIKit
import BubbleTransition
import Firebase
import SDWebImage
import ViewAnimator
import FirebaseFirestore

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    var intractiveTransition:BubbleInteractiveTransition?
    
    
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    
    var feeds:[Feeds] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        
        tableView.separatorStyle = .none

        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        //投稿されたものを受信する
        db.collection("feed").order(by: "createAt").addSnapshotListener { (snapShot,error) in
            
            self.feeds = []
            if error != nil{
                print(error.debugDescription)
                return
            }
            
            if let snapShotDoc = snapShot?.documents{
                
                for doc in snapShotDoc{
                    
                    let data = doc.data()
                    if let userName = data["userName"] as? String, let quote = data["quote"] as? String, let photoURL = data["photoURL"] as? String{
                        
                        let newFeeds = Feeds(userName: userName, quote: quote, profileURL: photoURL)
                        self.feeds.append(newFeeds)
                        self.feeds.reverse()
                        DispatchQueue.main.async {
                            self.tableView.tableFooterView = nil
                            self.tableView.reloadData()
                            
                        }
                        
                        
                        
                    }
                    
                }
                
            }
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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