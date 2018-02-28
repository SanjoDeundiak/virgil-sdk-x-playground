import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()
let senderPrivateKey = keyPair.privateKey
let senderPublicKey = keyPair.publicKey

let messageToSign = "Hello, Bob!"
let dataToSign = messageToSign.data(using: .utf8)!

let signature = try! crypto.generateSignature(of: dataToSign, using: senderPrivateKey)

let verified = crypto.verifySignature(signature, of: dataToSign, with: senderPublicKey)
