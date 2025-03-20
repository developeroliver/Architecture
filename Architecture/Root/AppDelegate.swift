//
//  AppDelegate.swift
//  Architecture
//
//

import SwiftUI

/// Le délégué de l'application pour gérer les événements du cycle de vie de l'application.
class AppDelegate: NSObject, UIApplicationDelegate {

    /// Les dépendances globales de l'application.
    var dependencies: Dependencies!

    /// Appelé lorsque l'application a terminé son lancement.
    /// - Parameters:
    ///   - application: L'application qui a été lancée.
    ///   - launchOptions: Un dictionnaire indiquant les raisons du lancement de l'application et fournissant les données d'initialisation correspondantes.
    /// - Returns: `true` si l'application a terminé son lancement, sinon `false`.
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        // Initialise les dépendances globales de l'application.
        dependencies = Dependencies()

        return true
    }
}

