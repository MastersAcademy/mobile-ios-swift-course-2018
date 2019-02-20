Tools for automation

1. Cocoapods (dependency manager)
https://github.com/CocoaPods/CocoaPods
https://cocoapods.org/

Benefits:
- ruby gem
- open source
- 11k stars on github

How it's work:
- repo with all list of pods
- podspec as main info about dependency
- add dependency into project

How to use:
- install as new
- install specific version
- install version from 

2. SwiftLint
https://github.com/realm/SwiftLint

Benefits:
- single source of truth for code style
- no need to check teammates
- custom rules

How it's work:
- look's into clang and SourceKit and use AST representation for result

How to use:
- install as cocoapods (preferred) or homebrew
- add rules template
- add check in build phase

3. Sourcery
https://github.com/krzysztofzablocki/Sourcery

Benefits:
- reduce repeatable tasks
- reduce spend time to trivial tasks

How it's work:
- check annotation or conformed protocols
- generate code relevant for this conforms

How to use:
- install as cocoapods
- add templates
- add configuration file
- add markers
- add script to build phase
- build
- add generated files

4. R.swift
https://github.com/mac-cain13/R.swift

Benefits:
- strong type
- autocompleted resource (colors, images, fonts)

How it's work:
- parse exist resource
- generate static code

How to use:
- install as cocoapods 
- add script to build phase
- build

5. Goloc
https://github.com/s0nerik/goloc

Benefits:
- No need to add sync localization files 
- One source of truth - google drive

How it's work
- Take google sheet from GD
- Parse colons and adapt to required key \ value format

Hot to use
- Write bash script
- Add to build phase
- Profit