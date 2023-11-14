#!/bin/bash

kli saidify --file ./desig-aliases-rules-schema.json --label "\$id"
kli saidify --file ./desig-aliases-attr-schema.json --label "\$id"
# manually add rules SAID and attribute SAID to the desig-aliases-public-schema.json
read -p "Hit enter after you have added the SAIDs to the auth-schema.json"
kli saidify --file ./desig-aliases-public-schema.json --label "\$id"