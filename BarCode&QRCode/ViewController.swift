//
//  ViewControllerFirst.swift
//  BarCode&QRCode
//
//  Created by Yaroslav Tytechko on 1/18/18.
//  Copyright © 2018 iOSRevisited. All rights reserved.
//

import UIKit
import SafariServices
class ViewController: UIViewController {
    
    @IBOutlet weak var VinFild: UITextField!
    
    
    var stringVin:String?
    var name:String?
    var nameNew:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nameToDisplay = name  {
            VinFild.text = nameToDisplay
        }
        if  VinFild.text == "Scanning...." {
            VinFild.text = ""
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
      
     
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func Search() {
        let vinCode = VinFild.text
        let vinChar = Array(vinCode!)
        
        if  vinCode == "" ||  vinChar.count<17 || vinChar.count>17 {
            UIPasteboard.general.string = vinCode
            let alert = UIAlertController(title: "Wrong Code", message: "Please check vin number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                self.VinFild.text = vinCode
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            UIPasteboard.general.string = vinCode
            let charTre = "\(vinChar[0])\(vinChar[1])\(vinChar[2])"
            // Buick
            if charTre == "1G4" || charTre == "2G4" || charTre == "3G4" || charTre == "5GA" || charTre == "KL4" || charTre == "LSG" || charTre == "W04"{
                let url = URL(string: "https://my.buick.com/recalls?vin="+vinCode!)
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Cadillac
            else if charTre == "1G6" || charTre == "1GY" || charTre == "2G6" || charTre == "2GE" || charTre == "3GG" || charTre == "3GY" || charTre == "XWW" || charTre == "YSC"{
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Chevrolet
            else if charTre == "1G1" || charTre == "1G3" || charTre == "1G4" || charTre == "1G6" || charTre == "1G7" || charTre == "1G8" || charTre == "1GA" || charTre == "1GB" ||
                charTre == "1GC" || charTre == "1GE" || charTre == "1GN" || charTre == "2CN" || charTre == "2G1" || charTre == "2G3" || charTre == "2G4" ||
                charTre == "2G8" || charTre == "2GB" || charTre == "2GC" || charTre == "2GD" || charTre == "2GN" || charTre == "2GT" || charTre == "3G1" ||
                charTre == "3GC" || charTre == "3GN" || charTre == "3N6" || charTre == "6G1" || charTre == "6G3" || charTre == "8AG" || charTre == "8GG" ||
                charTre == "9BG" || charTre == "9GC" || charTre == "AGM" || charTre == "J81" || charTre == "KL1" || charTre == "KL7" || charTre == "KL8" ||
                charTre == "KLN" || charTre == "KLY" || charTre == "LSG" || charTre == "MPA" || charTre == "SUP" || charTre == "X9L" || charTre == "XUF" ||
                charTre == "XUU" || charTre == "XWW" || charTre == "Y6D" || charTre == "2G7" || charTre == "3GB" {
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
                
            }
                //CHRYSLER
            else if charTre == "1A8" || charTre == "1B3" || charTre == "1B4" || charTre == "1B7" || charTre == "1C3" || charTre == "1C3" || charTre == "1C4" || charTre == "1C7" ||
                charTre == "1C8" || charTre == "1C8" || charTre == "1P2" || charTre == "1P3" || charTre == "1P4" || charTre == "1P5" || charTre == "1P6" || charTre == "1P7" ||
                charTre == "1P8" || charTre == "1P9" || charTre == "2A3" || charTre == "2A8" || charTre == "2B3" || charTre == "2B4" || charTre == "2B5" || charTre == "2B6" ||
                charTre == "2B7" || charTre == "2C3" || charTre == "2C4" || charTre == "2C8" || charTre == "2P4" || charTre == "3A8" || charTre == "3B5" ||
                charTre == "3C3" || charTre == "3C4" || charTre == "3P5" || charTre == "8Y3" || charTre == "8Y4" || charTre == "8Y8" || charTre == "9BC" ||
                charTre == "SDA" || charTre == "SDD" || charTre == "VSB" || charTre == "VSC" || charTre == "VSD" || charTre == "WDA" || charTre == "WDD" ||
                charTre == "ZC2"{
                let url = URL(string: "https://www.mopar.com/en-us/my-vehicle/recalls/search.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
                
            }
                //Dodge
            else if charTre == "1B3" || charTre == "1B4" || charTre == "1B6" || charTre == "1C8" || charTre == "1D3" || charTre == "1D4" || charTre == "1D8" || charTre == "2B3" ||
                charTre == "2D4" || charTre == "3B7" || charTre == "3D4" || charTre == "3D7" || charTre == "4D5" || charTre == "SDE" || charTre == "SDG" || charTre == "WD0" ||
                charTre == "WDX"{
                let url = URL(string: "https://www.mopar.com/en-us/my-vehicle/recalls/search.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
                
            }
                //Fisker
                //        else if charTre == "514" || charTre == "YH4" {
                //            let url = URL(string: "https://www.google.com"+vinCode!)
                //            let vc = SFSafariViewController(url: url!)
                //            present(vc, animated: true, completion: nil)
                //        }
                //Ford
            else if charTre == "1F0" || charTre == "1F1" || charTre == "1F6" || charTre == "1F7" || charTre == "1F8" || charTre == "1FA" || charTre == "1FB" || charTre == "1FC" ||
                charTre == "1FD" || charTre == "1FM" || charTre == "1FT" || charTre == "1ZV" || charTre == "1ZW" || charTre == "2FA" || charTre == "2FD" || charTre == "2FM" ||
                charTre == "2FT" || charTre == "3FA" || charTre == "3FB" || charTre == "3FC" || charTre == "3FD" || charTre == "3FE" || charTre == "3FM" || charTre == "3FN" ||
                charTre == "3FR" || charTre == "3FT" || charTre == "3LN" || charTre == "3M9" || charTre == "3MA" || charTre == "3ME" || charTre == "6F1" ||
                charTre == "6FP" || charTre == "6FR" || charTre == "6FS" || charTre == "6FT" || charTre == "6MP" || charTre == "7A5" || charTre == "8AF" ||
                charTre == "8XD" || charTre == "8YP" || charTre == "8YT" || charTre == "93R" || charTre == "9BF" || charTre == "9BT" || charTre == "AFA" ||
                charTre == "AFM" || charTre == "LFA" || charTre == "LFA" || charTre == "LVS" || charTre == "MAJ" || charTre == "MPB" || charTre == "MS3" || charTre == "NM0" ||
                charTre == "PE1" || charTre == "PE2" || charTre == "PE3" || charTre == "PE4" || charTre == "PR8" || charTre == "RHA" || charTre == "RHB" || charTre == "RL0" ||
                charTre == "RL2" || charTre == "RL3" || charTre == "SBC" || charTre == "SFA" || charTre == "SFA" || charTre == "TW2" || charTre == "UN1" ||
                charTre == "VS6" || charTre == "WF0" || charTre == "WF0" || charTre == "WF1" || charTre == "X4F" || charTre == "X9F" || charTre == "XLC" ||
                charTre == "Y4F" || charTre == "YF0" || charTre == "Z6F" || charTre == "ZMJ"  {
                let url = URL(string: "https://owner.ford.com/tools/account/maintenance/recalls/results.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //GMC
            else if charTre == "1G0" || charTre == "1G5" || charTre == "1GA" || charTre == "1GB" || charTre == "1GC" || charTre == "1GD" || charTre == "1GG" || charTre == "1GJ" ||
                charTre == "1GK" || charTre == "1GN" || charTre == "1GT" || charTre == "2GH" || charTre == "2GK" || charTre == "3GD" || charTre == "3GK" || charTre == "3GT" ||
                charTre == "4GD"||charTre=="JSA"{
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
                
            }
                //Jeep
            else if charTre == "1J4" || charTre == "1J8" || charTre == "DA4" || charTre == "Y6D" {
                let url = URL(string: "https://www.mopar.com/en-us/my-vehicle/recalls/search.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Lincoln
            else if charTre == "1L1" || charTre == "1LJ" || charTre == "1LN" || charTre == "2LM" || charTre == "5L1" || charTre == "5LM" || charTre == "5LT"{
                let url = URL(string: "https://owner.ford.com/tools/account/maintenance/recalls.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //SCION
            else if charTre == "JTD" || charTre == "JTK"{
                let url = URL(string: "https://www.toyota.com/recall")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Tesla Motors
            else if charTre == "5YJ" || charTre == "SFZ"{
                let url = URL(string: "https://www.tesla.com/vin-recall-search")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Saleen
            else if charTre == "1S9" || charTre == "1S9"{
                let url = URL(string: "https://www.automd.com/recall-tsb/search?question="+vinCode!)
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Panoz
                //        else if charTre == "1P9" {
                //            let url = URL(string: "https://www.google.com"+vinCode!)
                //            let vc = SFSafariViewController(url: url!)
                //            present(vc, animated: true, completion: nil)
                //        }
                //NISSAN
            else if charTre == "1N4" || charTre == "1N6" || charTre == "1PJ" || charTre == "3N1" || charTre == "3N2" || charTre == "3N3" || charTre == "3N4" || charTre == "3N5" ||
                charTre == "3N6" || charTre == "3N7" || charTre == "3N8" || charTre == "3NP" || charTre == "3T3" || charTre == "4N2" || charTre == "5BZ" || charTre == "5N1" ||
                charTre == "5N2" || charTre == "5N3" || charTre == "5Z6" || charTre == "6F4" || charTre == "7A7" || charTre == "7B2" || charTre == "93B" || charTre == "94D" ||
                charTre == "9F9" || charTre == "9F9" || charTre == "ADN" || charTre == "JN0" || charTre == "JN1" || charTre == "JN2" || charTre == "JN3" ||
                charTre == "JN4" || charTre == "JN5" || charTre == "JN6" || charTre == "JN7" || charTre == "JN8" || charTre == "JNA" || charTre == "JNB" ||
                charTre == "JNC" || charTre == "JND" || charTre == "JNE" || charTre == "JNF" || charTre == "JNL" || charTre == "JNM" || charTre == "JNN" ||
                charTre == "JNP" || charTre == "JNR" || charTre == "JNR" || charTre == "JNS" || charTre == "JNT" || charTre == "JNU" || charTre == "JNV" || charTre == "JNW" ||
                charTre == "JNY" || charTre == "JNZ" || charTre == "JPA" || charTre == "JPB" || charTre == "JPC" || charTre == "JPD" || charTre == "JPE" || charTre == "KNM" ||
                charTre == "LJN" || charTre == "LUD" || charTre == "MDH" || charTre == "MEE" || charTre == "MEK" || charTre == "MN1" || charTre == "MNT" ||
                charTre == "MNT" || charTre == "SA9" || charTre == "SJN" || charTre == "VNV" || charTre == "VSG" || charTre == "VSH" || charTre == "VSJ" ||
                charTre == "VSK" || charTre == "VSL" || charTre == "VT0" || charTre == "VWA" || charTre == "Z8N" {
                let urlOld:String? = "https://www.nhtsa.gov/recalls"
                
                    let url = URL(string: urlOld!  )
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
              
                   
    
            }
                //MERCURY
            else if charTre == "1ME" || charTre == "1MH" || charTre == "1MR" || charTre == "2ME" || charTre == "2MH" || charTre == "2MR" || charTre == "5LT"{
                let url = URL(string: "https://owner.ford.com/tools/account/maintenance/recalls/results.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //MINI
            else if charTre == "WMW"{
                let url = URL(string: "http://www.miniusa.com/content/miniusa/en/owners/tools-support/recall.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //MERCEDES-BENZ
            else if charTre == "1MB" || charTre == "2B1" || charTre == "3AM" || charTre == "3MB" || charTre == "4JG" || charTre == "55S" || charTre == "8AB" || charTre == "8AC" ||
                charTre == "9BM" || charTre == "ADB" || charTre == "AFV" || charTre == "KPA" || charTre == "KPD" || charTre == "KPG" || charTre == "LB1" || charTre == "LE4" ||
                charTre == "LEN" || charTre == "MHL" || charTre == "NAB" || charTre == "NMB" || charTre == "RLM" || charTre == "SVZ" || charTre == "TAW" || charTre == "TWG" ||
                charTre == "VAG" || charTre == "VF9" || charTre == "VS9" || charTre == "VSA" || charTre == "WCD" || charTre == "WD1" || charTre == "WD2" ||
                charTre == "WD3" || charTre == "WD4" || charTre == "WD5" || charTre == "WD8" || charTre == "WD9" || charTre == "WDB" || charTre == "WDC" ||
                charTre == "WDF" || charTre == "WDF" || charTre == "WDP" || charTre == "WDR" || charTre == "WDW" || charTre == "WDZ" || charTre == "WEB" ||
                charTre == "WMX" || charTre == "X89" || charTre == "XDN" || charTre == "XTF" || charTre == "Y6D" || charTre == "Z9M" {
                let url = URL(string: "https://www.mbusa.com/mercedes/recall")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Lexus
            else if charTre == "2T2" || charTre == "JT1" || charTre == "JT6" || charTre == "JT8" || charTre == "JTH" || charTre == "JTJ" {
                let url = URL(string: "http://www.lexus.com/recall/index.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Acura
            else if charTre == "19U" || charTre == "19V" || charTre == "2HH" || charTre == "2HN" || charTre == "2HU" || charTre == "5FR" || charTre == "5FS" || charTre == "5J0" ||
                charTre == "5J8" || charTre == "5KC" || charTre == "JAE" || charTre == "JH4" {
                let url = URL(string: "http://owners.acura.com/service-maintenance/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Audi
            else if charTre == "LFV" || charTre == "TRU" || charTre == "WA1" || charTre == "WAU" || charTre == "WAV" || charTre == "WUA"  {
                let url = URL(string: "http://web.audiusa.com/recall/")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //BMW
            else if charTre == "3AV" || charTre == "4US" || charTre == "5UM" || charTre == "5UX" || charTre == "5YM" || charTre == "7B3" || charTre == "95V" || charTre == "98M" ||
                charTre == "ABM" || charTre == "DAB" || charTre == "LBV" || charTre == "MHH" || charTre == "MMF" || charTre == "PM1" || charTre == "WB1" || charTre == "WB3" ||
                charTre == "WBA" || charTre == "WBS" || charTre == "WBW" || charTre == "WBX" || charTre == "WBY" || charTre == "WBZ" || charTre == "WDM" || charTre == "WDS" ||
                charTre == "WUS" || charTre == "X4A" || charTre == "X4X" || charTre == "ZBA" || charTre == "ZBE" || charTre == "ZBI" || charTre == "ZBM" ||
                charTre == "ZBP" || charTre == "ZBT" || charTre == "ZBV" || charTre == "ZBX" {
                let url = URL(string: "http://www.bmwusa.com/standard/content/owner/safetyrecalls.aspx?mobileoverride=true")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Fiat
            else if charTre == "3C3" || charTre == "3E4" || charTre == "9B0" || charTre == "9BD" || charTre == "9BE" || charTre == "DAA" || charTre == "MAG" || charTre == "NM4" ||
                charTre == "SUF" || charTre == "TSM" || charTre == "XU3" || charTre == "Z76" || charTre == "Z7G" || charTre == "Z88" || charTre == "ZAR" || charTre == "ZF2" ||
                charTre == "ZFA" || charTre == "ZFA" || charTre == "ZFA" || charTre == "ZFB" || charTre == "ZFC" || charTre == "ZFD" || charTre == "ZFF" {
                let url = URL(string: "https://www.fiatusa.com/webselfservice/fiat/Recall.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Honda
            else if charTre == "19X" || charTre == "1HF" || charTre == "1HG" || charTre == "2HG" || charTre == "2HJ" || charTre == "2HK" || charTre == "3CZ" || charTre == "3H1" ||
                charTre == "3HG" || charTre == "478" || charTre == "5FN" || charTre == "5FP" || charTre == "5J6" || charTre == "5J7" || charTre == "5KB" || charTre == "93H" ||
                charTre == "9C2" || charTre == "JH1" || charTre == "JH2" || charTre == "JH3" || charTre == "JH5" || charTre == "JHF" || charTre == "JHG" || charTre == "JHL" ||
                charTre == "JHM" || charTre == "JHN" || charTre == "JHZ" || charTre == "LUC" || charTre == "MB4" || charTre == "MHR" || charTre == "MRH" ||
                charTre == "NFB" || charTre == "NLA" || charTre == "PAD" || charTre == "PKT" || charTre == "PMH" || charTre == "RLH" || charTre == "SAH" ||
                charTre == "SHH" || charTre == "SHS" || charTre == "VTM" || charTre == "YC1" || charTre == "ZDC"  {
                let url = URL(string: "http://owners.honda.com/service-maintenance/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Hummer
            else if charTre == "137" || charTre == "5GN" || charTre == "5GR" || charTre == "5GT" || charTre == "ADM" || charTre == "X4X"  {
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Hyundai
            else if charTre == "2HM" || charTre == "3H3" || charTre == "KM2" || charTre == "KM5" || charTre == "KM6" || charTre == "KM7" || charTre == "KM8" || charTre == "KMC" ||
                charTre == "KME" || charTre == "KMF" || charTre == "KMH" || charTre == "KMJ" || charTre == "KML" || charTre == "KMM" || charTre == "KMN" || charTre == "KMP" ||
                charTre == "KMR" || charTre == "KMX" || charTre == "KMY" || charTre == "KMZ" || charTre == "KN1" || charTre == "KN2" || charTre == "KNH" || charTre == "KNN" ||
                charTre == "KNV" || charTre == "KRT" || charTre == "KRU" || charTre == "MAL" || charTre == "MB2" || charTre == "MC3" || charTre == "NA6" ||
                charTre == "NLH" || charTre == "NLJ" || charTre == "X7M" || charTre == "X89" || charTre == "XU7" || charTre == "Y6L" || charTre == "Z94"  {
                let url = URL(string: "https://autoservice.hyundaiusa.com/Campaignhome/Campaign/VINPageIndex")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Infiniti
            else if charTre == "5N3" || charTre == "JN1" || charTre == "JN8" || charTre == "JNK" || charTre == "JNR" || charTre == "JNX" || charTre == "SJK"  {
                let url = URL(string: "https://www.infinitiusa.com/recalls-vin/#/#/Home")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Isuzu
            else if charTre == "4S3" || charTre == "4S4" || charTre == "9GC" || charTre == "ACU" || charTre == "JAA" || charTre == "JAB" || charTre == "JAC" || charTre == "JAD" ||
                charTre == "JAJ" || charTre == "JAK" || charTre == "JAL" || charTre == "JAM" || charTre == "JAS" || charTre == "LET" || charTre == "MPA" || charTre == "NNA" ||
                charTre == "PAC" || charTre == "RLD" || charTre == "RLE" || charTre == "X91" || charTre == "Y7B" || charTre == "Z8U"  {
                let url = URL(string: "http://www.isuzu.com/landing.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Jaguar
            else if charTre == "SAD" || charTre == "SAJ"   {
                let url = URL(string: "https://www.jaguarusa.com/owners/vin-recall.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Kia
            else if charTre == "5XX" || charTre == "5XY" || charTre == "CGK" || charTre == "KMK" || charTre == "KMX" || charTre == "KNA" || charTre == "KNB" || charTre == "KNC" ||
                charTre == "KND" || charTre == "KNE" || charTre == "KNF" || charTre == "KNG" || charTre == "KNH" || charTre == "KNK" || charTre == "LJD" || charTre == "TMA" ||
                charTre == "U5Y" || charTre == "U6Y" || charTre == "U7Y" || charTre == "X4X" || charTre == "XTK" || charTre == "XWE" || charTre == "XWK" || charTre == "XWW" ||
                charTre == "Y6D" || charTre == "Y6L" || charTre == "Z94" {
                let url = URL(string: "https://www.kia.com/us/en/content/owners/safety-recall")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Land Rover
            else if charTre == "93R" || charTre == "AAD" || charTre == "SAL"  {
                let url = URL(string: "https://www.landroverusa.com/ownership/warranty.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Mazda
            else if charTre == "1YV" || charTre == "1ZW" || charTre == "4F2" || charTre == "4F4" || charTre == "9FA" || charTre == "JM1" || charTre == "JM3" || charTre == "JM7" ||
                charTre == "JMZ" || charTre == "JMZ" || charTre == "LMZ"  {
                let url = URL(string: "https://www.mazdausa.com/owners/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Mazda
            else if charTre == "1YV" || charTre == "1ZW" || charTre == "4F2" || charTre == "4F4" || charTre == "9FA" || charTre == "JM1" || charTre == "JM3" || charTre == "JM7" ||
                charTre == "JMZ" || charTre == "JMZ" || charTre == "LMZ"  {
                let url = URL(string: "https://www.mbusa.com/mercedes/recall"+vinCode!)
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Mitsubishi
            else if charTre == "4A3" || charTre == "4A4" || charTre == "4A7" || charTre == "4AH" || charTre == "4AM" || charTre == "4M3" || charTre == "4M4" || charTre == "4M7" ||
                charTre == "4MA" || charTre == "4MB" || charTre == "4MH" || charTre == "4MM" || charTre == "4P3" || charTre == "6A3" || charTre == "6MM" || charTre == "CS6" ||
                charTre == "J50" || charTre == "JA3" || charTre == "JA4" || charTre == "JA5" || charTre == "JA6" || charTre == "JA7" || charTre == "JB3" || charTre == "JB4" ||
                charTre == "JB5" || charTre == "JB6" || charTre == "JB7" || charTre == "JJ5" || charTre == "JMA" || charTre == "JMB" || charTre == "JMC" ||
                charTre == "JMD" || charTre == "JME" || charTre == "JMF" || charTre == "JMG" || charTre == "JMH" || charTre == "JMJ" || charTre == "JMK" ||
                charTre == "JML" || charTre == "JMM" || charTre == "JMN" || charTre == "JMP" || charTre == "JMR" || charTre == "JMS" || charTre == "JMT" || charTre == "JMU" ||
                charTre == "JMV" || charTre == "JMW" || charTre == "JMX" || charTre == "JMY" || charTre == "JP3" || charTre == "JP4" || charTre == "JP5" || charTre == "JP6" ||
                charTre == "JP7" || charTre == "KA3" || charTre == "KA4" || charTre == "KA7" || charTre == "KAH" || charTre == "KAM" || charTre == "KM3" || charTre == "KMM" ||
                charTre == "KPH" || charTre == "LL6" || charTre == "MMB" || charTre == "MMD" || charTre == "MMT" || charTre == "NLT" || charTre == "RLA" ||
                charTre == "TYB" || charTre == "XMA" || charTre == "XMB" || charTre == "XMC" || charTre == "XMD" || charTre == "Z8T" {
                let url = URL(string: "https://www.mitsubishicars.com/owners/service")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Oldsmobile
            else if charTre == "1G3"  {
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Pontiac
            else if charTre == "1G2" || charTre == "1GM" || charTre == "1NP" || charTre == "2G1" || charTre == "2G2" || charTre == "3G2" || charTre == "3G7" || charTre == "5Y2" ||
                charTre == "6G2" || charTre == "KL2"  {
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Porsche
            else if charTre == "WP0" || charTre == "WP1"  {
                let url = URL(string: "https://recall.porsche.com/prod/pag/vinrecalllookup.nsf/VIN?ReadForm")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Saab
            else if charTre == "3G0" || charTre == "5S3" || charTre == "YK1" || charTre == "YK3" || charTre == "YK9" || charTre == "YS3" {
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Saturn
            else if charTre == "1G8" || charTre == "5GZ"  {
                let url = URL(string: "https://my.gm.com/recalls")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                // smart
            else if charTre == "TCC" || charTre == "WME"  {
                let url = URL(string: "https://www.smartusa.com/recall")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Subaru
            else if charTre == "4S3" || charTre == "4S4" || charTre == "JF1" || charTre == "JF2" || charTre == "JF3" || charTre == "JF4" || charTre == "JFB"{
                let url = URL(string: "https://www.subaru.com/vehicle-recalls.html")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Toyota
            else if charTre == "1NK" || charTre == "1NX" || charTre == "1T1" || charTre == "1TE" || charTre == "2T1" || charTre == "2T3" || charTre == "3RZ" || charTre == "3TM" ||
                charTre == "4T1" || charTre == "4T2" || charTre == "4T3" || charTre == "4T4" || charTre == "4TA" || charTre == "4X2" || charTre == "4X3" || charTre == "4X4" ||
                charTre == "4X6" || charTre == "4X7" || charTre == "4X8" || charTre == "5TB" || charTre == "5TD" || charTre == "5TE" || charTre == "5TF" || charTre == "5X0" ||
                charTre == "5X3" || charTre == "5YF" || charTre == "6FH" || charTre == "6T1" || charTre == "7A4" || charTre == "8AJ" || charTre == "8XA" ||
                charTre == "8XB" || charTre == "9BR" || charTre == "9FH" || charTre == "ACU" || charTre == "AHH" || charTre == "AHT" || charTre == "CA0" ||
                charTre == "CFH" || charTre == "JT1" || charTre == "JT2" || charTre == "JT3" || charTre == "JT4" || charTre == "JT5" || charTre == "JT6" || charTre == "JT7" ||
                charTre == "JT8" || charTre == "JTA" || charTre == "JTB" || charTre == "JTC" || charTre == "JTD" || charTre == "JTE" || charTre == "JTF" || charTre == "JTG" ||
                charTre == "JTJ" || charTre == "JTK" || charTre == "JTL" || charTre == "JTM" || charTre == "JTN" || charTre == "LCU" || charTre == "LFM" || charTre == "LFP" ||
                charTre == "LH1" || charTre == "LTV" || charTre == "LVG" || charTre == "MBJ" || charTre == "MHF" || charTre == "MHK" || charTre == "MR0" ||
                charTre == "MR1" || charTre == "MR2" || charTre == "MX1" || charTre == "NMT" || charTre == "PN1" || charTre == "PN2" ||
                charTre == "PN4" || charTre == "RKL" || charTre == "RL4" || charTre == "SB1" || charTre == "TW0" || charTre == "TW1" || charTre == "VNK" || charTre == "WTD" ||
                charTre == "XW7" {
                let url = URL(string: "https://www.toyota.com/recall")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                // Volkswagen
            else if charTre == "1V1" || charTre == "1VW" || charTre == "2V4" || charTre == "2V8" || charTre == "3VV" || charTre == "3VW" || charTre == "8AV" || charTre == "8AW" ||
                charTre == "8AX" || charTre == "93U" || charTre == "9BW" || charTre == "AAV" || charTre == "W09" || charTre == "W09" || charTre == "WV1" || charTre == "WV2" ||
                charTre == "WV3" || charTre == "WV4" || charTre == "WV5" || charTre == "WV6" || charTre == "WV7" || charTre == "WV8" || charTre == "WVA" || charTre == "WVB" ||
                charTre == "WVC" || charTre == "WVD" || charTre == "WVE" || charTre == "WVF" || charTre == "WVG" || charTre == "WVH" || charTre == "WVJ" ||
                charTre == "WVK" || charTre == "WVL" || charTre == "WVN" || charTre == "WVW" || charTre == "XW8" {
                let url = URL(string: "http://www.vw.com/owners-recalls/")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
                //Volvo
            else if charTre == "3CE" || charTre == "4V2" || charTre == "4V4" || charTre == "4V5" || charTre == "4VG" || charTre == "4VH" || charTre == "9BV" || charTre == "SCV" ||
                charTre == "VS9" || charTre == "XLB" || charTre == "YB1" || charTre == "YB2" || charTre == "YB3" || charTre == "YV1" || charTre == "YV2" || charTre == "YV3" ||
                charTre == "YV4" || charTre == "YV5" || charTre == "YV9" || charTre == "YVZ" {
                let url = URL(string: "https://www.volvocars.com/us/own/additional-choices/recall-information")
                let vc = SFSafariViewController(url: url!)
                present(vc, animated: true, completion: nil)
            }
            else{
                
                let alert = UIAlertController(title: "Wrong Code", message: "Please check vin number", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // Do any additional setup after loading the view.
    
    
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
    @IBAction func searchButtonPressed(_ sender: Any) {
        Search()
        VinFild.text = ""
    }    
}
