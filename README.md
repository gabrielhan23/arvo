# Zeek Unit Test Runner

This script automates the process of running Zeek unit tests in a Docker container.

## Prerequisites

- Docker installed and running on your system
- Internet connection to pull the Docker image

## Usage

### Quick Start

1. Make the script executable:
`chmod +x run_zeek_tests.sh`
2. Run the script:
`./run_zeek_tests.sh`

### What the Script Does

The script performs the following steps automatically:

1. **Pulls Docker Image**: Downloads `n132/arvo:51132-fix`
2. **Installs Dependencies**: 
- Development libraries (libc6-dev, libpthread-stubs0-dev)
- Build tools (build-essential, gcc, g++)
- SWIG (for Python bindings)
- Python pip and BTest framework
3. **Configures Build Environment**: Sets up pthread support to avoid linking errors
4. **Builds Zeek**: Compiles the entire Zeek system from source
5. **Runs Unit Tests**: Executes all BTest unit tests and displays results

### Expected Output

- **Successful Run**: You'll see test results with pass/fail statistics
- **Build Time**: The process typically takes 10-15 minutes depending on your system
- **Test Results**: Tests will show percentage completion and final summary

