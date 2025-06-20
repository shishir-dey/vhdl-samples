Contributing Guide
==================

How to contribute to the VHDL Digital Design Samples project.

Getting Started
---------------

1. **Fork the repository** on GitHub
2. **Clone your fork** locally
3. **Set up the development environment**
4. **Create a feature branch** for your changes
5. **Make your changes** following the coding standards
6. **Test your changes** thoroughly
7. **Submit a pull request**

Development Setup
-----------------

.. code-block:: bash

   # Clone your fork
   git clone https://github.com/shishir-dey/vhdl-samples.git
   cd vhdl-samples
   
   # Install GHDL
   make install  # macOS
   # or sudo apt-get install ghdl  # Ubuntu
   
   # Install documentation dependencies (optional)
   make docs-install
   
   # Run tests to verify setup
   make test

Coding Standards
----------------

**VHDL Code Style:**

- Use lowercase with underscores for entity names
- Use PascalCase for architecture names
- Follow consistent indentation (2 spaces)
- Include comprehensive comments

**File Organization:**

- Place source files in appropriate ``src/`` subdirectories
- Create corresponding test files in ``test/`` subdirectories
- Follow existing naming conventions

**Testing Requirements:**

- Every new component must have a testbench
- Tests should be comprehensive and self-checking
- Use assertions for automatic verification

Submitting Changes
------------------

1. **Create a feature branch**: ``git checkout -b feature/new-component``
2. **Make your changes** with clear, descriptive commits
3. **Run tests**: ``make test`` to ensure nothing breaks
4. **Update documentation** if needed
5. **Push to your fork**: ``git push origin feature/new-component``
6. **Open a pull request** with a clear description

Pull Request Guidelines
-----------------------

**Good Pull Requests:**

- Have a clear, descriptive title
- Include a detailed description of changes
- Reference any related issues
- Include tests for new functionality
- Update documentation when needed
- Pass all existing tests

**Review Process:**

- Maintainers will review your PR
- Address any feedback promptly
- Be patient - reviews may take time
- Keep your PR up to date with the main branch

Types of Contributions
----------------------

**New Components:**

- Logic gates and basic circuits
- Combinational logic designs
- Sequential logic implementations
- Complex digital systems

**Documentation:**

- Component documentation
- Tutorial improvements
- API documentation
- Example code

**Testing:**

- New testbenches for existing components
- Improved test coverage
- Performance benchmarks
- CI/CD improvements

**Bug Fixes:**

- VHDL syntax errors
- Simulation issues
- Documentation corrections
- Build system improvements

Code of Conduct
---------------

Be respectful and constructive in all interactions. This is an educational project aimed at helping people learn VHDL. 