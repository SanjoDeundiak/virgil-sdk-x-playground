import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()

let privateKeyData = try! crypto.exportPrivateKey(keyPair.privateKey, password: "<YOUR_PASSWORD>")
let publicKeyData = try! crypto.exportPublicKey(keyPair.publicKey)

// Save it securely
let privateKeyStr = privateKeyData.base64EncodedString()
// Embed it in client-side apps
let publicKeyStr = publicKeyData.base64EncodedString()
