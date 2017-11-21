//
//  NoteTableViewController.swift
//  SimpleNote
//
//  Created by yusronadena on 11/21/17.
//  Copyright © 2017 yusron. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    var namaSelected:String?
    var staffSelected:String?
    var IDSelected:String?
    var golonganSelected:String?
    var gajiSelected:String?
    var goodSelected:String?
    
    // deklarasi Variable task sebagai object
    var hotel: [Hotel] = []
    //    var day: [Day] = []
    //    var description: [Descriptions] = []
    //task ini di panggil dari entiti yg sudah di buat tadi
    
    // deklarasi context u/ persistent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hotel.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! YourTableViewCell
        
        // Configure the cell...
        //deklarasi dataTask sebagai index dari task
        let dataTask = hotel[indexPath.row]
        //mengambildata dengan attribute name_Task
        if let myDataTask = dataTask.nama_Hotel{
            //menampilkan data ke label
            cell.labelNameTAsk.text = myDataTask
        }
        if let myDataTask1 = dataTask.alamat_Hotel{
            cell.labelDay.text = myDataTask1
        }
        if let myDataTask2 = dataTask.rate_Hotel{
            cell.labelDescription.text = myDataTask2
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil Relodad data
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada eror atau tidak
        do {
            //kondisi kalo tdk ada eroe
            //maka akan request download data
            hotel = try context.fetch(Hotel.fetchRequest())
        }
        catch {
            print("fetching Failed")
        }
    }
    
    //menambahkan data untuk delete data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //mengecek menu swipenapabila ada editing style nya delede
        let task = hotel[indexPath.row]
        context.delete(task)
        //delete data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        do {
            //retrive data
            hotel = try context.fetch(Hotel.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
        // load data lagi
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let dataTask = hotel[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = dataTask.nama_Hotel
        staffSelected = dataTask.alamat_Hotel
        IDSelected = dataTask.rate_Hotel
        golonganSelected = dataTask.lokasi_terdekat
        gajiSelected = dataTask.fasilitas_Hotel
        goodSelected = dataTask.good_Hotel
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passIsi", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "passIsi"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! DetailViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            kirimData.passMerek = namaSelected
            kirimData.passTampek = staffSelected
            kirimData.passKualitas = gajiSelected
            kirimData.passFasilitas = IDSelected
            kirimData.passLokasi = golonganSelected
            kirimData.passGood = goodSelected
            
        }
    }
    
    
}
