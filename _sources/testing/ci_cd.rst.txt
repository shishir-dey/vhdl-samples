CI/CD Pipeline
==============

Continuous Integration and Deployment setup for the VHDL project.

Overview
--------

The project uses GitHub Actions for automated testing and documentation deployment:

- **VHDL Tests**: Automated on every push and pull request
- **Documentation**: Built and deployed to GitHub Pages
- **Multi-platform**: Tested on Ubuntu with GHDL

GitHub Actions Workflows
------------------------

VHDL Testing Workflow
~~~~~~~~~~~~~~~~~~~~~

**File**: ``.github/workflows/test.yml``

**Triggers**:
- Push to ``master`` or ``main`` branches
- Pull requests to ``master`` or ``main`` branches

**Steps**:
1. Install GHDL on Ubuntu
2. Make test scripts executable
3. Run complete test suite
4. Upload test results as artifacts

Documentation Workflow
~~~~~~~~~~~~~~~~~~~~~~

**File**: ``.github/workflows/docs.yml``

**Triggers**:
- Push to ``master`` or ``main`` branches
- Manual workflow dispatch

**Steps**:
1. Install Python and Sphinx dependencies
2. Build documentation with Sphinx
3. Deploy to GitHub Pages

Local Development
-----------------

**Test locally:**

.. code-block:: bash

   make test

**Build documentation locally:**

.. code-block:: bash

   make docs
   make docs-serve

Status Badges
-------------

The project includes status badges for:

- **Test Status**: Shows if all tests are passing
- **Documentation Status**: Shows documentation build status
- **GitHub Pages**: Shows deployment status

These badges are displayed on the main project README and documentation homepage. 