==================
sphinx-doc-formula
==================

Formulas to install the `Sphinx`_ documentation system.

.. _`Sphinx`: http://sphinx-doc.org/

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/r/ref:conventions-formula>`_.

Available states
================

.. contents::
    :local:

``sphinx-doc``
--------------

Installs the Sphinx package.

``sphinx-doc.sphinx_venv``
--------------------------

Installs the Sphinx package to an empty virtualenv.

Requires the formulas:

* pip
* virtualenv

Requires a Pillar setting to determine the location of the virtualenv.
