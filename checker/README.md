# dockstore-workflow-md5sum-tester

This is an extremely simple tools used to test the output of the corresponding dockstore-workflow-md5sum workflow.

## Validation

This workflow has been validated as a CWL v1.0 launched using Dockstore 1.1.2.

Versions of dependencies that we tested include:
```
setuptools==28.8.0
cwltool==1.0.20161114152756
schema-salad==1.18.20161005190847
avro==1.8.1
```

## Building Docker

    docker build -t quay.io/briandoconnor/dockstore-workflow-md5sum-tester:1.0.0 .

## CWL Testing

How to execute this tool using the CWL descriptor via the Dockstore command line (which calls the `cwltool` command behind the scenes).

### Testing Locally with the Dockstore CLI

This tool can be found at the [Dockstore](https://dockstore.org), login with your GitHub account and follow the
directions to setup the CLI.  It lets you run a Docker container with a CWL descriptor locally, using Docker and the CWL command line utility.  This is great for testing.

#### Make a Parameters JSON

This is the parameterization of the md5sum checker tool, a copy is present in this repo called `Dockstore.json`:

```
{
  "input_file": {
        "class": "File",
        "path": "md5sum.input"
    },
    "results_file": {
        "class": "File",
        "path": "/tmp/results.json"
    },
    "log_file": {
        "class": "File",
        "path": "/tmp/log.txt"
    }
}
```

You will also see a `Dockstore.inputs.json` file which is the same but with the outputs removed. This means when you run it via the Dockstore CLI you need to find the output by looking at the cwltool STDOUT e.g. look at this file:

    Saving copy of cwltool stdout to: /Users/boconnor/Development/gitroot/dockstore-tool-md5sum/./datastore/launcher-002bcb21-11e2-47d4-96f5-fb542eb48bb5/outputs/cwltool.stdout.txt

This will tell you the location of the output md5sum file.

You might need to use this `Dockstore.inputs.json` if you are executing a more strict CWL execution engine like Arvados.

#### Run with the CWL CLI

    cwltool Dockstore.cwl Dockstore.json

#### Run with the Dockstore CLI

Run it using the `dockstore` CLI locally with the Dockstore.cwl file (great for testing if you make changes locally):

```
# run this locally
$> dockstore tool launch --entry Dockstore.cwl --local-entry --json Dockstore.json
```

Or you can run it from the latest release on Dockstore:

```
# run this from the Dockstore
$> dockstore workflow launch --entry quay.io/briandoconnor/dockstore-workflow-md5sum-tester:1.0.0 --json Dockstore.json
```

## Test with travis-ci

See the `.travis.yml` file.

## Publishing

At this point you follow the SOP from the [Dockstore.org site](https://dockstore.org/docs).
