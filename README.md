# Architecture

![Swift Version](https://img.shields.io/badge/Swift-5.7-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg)

## Description

**[Nom de votre application]** est une application iOS développée en SwiftUI, conçue avec une architecture modulaire robuste. Elle utilise le modèle MVVM (Model-View-ViewModel) pour séparer la logique de présentation de la logique métier, et intègre le pattern Interactor pour gérer les interactions complexes. L'application utilise également des protocoles pour définir des contrats clairs entre les composants et l'injection de dépendances pour améliorer la modularité et la testabilité.

## Caractéristiques

- **Architecture MVVM** : Sépare la logique de présentation de la logique métier, facilitant ainsi les tests unitaires et la maintenance.
- **Pattern Interactor** : Centralise la logique métier complexe, permettant une meilleure réutilisabilité et testabilité des composants.
- **Protocoles** : Définit des interfaces claires pour les interactions entre les composants, favorisant la flexibilité et l'extensibilité.
- **Injection de Dépendances** : Utilise un conteneur de dépendances pour gérer les services partagés, injectés dans l'environnement SwiftUI.
- **Modularité** : Structure modulaire qui permet d'ajouter ou de remplacer facilement des fonctionnalités sans affecter le reste de l'application.

## Technologies Utilisées

- **SwiftUI** : Pour la construction de l'interface utilisateur déclarative et réactive.
- **Combine** : Pour la gestion des flux de données asynchrones.
- **Swift** : Langage principal utilisé pour le développement.

## Structure du Projet

### Modèles

- **User** : Représente un utilisateur avec des propriétés telles que l'identifiant, le nom et l'âge.

### Vues

- **UserView** : Vue principale pour afficher et gérer les utilisateurs. Utilise des `TextField` pour la saisie des données et un `Button` pour ajouter de nouveaux utilisateurs.

### ViewModels

- **UserViewModel** : Gère la logique métier de la vue utilisateur, y compris la gestion des états de focus des `TextField`.

### Interacteurs

- **CoreInteractor** : Intermédiaire pour les opérations liées aux utilisateurs, comme la récupération et l'ajout d'utilisateurs.

### Protocoles

- **UserInteractor** : Définit les interactions liées aux utilisateurs.

### Gestion des Dépendances

- **DependencyContainer** : Conteneur pour gérer les dépendances de l'application.
- **Dependencies** : Structure qui initialise les dépendances globales de l'application.

### Environnement

- **AppDelegate** : Gère les événements du cycle de vie de l'application et initialise les dépendances globales.
