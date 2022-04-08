## Standalone Hyrax integrated with Earthdata Login

### Create configuration file

From the commandline, run:

    $ make config

Entering your Earthdata Login application's uid (the readable userid),
the EDL app's client id (unreadable), and the app's password. The make
target will create a new file `user-access.xml` using the values
you've supplied.

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

## Notes

The Earthdata Login application needs to be a `401` application, not
`OAuth` or `EULA`. Be sure the Earthdata Login application is defined
in the UAT environment!

To test with specific data, place it in the `data` subdirectory. This
will be mounted into the container and be available to Hyrax.
