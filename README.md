## Schema
This repo is a registry for [ACDC](https://trustoverip.github.io/tswg-acdc-specification/draft-ssmith-acdc.html) schemas that might be useful to a broad audience. The Web of Trust community operates it as a public service. The registry is not deeply vetted for quality, and publication here does not imply that the schema has been endorsed by anyone in particular. The registry is simply a well known and convenient place to make data discoverable. Submissions are encouraged by anyone.

The repo also contains some tools for working with schema; see the  [`/tools` folder](https://github.com/WebOfTrust/schema/tree/main/tools).

### Contributing
To submit a schema, create a PR that populates a folder of data about your new credential type. Give the folder a meaningful name (e.g., `/my-credential-type`), and add to it at least 3 files:

1. A `schema.json` file in [JSON Schema](https://json-schema.org/) format, describing the structural rules for your new credential type. Looking at other examples on the site will be very helpful.
2. An `index.md` file that explains why you created the schema, what use cases it addresses, what rules are expected to govern its behavior, how to find the community that uses it, and so forth.
3. One or more `example*.json` or `test*.json` files that demonstrate data possibilities. Example files are casual, hand-written constructions that show something interesting but don't obey the schema fully. Test files should be the result of rigorous issuance and should therefore verify in tests.