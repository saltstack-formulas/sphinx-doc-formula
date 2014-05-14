{% from "sphinx_doc/map.jinja" import sphinx with context %}

include:
  - pip
  - virtualenv

{% set config = salt['pillar.get']('sphinx_doc', {}) %}

{% if 'venv' in config %}
sphinx_venv:
  pip:
    - installed
    - name: {{ sphinx.pip_pkg }}
    - bin_env: {{ config.venv }}
    - require:
      - pkg: python-pip
      - pkg: virtualenv
{% endif %}
