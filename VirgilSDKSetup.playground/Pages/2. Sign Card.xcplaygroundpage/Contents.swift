import VirgilSDK
import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()
let privateKey = keyPair.privateKey

let rawCardStr = "eyJjb250ZW50X3NuYXBzaG90IjoiZXlKMlpYSnphVzl1SWpvaU5TNHdJaXdpY0hWaWJHbGpYMnRsZVNJNklrMURiM2RDVVZsRVN6SldkMEY1UlVGbldVaHJYQzl4VldOSFIzQTJaSEpoUVRGS2NtUTVXSFZPSzJKTk5GSk5ZM2RITW5KcmNqbDZiV2cwT0QwaUxDSnBaR1Z1ZEdsMGVTSTZJa0ZzYVdObElpd2lZM0psWVhSbFpGOWhkQ0k2TVRVeE9EWXhPVEEyTm4wPSIsInNpZ25hdHVyZXMiOlt7InNpZ25hdHVyZSI6Ik1GRXdEUVlKWUlaSUFXVURCQUlEQlFBRVFNY3BRcVwvWUJNdGVYcExmK0QrbjF0UlFOT2djNUY4dVNndTBoV2hFdUhtOFl2UGZleDc0ZjU0ZTZ0V2poK3pzOG9UVzIwWVFYK3BaTzIwZjVlS3lSQUE9Iiwic2lnbmVyIjoic2VsZiJ9XX0="

// Receive rawCardStr from a client
let rawCard = try! RawSignedModel.import(fromBase64Encoded: rawCardStr)

let cardCrypto = VirgilCardCrypto()
let modelSigner = ModelSigner(cardCrypto: cardCrypto)

try! modelSigner.sign(model: rawCard, signer: "YOUR_BACKEND",
                      privateKey: privateKey)

// Send it back to the client
let newRawCardStr = try! rawCard.exportAsBase64EncodedString()

print(newRawCardStr)
