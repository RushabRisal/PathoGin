# Project github.com/anishkn04/PathoGin

PathoGin is a pathology lab management system that provides an easy interface to create and manage lab reports, referrers, staff, and much more.

### For contribution: [Contribution Guide](/CONTRIBUTING.md) 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisite

- ### Ensure you have the following installed:
    - Docker
    - GNU Make

- ### Create .env file
    Refer to the `.env.example` file for the required variables and their descriptions.
## MakeFile

Run build make command with tests
```bash
make all
```

Build the application
```bash
make build
```

Run the application
```bash
make run
```
Create DB container
```bash
make docker-run
```

Shutdown DB Container
```bash
make docker-down
```

DB Integrations Test:
```bash
make itest
```

Live reload the application:
```bash
make watch
```

Run the test suite:
```bash
make test
```

Clean up binary from the last build:
```bash
make clean
```
