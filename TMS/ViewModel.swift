//
//  ViewModel.swift
//  TMS
//
//  Created by Nagarjuna KR on 12/3/24.
//

import Foundation


final class ViewModel:ObservableObject {
    
    @Published var users: [WelcomeElement] = []
    var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchUsers() async throws {
        self.users = try await networkManager.fetchusers()
    }
}
