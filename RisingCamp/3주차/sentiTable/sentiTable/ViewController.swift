//
//  ViewController.swift
//  sentiTable
//
//  Created by 조주은 on 2022/06/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    // 1. http 통신 방법
    // 2. JSON 데이터 형태
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇 개? 숫자
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 무엇? 반복 10번?
        // 2가지!
        // 1번 방법 - 임의의 셀 만들기 : 연습
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Type1")
        
        // 2번 방법 - 스토리보드 + id : 실전
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        // as? as! - 부모 자식 친자확인
        
        cell.LabelText.text = "\(indexPath.row)"

//        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
        
    }

    
    // 옵션 - 클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CLICK !!! \(indexPath.row)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }
    
    
    // tableview 테이블로 된 뷰 - 여러 개의 행이 모여있는 목록 뷰(화면)
    // 정갈하게 보여주려고~ 전화번호부
    
    // 1. 데이터 무엇? - 전화번호부 목록
    // 2. 데이터 몇개? - 100, 1000, 10000
    // 3. (옵션) 데이터 행 눌렀다! - 클릭


}

