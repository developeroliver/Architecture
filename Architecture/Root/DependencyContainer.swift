//
//  DependencyContainer.swift
//  Architecture
//
//

import SwiftUI

/// Un conteneur de dépendances pour gérer les services partagés dans l'application.
@Observable
@MainActor
class DependencyContainer {

    /// Un dictionnaire privé pour stocker les services enregistrés.
    private var services: [String: Any] = [:]

    /// Enregistre un service dans le conteneur.
    /// - Parameters:
    ///   - type: Le type du service à enregistrer.
    ///   - service: Une instance du service à enregistrer.
    func register<T>(_ type: T.Type, service: T) {
        let key = "\(type)"
        services[key] = service
    }

    /// Enregistre un service dans le conteneur en utilisant une closure pour créer l'instance.
    /// - Parameters:
    ///   - type: Le type du service à enregistrer.
    ///   - service: Une closure qui retourne une instance du service.
    func register<T>(_ type: T.Type, service: () -> T) {
        let key = "\(type)"
        services[key] = service()
    }

    /// Résout un service enregistré à partir du conteneur.
    /// - Parameters:
    ///   - type: Le type du service à résoudre.
    /// - Returns: Une instance du service si elle est enregistrée, sinon nil.
    func resolve<T>(_ type: T.Type) -> T? {
        let key = "\(type)"
        return services[key] as? T
    }
}
