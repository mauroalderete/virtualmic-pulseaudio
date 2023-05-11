# coding-projects-template

<h4 align="center">Template to coding projects that requires a conventional workflow</h4>

&nbsp;

<div align="center">

<a href="./LICENSE">
	<img alt="License: MIT" src="https://img.shields.io/badge/License-Private-yellow.svg">
</a>
<a href="./CODE_OF_CONDUCT.md">
	<img alt="Contributor covenant: 2.1" src="https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg">
</a>
<a href="https://semver.org/">
	<img alt="Semantic Versioning: 2.0.0" src="https://img.shields.io/badge/Semantic--Versioning-2.0.0-a05f79?logo=semantic-release&logoColor=f97ff0">
</a>

[![Tests](https://github.com/mauroalderete/coding-projects-template/actions/workflows/tests.yml/badge.svg)](https://github.com/mauroalderete/coding-projects-template/actions/workflows/tests.yml)
[![CodeQL](https://github.com/mauroalderete/coding-projects-template/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/mauroalderete/coding-projects-template/actions/workflows/codeql-analysis.yml)

<a href="./issues/new/choose">Report Bug</a>
·
<a href="./issues/new/choose">Request Feature</a>

<a href="https://twitter.com/intent/tweet?text=👋%20Check%20this%20amazing%20repo%20https://github.com/mauroalderete/coding-projects-template,%20created%20by%20@_mauroalderete%0A%0A%23DEVCommunity%20%23100DaysOfCode%20%23Golang%20%23gcode">
	<img src="https://img.shields.io/twitter/url?label=Share%20on%20Twitter&style=social&url=https%3A%2F%2Fgithub.com%2Fatapas%2Fmodel-repo">
</a>

</div>

&nbsp;
# :wave: Introducing `coding-projects-templates
This repository template contains the essential elements used in various projects to many stacks.

- Includes workflows to handle labeling, versioning, testing
- Contains a private license, a basic contributing redaction, and a covenant code of conduct.
- Implements a definition to generate release notes.
- Defines templates to the three issues types (bug, proposal, question) and a pull request template.
- Additional prepare a dependabot script.
- Schedule a CodeQL Analysis.

> Many of the configuration files in this repository are not working yet. Just consist of a sample definition of the configuration. You may adapt these files depending on your objectives. You should pay attention to subsequent indications to know how you do it.

# :fire: How to use this template

To use this template, click the button **Use this template** shown in the upper section on [root of repository](https://github.com/mauroalderete/coding-projects-template), then create a new repository.

Another way is initing the process of creating a new repository and selecting this template in the upper section.

# :building_construction: How to Set up

This template contains many files. A lot of them require special attention.

## CodeQL

`/.github/workflows/codeql-analysis.yml`

This file enables the CodeQL service provided by GitHub. You should provide a language supported.
If your project is not supported, I recommend removing this yaml file.

## Code of conduct

`/CODE_OF_CONDUCT.md`

This code is based on the covenant code. He is only required to specify an email address to the community to send his messages. Now, this email is alderete.mauro@gmail.com.

## License

`/LICENSE`

This license is a private personal license redacted by chatGPT. This is only an example. I recommend changing this license to other than to be attached better to your needs.
You can replace it with any Open License offered by GitHub, too.

## Tests

`/.github/workflows/tests.yml`

This workflow is the most complex to configure. This depends highly on your stack and environment.
In some cases, you will probably need to split this workflow into unit and integration tests.
It only contains some steps with a simple message showing you the commands to configure a node test environment.

I recommend you study your case carefully.

## Versioning

`/.github/workflows/versioning.yml`

The versioning workflow contains the commands to generate a new release. This release could be attached with a binary file result from them of your project's build.

The file shows you a simple build step and package.

## Gitignore

`/.gitignore`

This file is empty. Replace the content with what you think is more convenient.

## Others

The rest of the files usually don't require modifications. Implements defaults and typical workflows.