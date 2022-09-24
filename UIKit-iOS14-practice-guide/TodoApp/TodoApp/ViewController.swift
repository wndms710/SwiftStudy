//
//  ViewController.swift
//  TodoApp
//
//  Created by 조주은 on 2022/09/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // AppDelegate에 접근
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todoList = [TodoList]()

    @IBOutlet weak var todoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "To Do List"
        makeNavigationBar()
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
        fetchData()
        todoTableView.reloadData()
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()    // <TodoList>로 타입 지정(Entity 이름)
        let context = appdelegate.persistentContainer.viewContext
        
        do {
            self.todoList = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    func makeNavigationBar() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        

        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 30/255, green: 40/255, blue: 50/255, alpha: 0.3)
        self.navigationController?.navigationBar.standardAppearance = barAppearance
    }
    
    @objc func addNewTodo() {
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.topTitleLabel.text = todoList[indexPath.row].title
        
        if let hasData = todoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = formatter.string(from: hasData)
            cell.dateLabel.text = dateString
        } else {
            cell.dateLabel.text = ""
        }

        return cell
    }
    
    
}
