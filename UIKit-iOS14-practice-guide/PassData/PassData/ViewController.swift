

// passing data (데이터를 넘겨주는 방법)
// 6가지

// 1. instance property
// 2. segue
// 3. instance


import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
    
}

