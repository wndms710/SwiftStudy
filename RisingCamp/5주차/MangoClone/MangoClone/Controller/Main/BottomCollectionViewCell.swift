//
//  BottomCollectionViewCell.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/12.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var restData: [Item] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cell = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "ListCollectionViewCell")
    }

}

extension BottomCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        restData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.name.text = "\(indexPath.item). \(self.restData[indexPath.item].title)"
//            do {
//                let data = try Data(contentsOf: URL(string: self.restData[indexPath.item].firstimage)!)
//                cell.imgView.image = UIImage(data: data)
//            }
//            catch {
//                print(error)
//            }
       // Data는 background
        if let data = try? Data(contentsOf: URL(string: self.restData[indexPath.item].firstimage)!) {
           //Main Thread
           DispatchQueue.main.async {
               cell.imgView.image = UIImage(data: data)
           }
       }
       cell.readCount.text = "\(self.restData[indexPath.item].readcount)"
        cell.place.text = self.restData[indexPath.item].addr1
//           print(indexPath.item)
        cell.grade.text = "\(round(Double.random(in: 3.2...4.3)*10)/10)"
        cell.blog.text = "\(Int.random(in: 5...50))"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: (width-30) / 2 , height: height * 0.34)
    }
}
