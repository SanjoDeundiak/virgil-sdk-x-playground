import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()

let publicKeyData = crypto.exportPublicKey(keyPair.publicKey)
let publicKeyStr = publicKeyData.base64EncodedString()

print(publicKeyStr)
