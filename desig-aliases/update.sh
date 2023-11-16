#!/bin/bash

kli saidify --file ./desig-aliases-rules-private-schema.json --label "\$id"
kli saidify --file ./desig-aliases-rules-public-schema.json --label "\$id"

kli saidify --file ./desig-aliases-attr-private-schema.json --label "\$id"
kli saidify --file ./desig-aliases-attr-public-schema.json --label "\$id"

kli saidify --file ./desig-aliases-private-schema.json --label "\$id"
kli saidify --file ./desig-aliases-public-schema.json --label "\$id"