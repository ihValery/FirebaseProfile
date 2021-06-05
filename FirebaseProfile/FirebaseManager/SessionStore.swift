//
//  SessionStore.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import UIKit
import Combine
import Firebase
import FirebaseStorage
import FirebaseFirestore

class SessionStore: ObservableObject {
    @Published var isSignIn = false
    @Published var userName: String = ""
    @Published var errorMessage: String = ""
    @Published var user: User?
    
    func listen() {
        //firebase рекомендует получать текущего пользователя - установив прослушивателя для объекта Auth:
        _ = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            if let user = user {
                self?.user = User(uid: user.uid, email: user.email, userName: user.displayName)
                self?.userName = user.displayName ?? "noname"
                self?.isSignIn = false
            } else {
                self?.user = nil
                self?.userName = ""
                self?.isSignIn = true
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
        }
    }
    
    func signUp(email: String, password: String, name: String?, photo: UIImage) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            guard let result = result else { return }
            guard let name = name else { return }
            
            self?.upload(currenrUid: result.user.uid, photo: photo) { resultUpload in
                switch resultUpload {
                    case .success(let url):
                        let db = Firestore.firestore()
                        db.collection("users").addDocument(data: ["userName" : name,
                                                                  "avatarURL" : url.absoluteString,
                                                                  "uid" : result.user.uid])
                        { error in
                            if let error = error {
                                self?.errorMessage = error.localizedDescription
                            }
                        }

                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func sighOut() {
        do {
            try Auth.auth().signOut()
            user = nil
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func upload(currenrUid: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        let reference = Storage.storage().reference().child("avatars").child(currenrUid)
        
        guard let imageData = photo.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        reference.putData(imageData, metadata: metaData) { [weak self] metadata, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            reference.downloadURL { url, error in
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    return
                }
                if let url = url {
                    completion(.success(url))
                }
            }
        }
    }    
}

//    func updateProfile(name: String) {
//        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//        changeRequest?.displayName = name
//        changeRequest?.commitChanges { [weak self] error in
//            if let error = error {
//                self?.errorMessage = error.localizedDescription
//                return
//            } else {
//                self?.user?.userName = name
//                self?.userName = name
//            }
//        }
//    }


//    var handle: AuthStateDidChangeListenerHandle?

//    init() {
//        _ = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
//            if let user = user {
//                self?.user = User(uid: user.uid, email: user.email, userName: user.displayName)
//                self?.userName = user.displayName ?? "no name"
//            } else {
//                self?.isSignIn = true
//                self?.user = nil
//            }
//        }
//    }
