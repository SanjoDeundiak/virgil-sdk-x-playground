import VirgilSDK
import VirgilCryptoApiImpl

// API_KEY
let apiKeyBase64 = "MIGhMF0GCSqGSIb3DQEFDTBQMC8GCSqGSIb3DQEFDDAiBBC7Sg/DbNzhJ/uakTvafUMoAgIUtzAKBggqhkiG9w0CCjAdBglghkgBZQMEASoEEDunQ1yhWZoKaLaDFgjpxRwEQAFdbC8e6103lJrUhY9ahyUA8+4rTJKZCmdTlCDPvoWH/5N5kxbOvTtbxtxevI421z3gRbjAtoWkfWraSLD6gj0="
let apiKeyPassword = "test" // API_KEY_PASSWORD
let privateKeyData = Data(base64Encoded: apiKeyBase64)!

let crypto = VirgilCrypto()
let apiKey = try! crypto.importPrivateKey(from: privateKeyData, password: apiKeyPassword)

let accessTokenSigner = VirgilAccessTokenSigner()

let appId = "be00e10e4e1f4bf58f9b4dc85d79c77a" // APP_ID
let appPubKeyId = "70b447e321f3a0fd" // API_KEY_ID
let ttl: TimeInterval = 60 * 60 * 24 // 1 hour

let jwtGenerator = JwtGenerator(apiKey: apiKey, apiPublicKeyIdentifier: appPubKeyId,
                                accessTokenSigner: accessTokenSigner, appId: appId, ttl: ttl)

let identity = "Alice"
let aliceJwt = try! jwtGenerator.generateToken(identity: identity)

let jwtString = aliceJwt.stringRepresentation() // Send to client-side
