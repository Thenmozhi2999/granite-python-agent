# granite-python-agent

This project shows how to use a Docker image and GitHub Actions to automatically check a Python project.

## What This Project Does

Instead of installing Python tools manually on every machine, this project uses a Docker image that already contains the tools needed for development and testing.

When code is pushed to GitHub, GitHub Actions automatically runs the checks inside that Docker image.

That means GitHub can verify that the project is still working without you having to run everything by hand each time.

## What We Set Up

We created:

- a Docker image with Python and development tools
- a build script that runs the project checks
- a GitHub Actions workflow that uses the Docker image

## Main Files

### `Dockerfile`

This file builds the Docker image.

It installs tools such as:

- Python
- Poetry
- Ruff
- Black
- Pytest

### `build.sh`

This script tells the container what to do.

It runs:

```bash
poetry install --no-root --no-interaction
ruff check .
black --check .
pytest
```

So the project dependencies are installed, then the code is checked and tested.

### `.github/workflows/use-docker-image.yml`

This is the GitHub Actions workflow.

It tells GitHub:

- when to run the workflow
- which Docker image to use
- which command to run

In this project, GitHub uses the published Docker image:

```text
thenmozhisekar/granite-python-dev:latest
```

Then it checks out the repository and runs:

```bash
bash ./build.sh
```

## How The Full Flow Works

1. You write or change code.
2. You commit and push the code to GitHub.
3. GitHub Actions starts automatically.
4. GitHub runs the workflow inside the Docker image.
5. The workflow runs `build.sh`.
6. The project is checked with Ruff, Black, and Pytest.
7. GitHub shows a green check if everything passes.

## Why This Is Useful

This setup is useful because:

- everyone uses the same environment
- checks run automatically on GitHub
- problems can be caught early
- the project is easier to share and reproduce
- you do not need to set up all tools manually every time

## In Simple Words

Think of it like this:

- Docker image = a ready-made toolbox
- `build.sh` = instructions for using the toolbox
- GitHub Actions = the robot that automatically uses the toolbox when code is pushed

So whenever the code changes, GitHub automatically opens the toolbox and checks whether everything is okay.

## How To Run Locally

You can run the same checks locally with Docker:

```powershell
docker run --rm -v ${PWD}:/workspace thenmozhisekar/granite-python-dev:latest
```

## Current Workflow Result

The GitHub Actions workflow has already been tested successfully in this repository. Green workflow runs mean the automation is working correctly.
