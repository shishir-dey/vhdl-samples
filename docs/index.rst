VHDL Digital Design Samples Documentation
==========================================

.. image:: https://github.com/shishir-dey/vhdl-samples/actions/workflows/test.yml/badge.svg
   :target: https://github.com/shishir-dey/vhdl-samples/actions/workflows/test.yml
   :alt: VHDL Tests

.. image:: https://github.com/shishir-dey/vhdl-samples/actions/workflows/docs.yml/badge.svg
   :target: https://github.com/shishir-dey/vhdl-samples/actions/workflows/docs.yml
   :alt: Documentation Status

A comprehensive collection of VHDL designs for digital circuits, organized by category and featuring a complete test suite with automated CI/CD.

Welcome to the VHDL Digital Design Samples repository! This project provides a structured collection of VHDL implementations covering fundamental digital logic concepts from basic gates to complex sequential circuits.

🚀 Quick Start
==============

Getting Started
---------------

1. **Clone the repository:**

   .. code-block:: bash

      git clone https://github.com/shishir-dey/vhdl-samples.git
      cd vhdl-samples

2. **Install GHDL:**

   **On macOS:**

   .. code-block:: bash

      brew install ghdl

   **On Ubuntu/Debian:**

   .. code-block:: bash

      sudo apt-get install ghdl

3. **Run the complete test suite:**

   .. code-block:: bash

      make test

📚 Documentation Contents
=========================

.. toctree::
   :maxdepth: 2
   :caption: Getting Started:

   installation
   quickstart
   project_structure

.. toctree::
   :maxdepth: 2
   :caption: Component Documentation:

   components/gates
   components/combinational
   components/sequential
   components/modules

.. toctree::
   :maxdepth: 2
   :caption: Testing & Verification:

   testing/framework
   testing/coverage
   testing/ci_cd

.. toctree::
   :maxdepth: 2
   :caption: Development:

   development/contributing
   development/coding_standards
   development/build_system

.. toctree::
   :maxdepth: 2
   :caption: Reference:

   reference/api
   reference/changelog
   reference/license

🏗️ Project Architecture
=======================

The project is organized into logical categories:

.. mermaid::

   graph TD
       A[VHDL Digital Design Samples] --> B[Basic Gates]
       A --> C[Combinational Logic]
       A --> D[Sequential Logic]
       A --> E[Complex Modules]
       
       B --> B1[OR Gate]
       B --> B2[XOR Gates]
       
       C --> C1[Adders]
       C --> C2[Decoders]
       C --> C3[Multiplexers]
       C --> C4[Comparators]
       C --> C5[Shifters]
       
       D --> D1[Flip-Flops]
       D --> D2[Latches]
       D --> D3[Registers]
       D --> D4[Counters]
       D --> D5[State Machines]

🧪 Test Coverage
================

Current test coverage includes:

- ✅ **Basic Logic Gates** (2/3 components)
- ✅ **Combinational Circuits** (4/19 components)
- ✅ **Sequential Circuits** (2/10 components)
- 🔄 **Counters and State Machines** (in progress)

**Total: 8 tests passing (100% success rate)**

📊 Project Statistics
=====================

.. list-table::
   :header-rows: 1
   :widths: 30 20 20 30

   * - Category
     - Source Files
     - Test Files
     - Description
   * - Gates
     - 3
     - 2
     - Basic logic gates
   * - Combinational
     - 19
     - 4
     - Combinational logic circuits
   * - Sequential
     - 10
     - 2
     - Sequential logic circuits
   * - **Total**
     - **32**
     - **8**
     - **All components**

🎯 Learning Objectives
======================

This repository demonstrates:

- **Multiple VHDL Modeling Styles**: Behavioral, Dataflow, and Structural
- **Industry Best Practices**: Proper coding standards and documentation
- **Comprehensive Testing**: Assertion-based testbenches with full coverage
- **Professional Workflow**: CI/CD with automated testing and documentation
- **Modular Design**: Organized, reusable components

🤝 Contributing
===============

We welcome contributions! Please see our :doc:`development/contributing` guide for details on:

- Setting up the development environment
- Running tests locally
- Submitting pull requests
- Code review process

📄 License
==========

This project is licensed under the MIT License - see the :doc:`reference/license` file for details.

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search` 