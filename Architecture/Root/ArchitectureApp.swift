//
//  ArchitectureApp.swift
//  Architecture
//
//

import SwiftUI

/// L'application principale utilisant le modèle MVVM.
@main
struct ArchitectureApp: App {

    /// Le délégué de l'application, utilisé pour gérer les dépendances et les configurations globales.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    /// La scène principale de l'application.
    var body: some Scene {
        WindowGroup {
            /// La vue principale de l'application, qui utilise un ViewModel pour gérer la logique métier.
            UserView(
                viewModel: UserViewModel(
                    interactor: CoreInteractor(
                        container: delegate.dependencies.container
                    )
                )
            )
            /// Injection des dépendances globales dans l'environnement de la vue.
            .environment(delegate.dependencies.container)
            .environment(delegate.dependencies.userManager)
        }
    }
}

