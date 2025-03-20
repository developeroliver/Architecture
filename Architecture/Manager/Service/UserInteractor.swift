//
//  UserInteractor.swift
//  Architecture
//
//

import Foundation

/// Un protocole définissant les interactions liées aux utilisateurs.
protocol UserInteractor {

    /// Récupère la liste des utilisateurs de manière asynchrone.
    /// - Returns: Un tableau d'utilisateurs.
    /// - Throws: Une erreur si la récupération échoue.
    func fetchUsers() async throws -> [User]

    /// Ajoute un nouvel utilisateur de manière asynchrone.
    /// - Parameter user: L'utilisateur à ajouter.
    /// - Throws: Une erreur si l'ajout échoue.
    func addUser(_ user: User) async throws
}
