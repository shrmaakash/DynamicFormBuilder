//
//  JSONloader.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import Foundation

final class JSONloader {
    
    static func loadForm() throws -> FormResponse{
        
        guard let url = Bundle.main.url(forResource: "Form", withExtension: "json") else
        {
            throw NSError(
                domain: "File Not Found", code: -1
            )
        }
        
        let data = try Data(contentsOf: url)
        
        return try JSONDecoder()
            .decode(FormResponse.self, from: data)
    }
    
}
