# DnD 5e Content Template
A GitHub template for you to create your own repository for collaborative DnD 5e content. I'm a LaTeX dummy, so it's got some helpful features.

It uses the [RPGTeX 5e Template.](https://github.com/rpgtex/DND-5e-LaTeX-Template)

Q: What is it?  
A: It's a GitHub repo template you can fork to create your _own_ repository of collaborative open-source 5e content, for your own projects, with LaTeX extensions for laying out content in a 5e style (based on rpgtex's DND-5e-LaTeX-Template, which is included as a subrepository) and a Makefile to make it easy to compile to PDF. 

Q: How do I use it?   
A: When you create your own repo, it'll include a Makefile with commands for creating new chapters and compiling the work into a formatted PDF. The README lists some of those commands.

Q: How do I write 5e content in LaTeX?  
A: When you clone the template, it'll contain "chapter 00/intro.tex" which has examples of the 5e style commands the RPGTeX template makes available.

Q: Why should I write my 5e content in GitHub?  
A: In addition to issue tracking and being able to collaborate on the project, developing your projects openly means others can learn from your process - they'll be able to see changes over time in the commit history.

## How to start a project

Navigate to [https://github.com/crashfrog/DnD_5e_content_template](https://github.com/crashfrog/DnD_5e_content_template) and click "Use this template" as described below:

https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template

## How to use the project

Having created your own project from the template, you can then clone the repo and start editing it. First you'll need to clone RPGTeX's 5e template by running `make setup`. Then, edit `book.tex` with the project's title and subtitle. Then edit `chapters/chapter_00/intro.tex` with your introduction and other forwarding sections.

You can use the `Makefile` to create new chapters with the chapter template: `make chapter` will add chapters in subsequent order (`01`, `02`, etc.)

## Installing the build system

### Debian, Ubuntu
```
    sudo apt-get install make rubber texlive-full inotify-tools
```

### MacOS
```
    brew install make texlive # I think?
```

### Windows
Don't really know, yet. Run it in Ubuntu for Windows.

## Commands

`make setup` - clone RPGTeX's DnD template.  
`make chapter` - create a new directory in `chapters` with the chapter template (`lib/templates/chapter.template`.)  
`make clean` - clean up build files.  
`make cleanall` - clean up build files and generated output files.  
`make book` - compile the book into a formatted PDF (`dist/book.pdf`.)