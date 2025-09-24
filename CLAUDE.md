# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Build and Test
- **Build**: `cargo build` or `cargo build --release` for release builds
- **Run**: `cargo run` to execute the TUI application
- **Test**: `cargo test --verbose` to run tests
- **Binary name**: The executable is built as `KC-Learning-Script`

### Development Workflow
The project uses GitHub Actions for CI/CD with automatic builds and tests on push/PR to master branch.

## Architecture Overview

This is a Terminal User Interface (TUI) application built with Rust and the `ratatui` crate. It serves as a cybersecurity and coding learning toolbox with an interactive command runner.

### Core Components

**Application Structure:**
- `main.rs`: Entry point, handles terminal setup and main event loop
- `state.rs`: Central application state management (`AppState` struct)
- `tabs.rs`: Tab system for organizing learning modules and commands
- `float.rs`/`floating_text.rs`: Floating window system for displaying help/info
- `running_command.rs`: Handles execution of shell commands and scripts
- `theme.rs`: Theme system for UI styling
- `search.rs`: Search functionality across commands

**Key Architecture Patterns:**
- State-driven UI with centralized `AppState`
- Tab-based navigation with dynamic content loading
- Command execution through embedded scripts in `src/commands/`
- TOML-based configuration for tabs and command definitions

### Command System

Commands are organized in the `src/commands/` directory:
- `tabs.toml`: Defines available tab directories (`Cyber-Learning`, `Code-Learning`)
- Each learning module has its own `tab_data.toml` file defining available commands
- Shell scripts are embedded and extracted to temporary directories at runtime
- Commands support preconditions for platform/environment compatibility

### Data Flow
1. Application loads command definitions from TOML files
2. Commands are organized into a tree structure for navigation
3. User navigates through tabs and command categories
4. Selected commands execute via `portable-pty` for cross-platform compatibility
5. Output is displayed in the TUI with real-time updates

### Key Dependencies
- `ratatui`: TUI framework
- `crossterm`: Cross-platform terminal handling
- `portable-pty`: Cross-platform pseudo-terminal
- `clap`: Command-line argument parsing
- `include_dir`: Embedding command files in binary
- `toml`: Configuration file parsing
- `ego-tree`: Tree data structure for command hierarchy

This application follows a modular design where learning content can be easily added by creating new TOML configuration files and corresponding shell scripts.

## Common Issues and Troubleshooting

### TOML Configuration Structure
Each entry in `tab_data.toml` files must have one of these data types:
- `entries` - for nested subentries (creates expandable folders)
- `command` - for raw shell commands
- `script` - for script file paths

Example structure:
```toml
[[data]]
name = "Category Name"
description = "Category description"
[[data.entries]]
name = "Command Name"
description = "Command description"
command = "ls -la"
```

### Terminal Requirements
- This is a TUI application that requires an interactive terminal
- May fail in non-interactive environments or CI/CD systems
- Run in a proper terminal emulator for best experience