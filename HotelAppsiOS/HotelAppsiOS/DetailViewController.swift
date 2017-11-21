//
//  DetailViewController.swift
//  HotelAppsiOS
//
//  Created by yusronadena on 11/21/17.
//  Copyright © 2017 yusron. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var labelMerek: UILabel!
    @IBOutlet weak var labelTampek: UILabel!
    @IBOutlet weak var labelKualitas: UILabel!
    @IBOutlet weak var labelFasilitas: UILabel!
    @IBOutlet weak var labelLokasi: UILabel!
    @IBOutlet weak var labelGood: UILabel!
    
    
    var passMerek:String?
    var passTampek:String?
    var passKualitas:String?
    var passFasilitas:String?
    var passLokasi:String?
    var passGood:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelMerek.text = passMerek
        labelTampek.text = passTampek
        labelKualitas.text = passKualitas
        labelFasilitas.text = passFasilitas
        labelLokasi.text = passLokasi
        labelGood.text = passGood
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
