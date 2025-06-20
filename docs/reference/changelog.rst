Changelog
=========

All notable changes to the VHDL Digital Design Samples project.

The format is based on `Keep a Changelog <https://keepachangelog.com/en/1.0.0/>`_, and this project adheres to `Semantic Versioning <https://semver.org/spec/v2.0.0.html>`_.

[Unreleased]
------------

Added
~~~~~
- Comprehensive Sphinx documentation system
- GitHub Pages deployment via GitHub Actions
- Documentation workflow with automatic building
- Professional documentation theme with Read the Docs theme
- Mermaid diagram support for architecture visualization

[1.0.0] - 2025-01-06
---------------------

Added
~~~~~

**Project Structure:**
- Complete reorganization of VHDL files into logical categories
- Hierarchical directory structure: gates, combinational, sequential, modules
- Professional project layout with separated source and test directories

**Testing Framework:**
- Comprehensive test runner script with colored output
- Automated test discovery and execution
- GHDL integration with proper error handling
- Individual component testing capabilities
- Complete test suite with 100% pass rate (8/8 tests)

**Components:**
- Basic logic gates: OR gate, XOR gates (behavioral, dataflow, structural)
- Combinational logic: Adders, decoders, multiplexers, comparators, shifters
- Sequential logic: Flip-flops, latches, registers, counters, state machines
- 32 total VHDL source files with standardized headers

**Build System:**
- Comprehensive Makefile with intuitive targets
- GHDL integration with proper flags and standards
- Build automation and dependency management
- Project statistics and reporting
- Clean and install targets

**CI/CD Pipeline:**
- GitHub Actions workflow for automated testing
- Ubuntu environment with GHDL installation
- Automated test execution on push and pull requests
- Test result artifacts and reporting

**Documentation:**
- Complete README with project overview and usage instructions
- Installation guide for multiple platforms
- Component documentation and examples
- Professional project presentation

**Quality Assurance:**
- Standardized VHDL file headers with project metadata
- Consistent coding style and conventions
- Comprehensive test coverage for critical components
- Error handling and validation

Changed
~~~~~~~
- Migrated from flat file structure to hierarchical organization
- Updated README with comprehensive project information
- Improved test reliability with proper timing and assertions
- Enhanced Makefile with more intuitive target names

Fixed
~~~~~
- VHDL syntax errors in testbenches (timing units, deprecated packages)
- Test script path resolution issues
- Component instantiation mismatches
- Infinite loop issues in ripple carry adder testbench

Security
~~~~~~~~
- No security-related changes in this release

[0.1.0] - Initial Release
-------------------------

Added
~~~~~
- Basic VHDL file collection in single directory
- Simple testbench structure
- Basic README documentation
- MIT License

Technical Details
-----------------

**Supported Platforms:**
- macOS (with Homebrew)
- Ubuntu/Debian Linux
- Windows (via WSL)

**Dependencies:**
- GHDL 5.0.1 or later
- GNU Make 3.81 or later
- Git 2.0 or later

**Metrics:**
- Total lines of code: 1,754
- Test coverage: 25% (8/32 components)
- Build success rate: 100%
- Test pass rate: 100%

Migration Guide
---------------

**From 0.1.0 to 1.0.0:**

If you have an existing clone of the repository:

.. code-block:: bash

   # Pull the latest changes
   git pull origin master
   
   # Run tests to verify everything works
   make test
   
   # Update any custom scripts that reference old paths
   # Old: src/component.vhd
   # New: src/category/component.vhd

Known Issues
------------

- Some components lack comprehensive testbenches (addressed in roadmap)
- Documentation build requires Python dependencies (optional)
- GTKWave integration not yet automated

Future Releases
---------------

**Planned for 1.1.0:**
- Additional testbenches for untested components
- Performance benchmarking framework
- Waveform generation and analysis tools
- Advanced state machine examples

**Planned for 1.2.0:**
- FPGA synthesis examples
- Timing constraint files
- Place and route examples
- Hardware-in-the-loop testing

**Planned for 2.0.0:**
- SystemVerilog interoperability
- UVM testbench framework
- Formal verification examples
- Advanced verification methodologies 