import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()

let privateKeyData = try! crypto.exportPrivateKey(keyPair.privateKey, password: "YOUR_PASSWORD")
let privateKeyStr = privateKeyData.base64EncodedString()
