#!/bin/bash

../update.sh

alias="myself"
find /usr/local/var/keri/* -name "$alias" -type d -exec rm -rf {} + 2>/dev/null

kli init --name "$alias" --salt 0ACDEyMzQ1Njc4OWxtbm9aBc --nopasscode --config-dir ./config --config-file config
kli incept --name "$alias" --alias "$alias" --file ./config/config.json

kli vc registry incept --name "$alias" --alias "$alias" --registry-name authId

kli saidify --file ./desig-aliases-rules.json --label "d"
kli saidify --file ./desig-aliases-attr.json --label "d"

# # manually add rules example SAID and attribute example SAID to the desig-aliases.json
# # read -p "Hit enter after you have added the SAIDs to the auth.json"
# # kli saidify --file ./desig-aliases.json --label "d"

kli oobi resolve --name issuer --oobi-alias issuer --oobi EPi_tVS3zDN4wo-T3NQb5pUtdeup98yoJ_hrNReD86xO
kli vc create --name myself --alias myself --registry-name authId --schema EPi_tVS3zDN4wo-T3NQb5pUtdeup98yoJ_hrNReD86xO --data @desig-aliases-attr.json --rules @desig-aliases-rules.json
# SAID=$(kli vc list --name myself --alias myself --issued --said --schema EPi_tVS3zDN4wo-T3NQb5pUtdeup98yoJ_hrNReD86xO)
# echo "SAID of the Authorized Identifiers attestation is: ${SAID}"

# # kli vc create --name myself --alias myself --registry-name vLEI --schema EBfdlu8R27Fbx-ehrqwImnK-8Cm79sqbAQ4MmvEAYqao --recipient ELjSFdrTdCebJlmvbFNX9-TLhR2PO0_60al1kQp5_e6k --data @${KERI_DEMO_SCRIPT_DIR}/data/credential-data.json
# # SAID=$(kli vc list --name myself --alias myself --issued --said --schema EBfdlu8R27Fbx-ehrqwImnK-8Cm79sqbAQ4MmvEAYqao)

# # kli ipex grant --name myself --alias myself --said "${SAID}" --recipient ELjSFdrTdCebJlmvbFNX9-TLhR2PO0_60al1kQp5_e6k

# # echo "Checking holder for grant messages..."
# # GRANT=$(kli ipex list --name holder --alias holder --poll --said)

# # echo "Admitting credential from grant ${GRANT}"
# # kli ipex admit --name holder --alias holder --said "${GRANT}"

# kli vc list --name myself --alias myself
# exit 0

# kli vc revoke --name myself --alias myself --registry-name authId --said "${SAID}"
# sleep 2
# kli vc list --name myself --alias myself --poll