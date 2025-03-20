//
//  ContentView.swift
//  Architecture
//
//

import SwiftUI

/// Une vue SwiftUI pour afficher et gérer les utilisateurs.
struct UserView: View {
    
    /// Le conteneur de dépendances provenant de l'environnement.
    @Environment(DependencyContainer.self) private var container
    
    /// Le ViewModel associé à cette vue, qui gère la logique métier.
    @State var viewModel: UserViewModel
    
    /// Les FocusState pour avoir le focus sur les TextFields
    @FocusState private var nameFieldIsFocused: Bool
    @FocusState private var ageFieldIsFocused: Bool
    
    /// Le corps de la vue, définissant son apparence et son comportement.
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Liste des utilisateurs avec un design amélioré
                List(viewModel.users, id: \.id) { user in
                    HStack {
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text(String(user.name.prefix(1)))
                                    .foregroundColor(.blue)
                                    .font(.headline)
                            )
                        
                        Text(user.name)
                            .font(.headline)
                        Spacer()
                        Text("\(user.age) ans")
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                
                VStack(spacing: 16) {
                    // Section de formulaire
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ajouter un utilisateur")
                            .font(.headline)
                            .padding(.bottom, 4)
                            .focused($nameFieldIsFocused)
                        
                        TextField("Nom", text: $viewModel.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.words)
                            .focused($ageFieldIsFocused)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                            )
                        
                        TextField("Âge", text: $viewModel.age)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                            )
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.top, 4)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    Button(action: {
                        Task {
                            if viewModel.name.isEmpty {
                                viewModel.errorMessage = "Le nom ne peut pas être vide."
                            } else if let ageInt = Int(viewModel.age) {
                                await viewModel.addUser(name: viewModel.name, age: ageInt)
                                viewModel.name = ""
                                viewModel.age = ""
                                viewModel.errorMessage = nil
                            } else {
                                viewModel.errorMessage = "L'âge doit être un nombre valide."
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Ajouter Utilisateur")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Utilisateurs")
        }
        .task {
            await viewModel.loadUsers()
        }
        .onTapGesture {
            nameFieldIsFocused = false
            ageFieldIsFocused = false
            viewModel.hideKeyboard()
        }
    }
}

#Preview {
    // Configuration de la prévisualisation de la vue.
    UserView(
        viewModel: UserViewModel(
            interactor: CoreInteractor(
                container: DevPreview.shared.container
            )
        )
    )
    .previewEnvironment()
}
