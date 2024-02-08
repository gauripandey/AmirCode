//
//  ViewController.swift
//  TaskAssignment
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stockTv: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var shared = ServerApi.shared
    private var arrData = [Datas]()
    var filteredArr = [Datas]()
    var searching:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            try await shared.fatchAPIData { data in
                DispatchQueue.main.async {
                    self.arrData = data?.data ?? []
                    self.stockTv.reloadData()
                    print(data)
                }
             
            }
        }
        addRefresh()
        // Do any additional setup after loading the view.
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching ?? false){
                return filteredArr.count
            }else{
                return arrData.count
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockTVC", for: indexPath) as! StockTVC
        if(!(searching ?? false)){
            let arr = arrData[indexPath.row]
            cell.btn.tag = indexPath.row
            cell.lblSymbol.text = "Symbol:\(arr.symbol as? String ?? "")"
            cell.lblExc.text = "Exchange:\(arr.exchange as? String ?? "")"
            cell.lblOpen.text = "Open value:\(arr.open as? Double ?? 0.0)"
            cell.btn.addTarget(self, action: #selector(moveToDetailsVC), for: .touchUpInside)
            return cell
              }
        else{
            let arr = filteredArr[indexPath.row]
            cell.btn.tag = indexPath.row
            cell.lblSymbol.text = "Symobol:\(arr.symbol as? String ?? "")"
            cell.lblExc.text = "Exchange:\(arr.exchange as? String ?? "")"
            cell.lblOpen.text = "Open value:\(arr.open as? Double ?? 0.0)"
            cell.btn.addTarget(self, action: #selector(moveToDetailsVC), for: .touchUpInside)
            return cell
              }
       
             
        

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    
}
extension ViewController{
    @objc func moveToDetailsVC(_ sender:UIButton){
        
        if(!(searching ?? false)){
            let tag = sender.tag as? Int ?? 0
            let arr = arrData[tag]
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
            vc.data = arr
    //        vc.lblSymbol.text = "\(arr.high as? Double ?? 0.0)"
            self.navigationController?.pushViewController(vc, animated: true)
              }
        else{
            let tag = sender.tag as? Int ?? 0
            let arr = filteredArr[tag]
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
            vc.data = arr
    //        vc.lblSymbol.text = "\(arr.high as? Double ?? 0.0)"
            self.navigationController?.pushViewController(vc, animated: true)
              }
        
        
       
    }
    
    func addRefresh(){
        let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
      refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
      stockTv.addSubview(refreshControl) // not required when using UITableViewController
   }

   @objc func refresh(_ refreshControl: UIRefreshControl) {
       Task{
           try await shared.fatchAPIData { data in
               DispatchQueue.main.async {
                   self.arrData = data?.data ?? []
                   self.stockTv.reloadData()
                   print(data)
                   refreshControl.endRefreshing()
                   print("done")
               }
            
           }
       }

       
      // Code to refresh table view
   }
    
}
extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          
        if(searchText.isEmpty){
            filteredArr = self.arrData
        }else{
            //            filteredArr = self.arrData.filter{$0.open!.description.lowercased().contains(searchText.lowercased()) || (($0.symbol?.description.lowercased().contains(searchText.lowercased())) != nil)}

            filteredArr = self.arrData.filter{$0.open!.description.lowercased().contains(searchText.lowercased())}
        }
        searching = true
        stockTv.reloadData()
    }
     
}
