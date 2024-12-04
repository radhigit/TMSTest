//
//  NetworkManager.swift
//  TMS
//
//  Created by Nagarjuna KR on 12/3/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchusers() async throws -> [WelcomeElement]
}

final class NetworkManager: NetworkManagerProtocol {
    
    func fetchusers() async throws -> [WelcomeElement] {
        guard let url = URL(string: "https://bobsburgers-api.herokuapp.com/characters/?limit=9&skip=6") else { throw URLError(.badURL)}
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else { throw URLError(.badServerResponse)}
        do {
          return  try JSONDecoder().decode(Welcome.self, from: data)
        } catch {
            throw TMSError.invalidData
        }
    }
}

enum TMSError: Error {
    case invalidData
}
