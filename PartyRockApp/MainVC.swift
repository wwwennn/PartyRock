//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Zhong Wen on 2/3/17.
//  Copyright © 2017 Wen Zhong. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://yt3.ggpht.com/-xGVS7ZNAHak/AAAAAAAAAAI/AAAAAAAAAAA/fLFnngaI9-I/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/6xI6YvUvfVM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Call me maybe")
        let p2 = PartyRock(imageURL: "https://yt3.ggpht.com/-CPuT6u7kiPs/AAAAAAAAAAI/AAAAAAAAAAA/vPJtHM-kkjU/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/uAr6BF7X6oo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Whistle")
        let p3 = PartyRock(imageURL: "https://yt3.ggpht.com/-R1nzsRuJvKg/AAAAAAAAAAI/AAAAAAAAAAA/6lbNHCSrBVw/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/BNuu72V2sEE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Red")
        let p4 = PartyRock(imageURL: "https://yt3.ggpht.com/-HMTvdXrElrY/AAAAAAAAAAI/AAAAAAAAAAA/G_sQig1Ullc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/DP61kUFrI8k\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sorry")
        let p5 = PartyRock(imageURL: "https://yt3.ggpht.com/-F2k-asTfLlM/AAAAAAAAAAI/AAAAAAAAAAA/zcl8JQotOCU/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/A-pVoo6oG5M\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Purple Passion")
        
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}


