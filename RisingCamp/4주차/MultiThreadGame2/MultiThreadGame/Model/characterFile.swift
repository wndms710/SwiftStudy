//
//  characterFile.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/03.
//

import Foundation
import UIKit

class CharacterFile  {
    var image: UIImage?
    var sketch: UIImage?
    var word: [String]?
    
    init(image: UIImage, sketch: UIImage, word: [String]) {
        self.image = image
        self.sketch = sketch
        self.word = word
    }

}
