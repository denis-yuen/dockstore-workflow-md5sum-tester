#!/usr/bin/env cwl-runner

class: CommandLineTool
id: Md5sumChecker
label: A tool that checks the md5sum workflow
cwlVersion: v1.0

doc: |
  [![Docker Repository on Quay.io](https://quay.io/repository/briandoconnor/dockstore-tool-md5sum/status "Docker Repository on Quay.io")](https://quay.io/repository/briandoconnor/dockstore-tool-md5sum)
  [![Build Status](https://travis-ci.org/briandoconnor/dockstore-tool-md5sum.svg)](https://travis-ci.org/briandoconnor/dockstore-tool-md5sum)
  A very, very simple Docker container for the md5sum command. See the [README](https://github.com/briandoconnor/dockstore-tool-md5sum/blob/master/README.md) for more information.


requirements:
- class: DockerRequirement
  dockerPull: quay.io/briandoconnor/dockstore-tool-md5sum:1.0.3
- class: InlineJavascriptRequirement

hints:
- class: ResourceRequirement
  # The command really requires very little resources.
  coresMin: 1
  ramMin: 1024
  outdirMin: 512000

inputs:
  input_file:
    type: File
    inputBinding:
      position: 1
    doc: The file that will have its md5sum calculated.

outputs:
  results_file:
    type: File
    outputBinding:
      glob: results.json
    doc: A json file that contains the result of the test.

  log_file:
    type: File
    outputBinding:
      glob: log.txt
    doc: A text log file that contains more details.

baseCommand: [/bin/my_md5sum]
