import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let senderKeyPair = try! crypto.generateKeyPair()
let senderPrivateKey = senderKeyPair.privateKey
let senderPublicKey = senderKeyPair.publicKey
let receiverKeyPair = try! crypto.generateKeyPair()
let receiverPrivateKey = receiverKeyPair.privateKey
let receiverPublicKey = receiverKeyPair.publicKey

let messageToEncrypt = "Hello, Bob!"
let dataToEncrypt = messageToEncrypt.data(using: .utf8)!

let encryptedData = try! crypto.signThenEncrypt(dataToEncrypt, with: senderPrivateKey, for: [receiverPublicKey])

let decryptedData = try! crypto.decryptThenVerify(encryptedData, with: receiverPrivateKey, using: senderPublicKey)

let decryptedMessage = String(data: decryptedData, encoding: .utf8)!

