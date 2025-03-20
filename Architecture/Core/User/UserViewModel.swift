//
//  UserViewModel.swift
//  Architecture
//
//

import SwiftUI

/// Extension pour que `CoreInteractor` se conforme au protocole `UserInteractor`.
extension CoreInteractor: UserInteractor { }

/// Le ViewModel pour gérer la logique métier de la vue utilisateur.
@Observable
@MainActor
class UserViewModel {
    
    /// L'interacteur utilisé pour effectuer les opérations liées aux utilisateurs.
    private let interactor: UserInteractor
    
    /// La liste des utilisateurs chargés.
    var users: [User] = []
    
    /// Le nom de l'utilisateur à ajouter.
    var name: String = ""
    
    /// L'âge de l'utilisateur à ajouter, sous forme de chaîne de caractères.
    var age: String = ""
    
    /// Message d'erreur pour la validation des champs.
    var errorMessage: String?
    
    /// Initialise le ViewModel avec un interacteur.
    /// - Parameter interactor: L'interacteur utilisé pour les opérations liées aux utilisateurs.
    init(interactor: UserInteractor) {
        self.interactor = interactor
    }
    
    /// Charge la liste des utilisateurs de manière asynchrone.
    func loadUsers() async {
        do {
            users = try await interactor.fetchUsers()
        } catch {
            print("Erreur lors de la récupération des utilisateurs : \(error)")
        }
    }
    
    /// Ajoute un nouvel utilisateur de manière asynchrone.
    /// - Parameters:
    ///   - name: Le nom de l'utilisateur à ajouter.
    ///   - age: L'âge de l'utilisateur à ajouter.
    func addUser(name: String, age: Int) async {
        let newUser = User(id: UUID(), name: name, age: age)
        do {
            try await interactor.addUser(newUser)
            users.append(newUser)
        } catch {
            print("Erreur lors de l'ajout d'un utilisateur : \(error)")
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}
