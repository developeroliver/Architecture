//
//  UserManager.swift
//  Architecture
//
//

import Foundation

/// Un gestionnaire pour gérer les opérations liées aux utilisateurs.
@Observable
class UserManager {

    /// La liste des utilisateurs gérés par ce gestionnaire.
    private(set) var users: [User] = []

    /// Récupère la liste des utilisateurs de manière asynchrone.
    /// - Returns: Un tableau d'utilisateurs.
    /// - Throws: Une erreur si la récupération échoue.
    func fetchUsers() async throws -> [User] {
        // Simule un délai d'attente pour une opération asynchrone.
        try await Task.sleep(nanoseconds: 500_000_000)
        return users
    }

    /// Ajoute un nouvel utilisateur à la liste de manière asynchrone.
    /// - Parameter user: L'utilisateur à ajouter.
    /// - Throws: Une erreur si l'ajout échoue.
    func addUser(_ user: User) async throws {
        users.append(user)
    }
}


