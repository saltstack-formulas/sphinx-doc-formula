{% from "sphinx-doc/map.jinja" import sphinx with context %}

sphinx-doc:
  pkg:
    - installed
    - name: {{ sphinx.pkg }}
