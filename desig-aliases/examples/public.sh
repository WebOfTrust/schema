#!/bin/bash

# # updates the SAIDs of the schemas
# ../update.sh

alias="controller"
reg_name="dAliases"
d_alias_schema="EN6Oh5XSD5_q2Hgu-aqpdfbVepdpYpFlgz6zvJL5b_r5"

#clear state from previous runs
find /usr/local/var/keri/* -name "$alias" -type d -exec rm -rf {} + 2>/dev/null

kli init --name "$alias" --salt 0AAQmsjh-C7kAJZQEzdrzwB7 --nopasscode --config-dir "./my-scripts" --config-file my-config
kli incept --name "$alias" --alias "$alias" --file "./my-scripts/my-incept.json"
kli status --name "$alias" --alias "$alias"

kli vc registry incept --name "$alias" --alias "$alias" --registry-name "$reg_name"

kli saidify --file ./desig-aliases-rules-public.json --label "d"
kli saidify --file ./desig-aliases-attr-public.json --label "d"

# manually add rules example SAID and attribute example SAID to the desig-aliases.json
read -p "Hit enter after you have added the registry SAID (and maybe attrs, rules, etc) to desig-aliases-public.json"
kli saidify --file ./desig-aliases-public.json --label "d"

kli oobi resolve --name "$alias" --oobi-alias myDesigAliases --oobi "http://127.0.0.1:7723/oobi/${d_alias_schema}"
kli vc create --name "$alias" --alias "$alias" --registry-name "$reg_name" --schema "${d_alias_schema}" --credential @desig-aliases-public.json
kli vc list --name "$alias" --alias "$alias" --issued --schema "${d_alias_schema}"

SAID=$(kli vc list --name "$alias" --alias "$alias" --issued --said --schema "${d_alias_schema}")
kli vc export --name "$alias" --alias "$alias" --said "${SAID}" --chain
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