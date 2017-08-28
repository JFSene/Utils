//
//  APIRouter.swift
//  NetworkingArchitectureExample
//
//  Created by Guilherme Souza on 4/4/17.
//  Copyright © 2017 Guilherme Souza. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter {
    
    // Aqui vai a URL base das chamadas à API
    static let baseURL = "https://url_base.com/"
    
    // Aqui são todas as rotas, podem ser passados parâmetros, como: ID, tokens p/ paginação entre outras coisas.
    case login(email: String, password: String)
}

extension APIRouter: URLRequestConvertible {
    
    // Esta função constroe a requisição para cada rota
    func asURLRequest() throws -> URLRequest {
        
        // Aqui são definidos o método http para cada rota.
        var method: HTTPMethod {
            switch self {
            case .login:
                return .post
            }
        }
        
        // Aqui são os parâmetros para cada rota, caso não tenha parâmetro retorne nil.
        var params: [String: Any]? {
            switch self {
            case let .login(email, password):
                return ["email": email, "password": password]
            }
        }
        
        // Aqui é a URL para cada rota.
        var url: URL {
            var relativePath: String
            
            switch self {
            case .login:
                relativePath = "login"
            }
            
            var url = URL(string: APIRouter.baseURL)!
            url.appendPathComponent(relativePath)
            return url
        }
        
        // Aqui é o token de autenticação da API, caso a rota não precise de autenticação, retorne nil.
        var authToken: String? {
            switch self {
            default:
                return "Basic T0FQUkRfT0FQUkRfTU9CSUxFX0FOT05ZTU9VU19BUFBJRDp5bjY3dHN5YnVwX2xQaA=="
            }
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let authToken = authToken {
            urlRequest.addValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        // O encoding define como os parâmetros serão enviados.
        // JSONEncoding = Enviados no Body da requisição como JSON
        // URLEncoding = Enviados como parâmetros de URL.
        var encoding: ParameterEncoding {
            switch self {
            case .login:
                return JSONEncoding.default
            }
        }
        return try encoding.encode(urlRequest, with: params)
    }
    
}
