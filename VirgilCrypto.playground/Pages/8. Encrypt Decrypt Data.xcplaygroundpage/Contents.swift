import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()
let receiverPrivateKey = keyPair.privateKey
let receiverPublicKey = keyPair.publicKey

let messageToEncrypt = "Hello, Bob!"
let dataToEncrypt = messageToEncrypt.data(using: .utf8)!

let encryptedData = try! crypto.encrypt(dataToEncrypt, for: [receiverPublicKey])

let decryptedData = try! crypto.decrypt(encryptedData, with: receiverPrivateKey)

let decryptedMessage = String(data: decryptedData, encoding: .utf8)!
