//
//  serverApi.swift
//  TaskAssignment
//
//

import Foundation

final class ServerApi{
    static var shared = ServerApi()
    let session = URLSession.shared
    /*
    func fatchAPIData(compl:@escaping((TotalData?)->Void))async{
       
        guard let url = URL(string: urlStr) else{
            compl(nil)
            return
        }
        do{
            let (data,_) = try await session.data(from: url)
            print(data)
            let jsonData = try JSONDecoder().decode(TotalData.self, from: data)
            compl(jsonData)
//            fetchServerData.apiRecords = jsonData.data!
           
        }catch{
            compl(nil)
        }
    }

    */
   
  
    
    func fatchAPIData(compl:@escaping (TotalData?)->Void)async{
        let strUrl = urlStr
        guard let url = URL(string: strUrl) else{
            compl(nil)
            return}
        do{
            let (data,_) = try await session.data(from: url)
            let jsonData = try JSONDecoder().decode(TotalData.self, from: data)
            compl(jsonData)
//           print(jsonData)
//            print(fetchServerData.apiRecords)
        }
        catch{
            compl(nil)
            print(error.localizedDescription)
        }
        
    }
   
    }





