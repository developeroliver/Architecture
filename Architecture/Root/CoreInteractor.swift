//
//  CoreInteractor.swift
//  Architecture
//
//

import Foundation

/// Un intermédiaire pour gérer les interactions avec les services de base de l'application.
@MainActor
class CoreInteractor {

    /// Le gestionnaire d'utilisateurs utilisé pour effectuer des opérations liées aux utilisateurs.
    let userManager: UserManager

    /// Initialise l'intermédiaire avec un conteneur de dépendances.
    /// - Parameter container: Le conteneur de dépendances contenant les services nécessaires.
    init(container: DependencyContainer) {
        self.userManager = container.resolve(UserManager.self)!
    }

    /// Récupère la liste des utilisateurs de manière asynchrone.
    /// - Returns: Un tableau d'utilisateurs.
    /// - Throws: Une erreur si la récupération échoue.
    func fetchUsers() async throws -> [User] {
        try await userManager.fetchUsers()
    }

    /// Ajoute un nouvel utilisateur de manière asynchrone.
    /// - Parameter user: L'utilisateur à ajouter.
    /// - Throws: Une erreur si l'ajout échoue.
    func addUser(_ user: User) async throws {
        try await userManager.addUser(user)
    }
}
