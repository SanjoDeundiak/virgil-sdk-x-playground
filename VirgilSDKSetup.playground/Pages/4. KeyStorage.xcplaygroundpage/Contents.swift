import VirgilSDK
import VirgilCryptoApiImpl

// Generate some private key
let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()
let privateKey = keyPair.privateKey

// Setup PrivateKeyStorage
let privateKeyExporter = VirgilPrivateKeyExporter()
let privateKeyStorage = PrivateKeyStorage(privateKeyExporter: privateKeyExporter)

// Store private key
try! privateKeyStorage.store(privateKey: privateKey, name: "Alice", meta: nil)

// Load private key
let privateKeyEntry = try! privateKeyStorage.load(withName: "Alice")

// Delete private key
try! privateKeyStorage.delete(withName: "Alice")
