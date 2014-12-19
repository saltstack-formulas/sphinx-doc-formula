# A macro to build states that will kick off a Sphinx documentation build
#
# :param state_id: The unique state ID to use for this state.
# :param format: Which format to build (a valid option in the project Sphinx Makefile).
# :param docs_dir: The path to the Sphinx documentation directory (contains conf.py).
# :param build_dir: The path to the directory that stores build files.
# :param sphinx_build: (optional) A path to the sphinx-build script to execute.
# :param env: (optional) A dictionary of environment variables for the command.

{% macro sphinx_build(
    state_id,
    format,
    docs_dir,
    build_dir,
    sphinx_build='sphinx-build',
    env=None,
) %}

{{ state_id }}:
  cmd.run:
    - name: |
        make {{ format }} \
            SPHINXOPTS='-q' \
            BUILDDIR={{ build_dir }} \
            SPHINXBUILD={{ sphinx_build }} \
            LATEXOPTS="-interaction=nonstopmode"
    - cwd: {{ docs_dir }}
    {% if env %}
    - env: {{ env | json() }}
    {% endif %}

{% endmacro %}
