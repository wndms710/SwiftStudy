//
//  TodoDetailViewController.swift
//  TodoApp
//
//  Created by 조주은 on 2022/09/25.
//

import UIKit
import CoreData


protocol TodoDetailViewControllerDelegate: AnyObject { // weak를 설정하려면 AnyObject로 설정해야함
    func didFinishSaveDate()
}

class TodoDetailViewController: UIViewController {
    
    weak var delegate: TodoDetailViewControllerDelegate?

    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedTodoList: TodoList?
    
    var priority: PrioirityLevel?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    @IBAction func setPrioirity(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            priority = .level1
        case 2:
            priority = .level2
        case 3:
            priority = .level3
        default:
            break
        }
        
        makePriorityButonDesign()
    }
    
    func makePriorityButonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch self.priority {
        case .level1:
            lowButton.backgroundColor = priority?.color
        case .level2:
            normalButton.backgroundColor = priority?.color
        case .level3:
            highButton.backgroundColor = priority?.color
        default:
            break
        }
    }
    
    
    @IBAction func saveTodo(_ sender: Any) {
        
        if selectedTodoList != nil {
            updateTodo()
        } else {
            saveTodo()
        }
        
        delegate?.didFinishSaveDate()
        self.dismiss(animated: true)
    }
    
    
    func saveTodo() {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else { return }
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else { return }
        
        object.title = self.titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        
        object.prioirtyLevel = self.priority?.rawValue ?? PrioirityLevel.level1.rawValue
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.saveContext()
    }
    
    
    func updateTodo() {
        
        guard let hasData = selectedTodoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
 
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        
        do {
            let loadedData = try context.fetch(fetchRequest)
            
            loadedData.first?.title = titleTextField.text
            loadedData.first?.date = Date()
            loadedData.first?.prioirtyLevel = self.priority?.rawValue ?? PrioirityLevel.level1.rawValue
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.saveContext()
        } catch {
            print(error)
        }
    }
    
    @IBAction func deleteTodo(_ sender: UIButton) {
        guard let hasData = selectedTodoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
 
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        
        do {
            let loadedData = try context.fetch(fetchRequest)
            
            if let loadFirstData = loadedData.first {
                context.delete(loadFirstData)
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.saveContext()
            }
            
        } catch {
            print(error)
        }
        
        delegate?.didFinishSaveDate()
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedTodoList {
            titleTextField.text = hasData.title
            
            priority = PrioirityLevel(rawValue: hasData.prioirtyLevel)
            makePriorityButonDesign()
            
            deleteButton.isHidden = false
            saveButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
            saveButton.setTitle("Save", for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = lowButton.bounds.height / 2
        highButton.layer.cornerRadius = lowButton.bounds.height / 2
    }

}
