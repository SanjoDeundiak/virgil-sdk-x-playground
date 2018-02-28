import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPairs = try! crypto.generateMultipleKeyPairs(numberOfKeyPairs: 3)
let receiverPublicKey1 = keyPairs[0].publicKey
let receiverPublicKey2 = keyPairs[1].publicKey
let receiverPublicKey3 = keyPairs[2].publicKey

let messageToEncrypt = "Hello, Bob!"
let dataToEncrypt = messageToEncrypt.data(using: .utf8)!

let receiversPublicKeys = [receiverPublicKey1, receiverPublicKey2, receiverPublicKey3]
let encryptedData = try! crypto.encrypt(dataToEncrypt, for: receiversPublicKeys)

let decryptedData = try! crypto.decrypt(encryptedData, with: keyPairs[0].privateKey)

let decryptedMessage = String(data: decryptedData, encoding: .utf8)!

