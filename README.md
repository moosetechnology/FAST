# FAST

[![CI MOOSE10](https://github.com/moosetechnology/FAST/actions/workflows/testAndBuild-moose10.yml/badge.svg)](https://github.com/moosetechnology/FAST/actions/workflows/testAndBuild-moose10.yml)
[![CI MOOSE11](https://github.com/moosetechnology/FAST/actions/workflows/testAndBuild-moose11.yml/badge.svg)](https://github.com/moosetechnology/FAST/actions/workflows/testAndBuild-moose11.yml)

[![Moose version](https://img.shields.io/badge/Moose-10-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

## Installation

To install FAST execute in a playground:

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST' commitish: 'v2' path: 'src';
  baseline: 'FAST';
  load
```

## FAST Meta-Model

![FAST Meta-model](https://raw.githubusercontent.com/moosetechnology/FAST/v2-doc/fast-core.png)
