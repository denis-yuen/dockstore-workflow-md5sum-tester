# dockstore-workflow-md5sum

This is an extremely simple workflow used to show how to call a workflow via [Dockstore](http://dockstore.org).

## Validation

This workflow has been validated as a CWL v1.0 launched using Dockstore 1.1.2.

Versions of dependencies that we tested include:
```
setuptools==28.8.0
cwltool==1.0.20161114152756
schema-salad==1.18.20161005190847
avro==1.8.1
```

## CWL Testing

How to execute this workflow using the CWL descriptor via the Dockstore command line (which calls the `cwltool` command behind the scenes).

### Testing Locally with the Dockstore CLI

This workflow can be found at the [Dockstore](https://dockstore.org), login with your GitHub account and follow the
directions to setup the CLI.  It lets you run a Docker container with a CWL descriptor locally, using Docker and the CWL command line utility.  This is great for testing.

#### Make a Parameters JSON

This is the parameterization of the md5sum workflow, a copy is present in this repo called `Dockstore.json`:

```
{
  "input_file": {
        "class": "File",
        "path": "md5sum.input"
    },
    "output_file": {
        "class": "File",
        "path": "/tmp/md5sum.txt"
    }
}
```

You will also see a `Dockstore.yml` file which is the same but with the "output_file" removed. This means when you run it via the Dockstore CLI you need to find the output by looking at the cwltool STDOUT e.g. look at this file:

    Saving copy of cwltool stdout to: /Users/boconnor/Development/gitroot/dockstore-tool-md5sum/./datastore/launcher-002bcb21-11e2-47d4-96f5-fb542eb48bb5/outputs/cwltool.stdout.txt

This will tell you the location of the output md5sum file.

You might need to use this "output_file" free `test.json` if you are executing a more strict CWL execution engine like Arvados.

#### Run with the CWL CLI

    cwltool Dockstore.cwl Dockstore.json

#### Run with the Dockstore CLI

Run it using the `dockstore` CLI locally with the Dockstore.cwl file (great for testing if you make changes locally):

```
# run this locally
$> dockstore workflow launch --entry Dockstore.cwl --local-entry --json Dockstore.json
```

Or you can run it from the latest release on Dockstore:

```
# run this from the Dockstore
$> dockstore workflow launch --entry briandoconnor/dockstore-workflow-md5sum:1.3.0 --json Dockstore.json
```

## Test with travis-ci

See the `.travis.yml` file.

## Publishing

At this point you follow the SOP from the [Dockstore.org site](https://dockstore.org/docs).
