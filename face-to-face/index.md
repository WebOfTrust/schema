## Face-to-Face (f2f) Credentials

### Purpose

These credentials document an assertion by one human being, that they have interacted with another human being, face-to-face, in "real" (non-digital, non-remote) life. An individual face-to-face credential provides moderate assurance (with a documented, specific basis) that the issuee is not an AI, an org, or an IoT device. See [this slidedeck](https://docs.google.com/presentation/d/17_QEAt5SIBOrKbZdkPW0K8XYNGyA4Fn8Tg-h0kvJTCE/edit?usp=sharing) for background.

![suggested face-to-face visual](visual.png)

Face-to-face credentials prove a party's humanness, NOT their identity. They do NOT replace high-assurance credentials such as passports, drivers licenses, or KYC, because they don't make strong claims about the attributes of the issuees.

It is possible for Alice to work with Bob for years, and to issue Bob a face-to-face credential on that basis (`knownAs = "Bob", basis = "colleague"`), but to not know that Bob's legal name is actually Roberto. It is also possible for Bob to thoroughly deceive Alice about his name. Neither of these issues invalidates Alice's claim that the party she knows as Bob (whatever his name might be) is a human being rather than a piece of technology or a faceless organization. *That* is what a face-to-face credential asserts -- and until we have [more realistic androids](https://futuretechenthusiast.com/10-most-realistic-humanoid-robots/), it is something Alice can decide easily, in even a brief face-to-face interaction.

Knowledge about the existence of real-life humans is generated all the time, with virtually no effort, as we go about our ordinary lives. Thus, face-to-face credentials tap into a source of trust that is cheap, common, and neglected by heavier-weight mechanisms. Importantly, this knowledge is not dependent on institutions; face-to-face credentials democratize and decentralize trust on a particular question, and they limit ["big desk and little people" power imbalances](https://medium.com/@daniel-hardman/big-desks-and-little-people-e1b1b9e92d79). 

Face-to-face credentials might be used to tell the difference between true and fake reports of a news event (since bots claiming to have witnessed the fake events should have trouble proving their humanness). They might be used as a replacement for a CAPTCHA. They might be a requirement for the issuance of other credentials that are intended to be held only by humans.

As with any credential, the trust that a verifier places in an individual face-to-face credential MUST depend on what they know about the issuer (`i` field). Trust SHOULD also be influenced by the data that the issuer offers about the nature and duration of the IRL interaction they had with the issuee (`basis` field). Multiple face-to-face credentials from issuers that are widely separated in time, kind, and public reputation are much harder to manipulate. Since high-assurance face-to-face interactions are common (work or school colleagues we've known for years, family and close friends), we hope that people give and get face-to-face credentials regularly, thus creating a web that provides pretty good assurance of humanness in many contexts.

### Privacy

Face-to-face credentials allow (but do not require) the issuer to assert the name (`knownAs` field) and/or handles (`confirmedHandles` field) that they have *personally* used to interact with the issuee. They also allow (but do not require) the issuer to endorse the hash of biometrics (e.g., a photo or voice print) that they agree characterized the issuee as they observed them in real life interactions (`biometricHashes` field). The issuee can carry the actual biometric data and present it to verifiers, thus allowing a verifier to confirm that they are interacting with the same human that the issuer knew.

Issuing and later disclosing this information are both optional. Face-to-face credentials support contractually protected and graduated disclosure. Best practice for privacy would be to disclose no more than is strictly required.

By design, face-to-face credentials do not protect the privacy of the issuer. This means they should be issued by a public persona of the issuer, not a highly private one. Issuers and issuees should carefully consider the tradeoff between assurance and privacy that's associated with disclosing the nature of their face-to-face interactions in a face-to-face credential's `basis` field.

### Governance Framework

These credentials are governed by a simple set of rules (shown below in human-friendly text, and referenced in the `r` field of each credential) that are designed to enhance assurance, discourage abuse, and keep use cases crisp. The act of issuing or receiving a face-to-face credential constitutes binding acceptance of these rules. Although organizations, IoT devices, and other non-human parties are prohibited from issuing or holding face-to-face credentials, they are encouraged to also declare their compliance with the NONPARTICIPANT rule by submitting referencing the github commit hash of this README.md file where the rule is declared. 

#### Rules
1. Issuers MUST be human beings. By issuing any face-to-face credential, issuers become accountable to the world (all conceivable verifiers) for asserting that fact about themselves.
2. Issuers MUST issue face-to-face credentials only to a human being with whom they have interacted face-to-face. "Face-to-face" means occurring physically and in close proximity, with the face (and often, the rest of the body) of the issuee observable closely, clearly, and long enough that ordinary human observation can tell the difference between a real human and any artificial construct. Except under unusual circumstances which MUST be documented in the `caveats` field (e.g., blindness, deafness, talking in a dark cave), it also means that normal sensory experiences were available. Teleconferences and phone calls are not "face-to-face" and do not provide a valid basis for face-to-face credentials.
3. Issuees MUST be human beings. By accepting a face-to-face credential, issuees become accountable for asserting that fact to the issuer. By using a face-to-face credential to characterize themselves to others, issuees become accountable for asserting that fact to verifiers.
4. Issuees MUST accept and use face-to-face credentials only from issuers with whom they have interacted face-to-face. By using a face-to-face credential to characterize themselves to others, issuees ALSO become accountable for asserting that fact about the issuee to verifiers.
5. Both issuers and issuees agree that the face-to-face credential does not overstate the time or basis of their interaction.
6. During their face-to-face interaction, both parties MUST communicate to the other party the value of their identifier. The communication may take place digitally (e.g., by NFC touch, by QR code). However, both parties must confirm verbally to the other party that they have received the value that the other transmitted.
6. If the credential includes a hash of a biometric (e.g., photo or voice print), both parties agree the associated data is a reasonable representation of how the issuer perceived the issuee near the time of issuance.
7. Both parties agree to make prompt efforts to revoke any face-to-face credentials that they believe to be inaccurate.
8. If either an issuer or an issuee of a given face-to-face credential is found to be feigning personhood in a way that could not have produced the basis claimed in that credential, both parties to the credential agree to receive reputation damage, because it means both parties lied about having a face-to-face interaction.