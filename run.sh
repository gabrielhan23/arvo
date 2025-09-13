#!/bin/bash

set -e  # Exit on any error

echo "========================================="
echo "Zeek Unit Test Runner"
echo "========================================="

# Pull and run the Docker container
echo "Starting Docker container..."
docker run --rm -it n132/arvo:65933-fix bash -c '
echo "Installing dependencies..."
apt-get update -qq
apt-get install -y libc6-dev libpthread-stubs0-dev build-essential swig python3-pip gcc g++ > /dev/null 2>&1

echo "Installing BTest..."
cd testing/btest
pip install btest > /dev/null 2>&1
cd ../..

echo "Setting up build environment with pthread support..."
export CC=gcc
export CXX=g++
export CXXFLAGS="-pthread -O2 -g"
export CFLAGS="-pthread -O2 -g"  
export LDFLAGS="-pthread -lpthread"

echo "Configuring Zeek..."
./configure > /dev/null 2>&1

echo "Building Zeek (this may take several minutes)..."
make > /dev/null 2>&1

echo "Running unit tests..."
cd testing/btest
echo "========================================="
echo "Test Results:"
echo "========================================="
make all
echo "========================================="
echo "Tests completed!"
'

