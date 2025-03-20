//
//  Dependencies.swift
//  Architecture
//
//

import SwiftUI

/// Une structure pour gérer les dépendances globales de l'application.
@MainActor
struct Dependencies {

    /// Le conteneur de dépendances partagé.
    let container: DependencyContainer

    /// Le gestionnaire d'utilisateurs partagé.
    let userManager: UserManager

    /// Initialise les dépendances globales.
    init() {
        userManager = UserManager()

        let container = DependencyContainer()
        container.register(UserManager.self, service: userManager)
        self.container = container
    }
}

extension View {
    /// Configure l'environnement de prévisualisation pour une vue.
    /// - Returns: La vue avec l'environnement de prévisualisation configuré.
    func previewEnvironment() -> some View {
        self
            .environment(UserManager())
    }
}

/// Une classe pour fournir des dépendances pour les prévisualisations de développement.
@MainActor
class DevPreview {

    /// L'instance partagée de `DevPreview`.
    static let shared = DevPreview()

    /// Le conteneur de dépendances pour les prévisualisations.
    let container: DependencyContainer

    /// Le gestionnaire d'utilisateurs pour les prévisualisations.
    let userManager: UserManager

    /// Initialise les dépendances pour les prévisualisations de développement.
    init() {
        self.userManager = UserManager()

        let container = DependencyContainer()
        container.register(UserManager.self, service: userManager)
        self.container = container
    }
}
