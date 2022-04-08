## Standalone Hyrax integrated with Earthdata Login

### Prerequisites

An Earthdata Login application in the UAT environment. The Earthdata
Login application needs to be a `401` application, not `OAuth` or
`EULA`.

**IMPORTANT** In your EDL application's configuration, add the
redirect URL: `http://localhost:8080/opendap/login/urs`.

### Create configuration file

From the commandline, run:

    $ make config

Enter your Earthdata Login application's uid (the readable userid),
the EDL app's client id (unreadable), and the app's password. The make
target will create a new file `user-access.xml` using the values
you've supplied.

### Add data

To test with specific data, place it in the `mydata` subdirectory of
the project. This will be mounted into the container and will be
available to Hyrax at the top-level.

### Run the Hyrax container

From the commandline, run:

    $ make run

Then [open Hyrax in your browser](http://localhost:8080). When you
click on a dataset you will be redirected to Earthdata Login in the
*UAT* environment. Be sure to use your *UAT* credentials. Once
authenticated, you will be redirected back to the dataset you
selected.

### Stop and delete the container

Changes to the two config files will be reflected in the running
container. But to stop it and delete the container, run:

    $ make stop
