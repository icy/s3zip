[![Build Status](https://travis-ci.org/icy/s3zip.svg?branch=master)](https://travis-ci.org/icy/s3zip)

## TOC

* [Description](#description)
* [Installation](#installation)
* [Syntax](#syntax)
* [Why-s3zip](#why-s3zip)
* [Specification](#specification)

## Description

Compress AWS S3 policies and make them maintainable for human being.

Compress 1200 lines of Json files into 120 lines of configuration.

Output in JSON and/or Terraform.
See input examples in `input/` and the output in `output/`.

Please don't use this tool if you are not a human.

## Installation

A standard `Ruby` installation is required.

Make the script `s3zip` executable and put to your search path.
We may have `gem` support in the future.

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

## Why s3zip

It's because number of users of your `s3` bucket(s) is
often higher than number of buckets.
This is clear: Every bucket needs at least one user.

Let's say you have two buckets `s31` and `s32`, and you have several users:

* Two developers in your company (`u1`, `u2`)
* Three applications need to write to those buckets (`a1`, `a2`)
* A backup application to read from those buckets (`b1`)

To prepare `s3` policies for this setup, you often do as below

* Prepare configuration for `s31` bucket: You need `IAM` information of
  5 users (`u1`, `u2`, `a1`, `a2`, `b1`) and write policies for them.
  In the policy you have to provide `IAM` information for each action
  that would happen on the bucket. There are many code duplication.
* Prepare configuration for `s32` bucket. You almost repeat what you
  have done for `s31` with a few updates.

One day your audit guy comes and asks you a list of buckets that
the developer `u1` may have access. The only option you can think of
is to rescan all your policies. That's a nightmare.


`S3zip` helps you from the point of view of an audit guy. Instead of
writing policies for each bucket, we will write policies for each user.
For each `IAM` user on your system (maybe that's a human, or an application)
you describe some basic rules for them.

Take a look at `input/` directory for some examples.

Problem solved. Code duplication is reduced quickly, policies are very
clean and your audit guy will be happy.

## Specification

Specification is found [here](SPECIFICATION.md).
