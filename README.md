# FAST

[![Moose 11 and 12 CI](https://github.com/moosetechnology/FAST/actions/workflows/tests.yml/badge.svg)](https://github.com/moosetechnology/FAST/actions/workflows/testAndBuild-moose10.yml)

Supported Moose Versions: [![Moose version](https://img.shields.io/badge/Moose-11-%23aac9ff.svg)](https://github.com/moosetechnology/Moose) [![Moose version](https://img.shields.io/badge/Moose-12-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

## Installation

To install FAST execute in a playground:

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST' commitish: 'v3' path: 'src';
  baseline: 'FAST';
  load
```

## Importers

A language project provides an importer that turns source files into a FAST model. FAST can import a file without you choosing its importer, from the file extension:

```st
| model |
model := FASTAgnosticImporter parseFile: 'src/Main.java' asFileReference.
FASTAgnosticImporter parseFile: 'src/Other.java' asFileReference into: model.
FASTAgnosticImporter importerFor: 'src/Main.java' asFileReference.
```

- `parseFile:` imports the file in a new model, `parseFile:into:` adds it to a model you already have, and `importerFor:` tells which importer handles a file.
- When no loaded importer handles the extension of a file, FAST loads the project that provides it. In an interactive image it asks first; otherwise it loads the project, which needs network access.
- When two importers handle the same extension, FAST signals `FASTAmbiguousImporterError` instead of choosing one.

### Writing an importer

An importer uses the `FASTTImporter` trait on its instance side and on its class side:

In the class definition, this is the `#traits` and `#classTraits` entries:

```st
Class {
	#name : 'MyLanguageImporter',
	#superclass : 'Object',
	#traits : 'FASTTImporter',
	#classTraits : 'FASTTImporter classTrait',
	...
}
```

It implements `parse:into:` on the instance side, which imports the source into the model given (a `nil` model means a new one) and answers the model. It can override `extensions` on the class side, answering the file extensions without the dot. The trait gives the other entry points (`parse:`, `parseFile:` and `parseFile:into:`) on both sides, and `handlesFile:`, which `FASTAgnosticImporter` uses to find the importer of a file.

Importers based on Tree-Sitter inherit from `TSFASTAbstractImporter` in Pharo-Tree-Sitter. They get `parse:usingOldTree:` for incremental parsing: after `parse:`, the model can be reparsed from a new version of its source. Only the parse is incremental: the FAST model is rebuilt.

The projects that provide importers are described by `FASTImporterDescription` subclasses, one per language. FAST-Pharo and FAST-Fortran are listed but do not work with the current FAST version, so they are not loaded by `FASTImporterDescription loadAll`.

## FAST Meta-Model

![FAST Meta-model](https://raw.githubusercontent.com/moosetechnology/FAST/v2-doc/fast-core.png)

