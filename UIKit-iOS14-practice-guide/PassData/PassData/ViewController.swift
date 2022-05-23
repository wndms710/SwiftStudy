

// passing data (데이터를 넘겨주는 방법)
// 6가지

// 1. instance property
// 2. segue
// 3. instance
// 4. delegate (delegation) pattern 대리 위임 대신
// 5. closure
// 6. Notification

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("sendSomeString")
        // OS에서 기본적으로 앱에 계속 감지하거나 할 수 있게 만들어 놓은 기능
        // observer : 계속 감시할 수 있는 구현부를 만드는 것
        // showSomeString을 감시
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        // 한 번 쓰고 필요 없는 상황이 생길 때
//        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
        
    }
    // 키보드가 나타나는 순간
    @objc func keyboardWillShow() {
        print("will show")
    }
    @objc func keyboardDidShow() {
        print("did show")
    }

    
    @objc func showSomeString(notification: Notification) {
        // 해당 타입이 String으로 casting 되는지 확인을 해서 casting이 되면, str은 String이 되고 이를 화면에 뿌려준다.
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str

        }
    }
    
    
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
//                detailVC.dataLabel.text = "abcd"      // 직접 접근은 좋지 않음
                detailVC.dataString = "abcd"
            }
        }
    }

    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
//        detailVC.someString = "aaa 스트링"
        
        self.present(detailVC, animated: true, completion: nil)
        
        detailVC.someLabel.text = "bb"
    }
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)

        detailVC.mainVC = self          // 나 자신을 넘겨줌

        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DeletageDetailViewController(nibName: "DeletageDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        // 구현부
        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToNoti(_ sender: Any) {
        
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        
        self.present(detailVC, animated: true, completion: nil)
    }
}
// 밑 protocol을 준수해야 self와 연결 가능
extension ViewController: DeletageDetailViewControllerDelegate {
    // 구현부는 여기에
    func passString(string: String) {
        self.dataLabel.text = string
    }
    
}
