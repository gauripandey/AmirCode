//
//  DetailsVC.swift
//  TaskAssignment
//
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblExc: UILabel!
    @IBOutlet weak var lblOpen: UILabel!
    @IBOutlet weak var lblHigh: UILabel!
    @IBOutlet weak var lblLow: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    @IBOutlet weak var lblAdjVolume: UILabel!
    
   private var strSymb = ""
    private  var strExc = ""
    private  var strOpen = ""
    private var strHigh = ""
    private var strLow = ""
    private var strVolume = ""
    private var strAdjVol = ""
    
    var data:Datas?{
        didSet{
            strSymb = data?.symbol as? String ?? ""
            strExc = data?.exchange as? String ?? ""
            strOpen = "\(data?.open as? Double ?? 0.0)"
            strLow = "\(data?.low as? Double ?? 0.0)"
            strHigh = "\(data?.high as? Double ?? 0.0)"
            strVolume = "\(data?.volume as? Double ?? 0.0)"
            strAdjVol = "\(data?.adj_volume as? Double ?? 0.0)"
            
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        // Do any additional setup after loading the view.
    }
  
    

   

}
extension DetailsVC{
    private func updateData(){
        lblSymbol.text = "Symbol:\(strSymb)"
        lblExc.text = "Exchange:\(strExc)"
        lblOpen.text = "Open:\(strOpen)"
        lblHigh.text = "High:\(strHigh)"
        lblLow.text = "Low Value:\(strLow)"
        lblVolume.text = "Total Volume:\(strVolume)"
        lblAdjVolume.text = "Total Adjust Vloume:\(strAdjVol)"
//        lblVolume.text = "Symbol:\(strSymb)"
    }
}
