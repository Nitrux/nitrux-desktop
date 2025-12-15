#!/usr/bin/env bash

# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2024-2025 <Nitrux Latinoamericana S.C. <hello@nxos.org>>


# -- Build package.

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)

git_commit=$(git rev-parse --short HEAD 2>/dev/null)
[ -z "$git_commit" ] && git_commit="0"

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: required" \
	"Homepage: https://nxos.org" \
	"Package: nitrux-desktop" \
	"Version: 3.8.9-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Architecture: all" \
	"Description: Desktop metapackage for Nitrux."

equivs-build configuration
