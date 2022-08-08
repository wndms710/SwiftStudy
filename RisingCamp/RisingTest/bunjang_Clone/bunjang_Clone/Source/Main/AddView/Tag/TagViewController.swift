//
//  TagViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/23.
//

import UIKit
import TagListView
import TweeTextField

protocol TagViewControllerDelegate {
    func updateTag()
}

class TagViewController: UIViewController, UITextFieldDelegate, TagListViewDelegate {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        tagListView.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "TagAutoTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "TagAutoTableViewCell")
        
        self.tagList = AddProductInfo.tag
        
//        dismissKeyboardWhenTappedAround()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableViewHeight.constant = tableView.contentSize.height
    }

    
    //MARK: - TagListView
    @IBOutlet weak var tagListView: TagListView! {
        didSet {
            if AddProductInfo.tag.count > 0 {
                for i in 0...AddProductInfo.tag.count-1 {
                    tagListView.addTag(AddProductInfo.tag[i]!)
                }
            }
        }
    }
    
    func addTagInTagListView() {
        if tagListView.tagViews.count < 5 {
            if textField.text?.count != 0 {
                if let text = textField.text {
                    if tagList.contains(text) == false {
                        tagListView.addTag("#\(text)")
                        tagList.append("#\(text)")
//                        print(tagList)
                        textField.text = ""
                        tagImg.isHighlighted = false
                        addBut.isEnabled = false
                    }
                    else {
                        textField.text = ""
                        tagImg.isHighlighted = false
                        addBut.isEnabled = false
                    }
                }
            }
        }
        else {
            presentBottomAlert(message: "태그는 5개 까지만 입력할 수 있어요")
        }
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
//        print(title)
        tagList.remove(at: tagList.firstIndex(of: title)!)
        sender.removeTagView(tagView)
//        print(tagList)
    }
    
    //MARK: - properties
    var delegate: TagViewControllerDelegate?
    
    @IBOutlet weak var tagImg: UIImageView!
    @IBOutlet weak var textField: TweeActiveTextField! {
        didSet {
            textField.becomeFirstResponder()
            textField.addTarget(self, action: #selector(whileEditing), for: .editingChanged)
            textField.addTarget(self, action: #selector(autoCompletion), for: .editingChanged)
        }
    }
    @IBOutlet weak var addBut: UIButton!
    @IBAction func addTextfieldTag(_ sender: Any) {
        addTagInTagListView()
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    var tagList: [String?] = []
    var data: [TagAutoResult?] = []
    
    
    //MARK: - Text field
    @objc func whileEditing(_ sender: UITextField) {
        if sender.text?.count != 0 {
            tagImg.isHighlighted = true
            addBut.isEnabled = true
        }
        else {
            tagImg.isHighlighted = false
            addBut.isEnabled = false
        }
    }
    
    @objc func autoCompletion(_ sender: UITextField) {
        if let text = sender.text {
            if text.count > 0 {
                TagAutoRequest().tagAutoSearch(self, text)
            }
            else {
                data = []
                tableView.reloadData()
                tableViewHeight.constant = tableView.contentSize.height
            }
        }
    }
    
    func didSuccess(_ response: TagAutoResponse) {
        if let result = response.result {
            self.data = result
            tableView.reloadData()
            tableViewHeight.constant = tableView.contentSize.height
        }
    }
    
    
    //MARK: - 키보드 엔터 쳤을 때 태그 생성
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTagInTagListView()
        return true
    }
    
    //MARK: - 뒤로가기 버튼
    @IBAction func tapBackBut(_ sender: Any) {
        AddProductInfo.tag = self.tagList
        delegate?.updateTag()
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension TagViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagAutoTableViewCell", for: indexPath) as! TagAutoTableViewCell
        
        cell.selectionStyle = .none
        
        cell.autoText.text = data[indexPath.row]?.word
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tag = data[indexPath.row]?.word {
            if tagListView.tagViews.count < 5 {
                if tagList.contains(tag) == false {
                    tagListView.addTag("#\(tag)")
                    tagList.append("#\(tag)")
                }
            }
            else {
                presentBottomAlert(message: "태그는 5개 까지만 입력할 수 있어요")
            }
        }
    }
 
    
}
