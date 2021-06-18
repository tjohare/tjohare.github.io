# TJ's helper site for MkDocs Projects

For full documentation visit [mkdocs.org](https://www.mkdocs.org).

The basic styling can be found on the [MkDocs Style Guide](https://www.mkdocs.org/user-guide/styling-your-docs/).

The styling for the Material Theme for MkDocs can be found on the [Github.io pages for mkdocs-material](https://squidfunk.github.io/mkdocs-material/getting-started/).

GitHub Pages Documentation can be found at: https://docs.github.com/en/pages



## Basic / Initial Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Project layout
This is the layout of the mkdocs projects.  It contains both what the original project structure looks like when you invoke `mkdocs new [dir-name]` as well as the current updated structure.

??? info "Initial New project structure"
    ```
    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
    ```

??? info "Current project structure"
    ```
    mkdocs.yml            # The configuration file.
    custom/
        partials/
            footer.html   #customized footer file
    docs/
        stylesheets/
            extra.css     #customized css settings
        index.md          # The documentation homepage.
    ```

## Chocolatey commands

* `choco list --local-only` - List locally installed chocolatey applications
* `cup all -y` - List locally installed chocolatey applications and update them if necessary.  the -y option for YES to upgrade them.
