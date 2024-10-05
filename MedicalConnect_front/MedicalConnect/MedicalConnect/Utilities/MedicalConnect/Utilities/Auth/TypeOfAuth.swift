/// `TypeOfAuth` is a enum that represents two different ways to authenticate a user.
/// - GoogleAuth: Authentication using Google Sign-in.
/// - EmailAuth: Authentication using email and password manually.

import Foundation

enum TypeOfAuth:  String, CaseIterable, Codable {
    case GoogleAuth
    case EmailAuth
}

