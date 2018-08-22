[![Build Status](https://travis-ci.org/icy/s3zip.svg?branch=master)](https://travis-ci.org/icy/s3zip)

## Description

Compress AWS S3 policies and make them maintainable for human being.

Compress 1200 lines of Json files into 120 lines of configuration.

Output in JSON and/or Terraform.
See input examples in `input/` and the output in `output/`.
Speicification is found [here](SPECIFICATION.md).

Please don't use this tool if you are not a human.

## Syntax

Write Terraform files

```
$ cat input/*.tf.in \
  | D_OUTPUT="./output/" ruby s3zip.rb --tf
```

or simple the json files

```
$ cat input/*.tf.in \
  | D_OUTPUT="./output/" ruby s3zip.rb
```
