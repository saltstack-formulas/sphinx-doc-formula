==================
sphinx-doc-formula
==================

Formulas to install the `Sphinx`_ documentation system.

.. _`Sphinx`: http://sphinx-doc.org/

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``sphinx_doc``
--------------

Installs the Sphinx package.

``sphinx_doc.build``
--------------------

A macro for generating a state that will trigger a docs build.

Usage example. The following will trigger a build of the HTML documentation
anytime the Git repo is updated::

    {% from "sphinx_doc/build.sls" import sphinx_build %}
    {% sphinx_build(
        'mydocs_build',
        'html',
        '/path/to/mydocs/docs',
        '/path/to/mydocs/docs/_build',
        wait=True) %}

    mydocs:
      git.latest:
        - name: git@github.com/myco/mydocs.git
        - target: /var/www/mydocs
        - rev: master
        - watch_in:
          - cmd: mydocs_build

``sphinx_doc.sphinx_venv``
--------------------------

Installs the Sphinx package to an empty virtualenv.

Requires:

* virtualenv-formula
* Pillar:

  * ``sphinx_doc:venv`` to point to the virtualenv that Sphinx is installed to.
