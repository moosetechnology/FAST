# Importers

FAST imports source files into FAST models with importers: one importer per language, provided by a language project (FAST-JAVA, FAST-Python, ...).

You can import in two ways.

- **Use the language importer directly** when you know the language of your files. Each language importer uses the same API, so you call it on its class, for example `FASTJavaSmaCCImporter parseFile: 'src/Main.java' asFileReference`. This is the most direct choice, and it never loads a project.
- **Use `FASTAgnosticImporter`** when you have files of several languages, or do not want to choose the importer. It chooses the importer of each file from its extension, and it can load the project of a language that is not in the image yet. Most of this guide describes this way.

## Import files

The most common calls are on the class side of `FASTAgnosticImporter`.

Import one file in a new model:

```st
FASTAgnosticImporter parseFile: 'src/Main.java' asFileReference.
```

Add a file to a model you already have, for example to import several files in one model:

```st
| model |
model := FASTAgnosticImporter parseFile: 'src/Main.java' asFileReference.
FASTAgnosticImporter parseFile: 'src/Other.java' asFileReference into: model.
```

Ask which importer handles a file, without importing it:

```st
FASTAgnosticImporter importerFor: 'src/Main.java' asFileReference.
```

Import a folder, its subfolders included, or a list of files:

```st
| result |
result := FASTAgnosticImporter parseFolder: 'src' asFileReference.
result := FASTAgnosticImporter parseFiles: { 'A.java' asFileReference. 'style.css' asFileReference }.
```

The files are grouped by importer, and each importer fills one model, so each language has one model. The answer is a dictionary from each model to the files that filled it. The files that no importer handles are answered under `nil`:

```st
result keysAndValuesDo: [ :model :files |
	Transcript show: files size printString; cr ].
result at: nil.
```

## Options

The options are on the instance side. Create an instance, give it a strategy, then use the same messages:

```st
FASTAgnosticImporter new
	missingImporterStrategy: FASTAlwaysLoadStrategy new;
	parseFolder: 'src' asFileReference.
```

When no loaded importer handles the extension of a file, FAST can load the project of a description that does. The strategy decides whether that project may be loaded:

- `FASTAskOrLoadStrategy` (the default): in an interactive image the user is asked before the project is loaded, with a Spec dialog. Otherwise the project is loaded.
- `FASTAlwaysLoadStrategy`: the project is loaded without asking. Use it to bypass the dialog.
- `FASTNeverLoadStrategy`: no project is loaded. The files it would have imported are answered under `nil`.

To write your own strategy, subclass `FASTMissingImporterStrategy` and implement `allowsLoadingOf:for:`, which answers whether the project of a description may be loaded for a file.

Loading a project needs network access.

## Errors

- When several importers handle the extension of a file, `FASTAmbiguousImporterError` is signaled, both for a single file and for a batch.
- When no importer handles a file in a single-file import, an error is signaled. A batch answers such files under `nil` instead.

## Available importers

Each language project has a `FASTImporterDescription` subclass. A description tells where its project is, and which extensions it handles. `FASTImporterDescription loadAll` loads all the projects that work, and a project is loaded when an importer for one of its extensions is present.

FAST-Pharo and FAST-Fortran are listed but do not work with the current FAST version, so `loadAll` does not load them.

## Writing an importer

An importer uses the `FASTTImporter` trait on its instance side and on its class side. In the class definition, this is the `#traits` and `#classTraits` entries:

```st
Class {
	#name : 'MyLanguageImporter',
	#superclass : 'Object',
	#traits : 'FASTTImporter',
	#classTraits : 'FASTTImporter classTrait',
	...
}
```

It implements two methods:

- `parse:into:` on the instance side. It imports the source into the model given, or into a new model when the model is `nil`, and answers the model.
- `extensions` on the class side, answering the file extensions without the dot. It is `#()` by default, so an importer that does not declare extensions handles no file.

The trait gives the other entry points on both sides: `parse:`, `parseFile:` and `parseFile:into:`, and `handlesFile:`, which `FASTAgnosticImporter` uses to find the importer of a file. The importers are found by the classes that use the trait, so there is nothing to register.

Importers based on Tree-Sitter inherit from `TSFASTAbstractImporter` in Pharo-Tree-Sitter. They get `parse:usingOldTree:` for incremental parsing: after `parse:`, the model can be reparsed from a new version of its source. Only the parse is incremental: the FAST model is rebuilt.
