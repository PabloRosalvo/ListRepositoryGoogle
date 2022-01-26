//                                              
//              .,                                       
//             .****.                                    
//            ,********                                  
//           .***   ,**//.               .(%%%/          
//          .***      .//((*         ,#%%%%%&%           
//         .***          /((#/   *####%%(*%%%            
//        .***              (///(((/    ,%%%             
//       ,***           ,****//#%%%    *%%%              
//      .***        *******.    /%%%%..%%%               
//     ,***    .******,           .%%%%&%                
//    .*** ,******.                  %%%.                
//   ,********                                           
//   ****,                    
//
//  Banco Next - faz acontecer.
//	
//  ViewConfiguration.swift
//  Next-Bradesco
//
//  Created by Pablo Rosalvo on 06/07/21.
//  Copyright © 2021 Banco Bradesco S.A. - Todos os direitos reservados 
//

import Foundation

public protocol ViewConfiguration: AnyObject {
    func setupViews()
    func configureViews()
    func setupViewHierarchy()
    func setupConstraints()
}

extension ViewConfiguration {
    public func setupViews() {
        configureViews()
        setupViewHierarchy()
        setupConstraints()
    }
    
    public func configureViews() {}
    public func setupViewHierarchy() {}
    public func setupConstraints() {}
}
