//
//  User.swift
//  Architecture
//
//

import Foundation

/// Une structure représentant un utilisateur avec des propriétés identifiables et codables.
struct User: Identifiable, Codable, Hashable {

    /// L'identifiant unique de l'utilisateur.
    let id: UUID

    /// Le nom de l'utilisateur.
    var name: String

    /// L'âge de l'utilisateur.
    var age: Int

    /// Initialise un nouvel utilisateur avec un identifiant, un nom et un âge.
    /// - Parameters:
    ///   - id: L'identifiant unique de l'utilisateur.
    ///   - name: Le nom de l'utilisateur.
    ///   - age: L'âge de l'utilisateur.
    init(
        id: UUID,
        name: String,
        age: Int
    ) {
        self.id = id
        self.name = name
        self.age = age
    }
}


