//
//  SessionFirebase.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import UIKit
import Combine
import Firebase
import FirebaseFirestore

class SessionFirebase: ObservableObject {
    @Published var isSignIn = false
    @Published var errorMessage: String = ""
    @Published var user: User?
    private let store = Firestore.firestore().collection("users")
    
    //    func listen() {
    init() {
        _ = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            if let user = user {
                self?.user = User(user: user)
                self?.getMeUrlAndName()
                self?.isSignIn = false
            } else {
                self?.user = nil
                self?.isSignIn = true
            }
        }
    }
    
    func getMeUrlAndName() {
        let currentDoc = store//.document(user?.uid ?? "new user").collection("userInfo")
            .whereField("uid", isEqualTo: user?.uid ?? "Не нашел данный uid")
        
        currentDoc.getDocuments() { querySnapshot, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                for document in querySnapshot!.documents {
                    self.user?.userName = document.data()["userName"] as? String
                    self.user?.avatarURL = document.data()["avatarURL"] as? String
                }
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
        }
    }
    
    func signUp(email: String, password: String, name: String?, photo: UIImage) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            guard let result = result else { return }
            guard let name = name else { return }
            
            self.upload(currenrUid: result.user.uid, photo: photo) { [weak self] ResultUrlError in
                switch ResultUrlError {
                    case .success(let url):
                        self?.store.document(result.user.uid)//.collection("userInfo")
                            .setData(["userName" : name,
                                      "avatarURL" : url.absoluteString,
                                      "uid" : result.user.uid]) { error in
                            
//                            .addDocument(data: ["userName" : name,
//                                                "avatarURL" : url.absoluteString,
//                                                "uid" : result.user.uid]) { error in
                                if let error = error {
                                    self?.errorMessage = error.localizedDescription
                                } else {
                                    self?.getMeUrlAndName()
                                }
                            }
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func upload(currenrUid: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        let reference = Storage.storage().reference().child("avatars").child(currenrUid)
        
        guard let imageData = photo.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        reference.putData(imageData, metadata: metaData) { metadata, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            reference.downloadURL { url, error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                if let url = url {
                    completion(.success(url))
                }
            }
        }
    }
    
    func sighOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
