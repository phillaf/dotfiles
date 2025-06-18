#!/bin/bash

# Download and install official rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Restart your shell or source the environment
source ~/.cargo/env

# Now add the components
rustup component add rust-analyzer rust-src
