# DnD 5e Content Template
A GitHub template for you to create your own repository for collaborative DnD 5e content. I'm a LaTeX dummy, so it's got some helpful features.

It uses the [RPGTeX 5e Template.](https://github.com/rpgtex/DND-5e-LaTeX-Template)

## How to start a project

Navigate to [https://github.com/crashfrog/DnD_5e_content_template](https://github.com/crashfrog/DnD_5e_content_template) and click "Use this template" as described below:

https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template

## How to use the project

Having created your own project from the template, you can then clone the repo and start editing it. First, edit `book.tex` with the project's title and subtitle. Then edit `chapters/chapter_00/intro.tex` with your introduction and other forwarding sections.

You can use the `Makefile` to create new chapters with the chapter template: `make chapter` will add chapters in subsequent order (`01`, `02`, etc.)
