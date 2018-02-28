import Foundation
import VirgilCryptoApiImpl

let crypto = VirgilCrypto()

let publicKeyStr = "MCowBQYDK2VwAyEA9IVUzsQENtRVzhzraTiEZZy7YLq5LDQOXGQG/q0t0kE="

let publicKeyData = Data(base64Encoded: publicKeyStr)!

let publicKey = try! crypto.importPublicKey(from: publicKeyData)
