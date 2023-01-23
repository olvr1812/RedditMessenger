//
//  Router.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 17.01.2023.
//

import Foundation
import UIKit

protocol RouterMainProtocol {
    var assamblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {

}

class Router: RouterProtocol {
    
    var assamblyBuilder: AssemblyBuilderProtocol?
    
    init(assamblyBuilder: AssemblyBuilderProtocol) {
        self.assamblyBuilder = assamblyBuilder
    }
    
}
