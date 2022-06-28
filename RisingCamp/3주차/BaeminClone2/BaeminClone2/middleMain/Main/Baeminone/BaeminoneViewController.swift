//
//  BaeminoneViewController.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/26.
//

import UIKit
import CoreData

class BaeminoneViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var storeDataList: [StoreData] = []
    
//    var resultArray: [NSManagedObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        do {
//            resultArray = try readCoreData()
//        } catch {
//            print(error)
//        }
        
        tableView.delegate = self
        tableView.dataSource = self

        storeDataList.append(StoreData("store1", "꽉찬소곱창 연신내점", "4.9", "17~27분", "24,000원", "3,000원", "1.2km"))
        storeDataList.append(StoreData("store2", "30년 불멸의 닭발", "5.0", "16~26분", "5,000원", "무료", "1.2km"))
        storeDataList.append(StoreData("store3", "매우당매운갈비찜", "5.0", "18~28분", "14,000원", "1,900원~2,500원", "0.7km"))
        storeDataList.append(StoreData("store4", "구구족 연신내점", "4.9", "17~27분", "25,000원", "1,900원", "0.5km"))
        storeDataList.append(StoreData("store5", "부산아지매국밥 연신내점", "4.7", "17~27분", "12,000원", "2,500원", "0.5km"))
        storeDataList.append(StoreData("store6", "짜글이용사 성공담", "4.9", "18~28분", "8,000원", "0원~3,000원", "0.6km"))

        
        let bannerCell = UINib(nibName: "TopBannerTableViewCell", bundle: nil)
        tableView.register(bannerCell, forCellReuseIdentifier: "TopBannerTableViewCell")
        
        let middelCell = UINib(nibName: "MiddelMenuTableViewCell", bundle: nil)
        tableView.register(middelCell, forCellReuseIdentifier: "MiddelMenuTableViewCell")
        
        let snsCell = UINib(nibName: "SnsgoodTableViewCell", bundle: nil)
        tableView.register(snsCell, forCellReuseIdentifier: "SnsgoodTableViewCell")
        
        let storeCell = UINib(nibName: "StoreTableViewCell", bundle: nil)
        tableView.register(storeCell, forCellReuseIdentifier: "StoreTableViewCell")
    
    }

//    @IBAction func btnAddAction(_ sender: Any) {
//        let alert = UIAlertController(title: "Add", message: "단위까지 작성", preferredStyle: .alert)
//        alert.addTextField { textField in
//            textField.placeholder = "최소 주문 금액"
//        }
//        alert.addTextField { textField in
//            textField.placeholder = "배달팁"
//        }
//        alert.addTextField { textField in
//            textField.placeholder = "배달 소요 시간"
//        }
//
//        // 추가
//        let ok = UIAlertAction(title: "OK", style: .default) { action in
//            _ = self.saveCoreData(time: (alert.textFields?[2].text)!, minumum: (alert.textFields?[0].text)!, tip: (alert.textFields?[1].text)!)
//            do {
//                self.resultArray = try self.readCoreData()
//            } catch {
//                print(error)
//            }
//            self.tableView.reloadData()
//        }
//        alert.addAction(ok)
//        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
}

extension BaeminoneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return resultArray!.count
        return storeDataList.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopBannerTableViewCell", for: indexPath) as! TopBannerTableViewCell
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MiddelMenuTableViewCell", for: indexPath) as! MiddelMenuTableViewCell
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SnsgoodTableViewCell", for: indexPath) as! SnsgoodTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
            
            let storeData: StoreData = storeDataList[indexPath.row - 3]
            
            cell.imgView.image = storeData.image
            cell.name.text = storeData.storeName
            cell.grade.text = storeData.grade
            cell.time.text = storeData.time
            cell.minimun.text = storeData.minimum
            cell.tip.text = storeData.tip
            cell.distance.text = storeData.distance
            
//            cell.update(object: resultArray![indexPath.row])
            
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let alert = UIAlertController(title: "Update", message: "단위까지 작성", preferredStyle: .alert)
//        alert.addTextField { textField in
//            textField.placeholder = "최소 주문 금액"
//        }
//        alert.addTextField { textField in
//            textField.placeholder = "배달팁"
//        }
//        alert.addTextField { textField in
//            textField.placeholder = "배달 소요 시간"
//        }
//
//        // 업데이트
//        let ok = UIAlertAction(title: "OK", style: .default) { action in
//            _ = self.updateCoreData(object: self.resultArray![indexPath.row], time: (alert.textFields?[2].text)!, minumum: (alert.textFields?[0].text)!, tip: (alert.textFields?[1].text)!)
//            self.tableView.reloadData()
//        }
//
//        alert.addAction(ok)
//        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
    
//    // 왼쪽 슬라이드 삭제 버튼
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            _ = deleteCoreData(object: resultArray![indexPath.row])
//            do {
//                self.resultArray = try self.readCoreData()
//            } catch {
//                print(error)
//            }
//            self.tableView.reloadData()
//        }
//    }
    
//     header view 없애기
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
}

// cell 크기
extension BaeminoneViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tableView.frame.size.height * 0.23
        }
        else if indexPath.row == 1 {
            return tableView.frame.size.height * 0.4
        }
        else if indexPath.row == 2 {
            return tableView.frame.size.height * 0.47
        }
        else {
            return tableView.frame.size.height * 0.4
        }
    }
}


// CRUD
extension BaeminoneViewController {
    // create
    func saveCoreData(time: String, minumum: String, tip: String) -> Bool {
        // App Delegate 호출
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        // App Delegate 내부에 있는 viewContext 호출
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // managedContext 내부에 있는 enetity 호출
        let userEntity = NSEntityDescription.entity(forEntityName: "StoreCRUD", in: managedContext)!
        
        // enetity 객체 설정
        let object = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        // 값 설정
        object.setValue(time, forKey: "time")
        object.setValue(minumum, forKey: "minimum")
        object.setValue(tip, forKey: "tip")
        
        do {
            // managedContext 내부의 변경사항 저장
            try managedContext.save()
            return true
        } catch let error as NSError {
            // 에러 발생 시
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
    
    // read
    func readCoreData() throws -> [NSManagedObject]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Entity의 fetchRequest 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StoreCRUD")
        
        do {
            // fetchRequest를 통해 managedContext로부터 결과 배열을 가져오기
            let resultCDArray = try managedContext.fetch(fetchRequest)
            return resultCDArray
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            throw error
        }
    }
    
    // Delete
    func deleteCoreData(object: NSManagedObject) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 객체를 넘기고 바로 삭제
        managedContext.delete(object)
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
            return false
        }
    }
    
    // Update
    func updateCoreData(object: NSManagedObject, time: String, minumum: String, tip: String) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            object.setValue(time, forKey: "time")
            object.setValue(minumum, forKey: "minimum")
            object.setValue(tip, forKey: "tip")
            
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
            return false
        }
    }
}
