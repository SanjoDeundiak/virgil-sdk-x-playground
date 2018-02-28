import VirgilCryptoApiImpl

let crypto = VirgilCrypto(defaultKeyType: .RSA_4096)
let keyPair = try! crypto.generateKeyPair()

