#CPRM Microsite

This is the project for the TCC CPRM Microsite. It is used to build the web page for the microsite, and for the conversion to OU template files.

The stylesheets are built using the [SASS](http://sass-lang.com) preprocessor, and vendor prefixes for the CSS are generated automatically using the [Autoprefixer](https://github.com/postcss/autoprefixer) tool after SASS compilation.

The JavaScript is built using the [CoffeeScript](http://http://coffeescript.org/) preprocessor.

The HTML is generated from the [Jade](http://jade-lang.com/) template language.

## Coding Conventions

Good formatting and comments definitely apply.

Use `/* */` comments in SCSS files to have the comment persist into the generated CSS files. Use `//` comments to have them removed. Prefer `//` style comments when possible.

Use `#` to create comments in CoffeeScript files.

Use `//` to create comments in Jade templates that are converted to HTML comments in the output. Use `//-` to create comments that are not persisted into the HTML output. Prefer the `//-` style comments when possible.

Please use 4-space indentation, as specified in the included [EditorConfig]() file.

## Build System

This build system uses [Node](https://www.nodejs.org) and [Grunt](http://gruntjs.com) to accomplish common development tasks. Be sure to have Node installed on your system, and install the Grunt command line tools with `npm install -g grunt-cli` if you haven't before.

To get started, clone this project using:
`git clone http://tccweb018.tccdweb.net/tcc-cprm-microsite.git`

Switch to the project directory, and install tools by running:
`npm install`

Use `grunt` from the command line to make a distribution build.

## Vendor Dependencies

Vendor dependencies are managed with [Bower](), and resides in the `src/vendor` folder. To use Bower, first make sure you have Bower installed globally using the `npm install -g bower` command. Dependencies are installed by running the `bower install` command at the project root folder. Vendor dependencies are listed in the `bower.json` file.

## Linting Your Code

Preferably, before running a distribution build, you should [run the code linters](http://stackoverflow.com/questions/8503559/what-is-linting) using the `grunt lint` command. Read the output and make any recommended changes, then run the lint command again until you get a clean result. Once you have clean code, then feel free to make a new distribution build.

The SCSS code linting relies on the [scss-lint Ruby gem](https://github.com/brigade/scss-lint), so you will only be able to lint if you have [Ruby](https://www.ruby-lang.org/en/) configured in your development environment, and you have installed the gem using `gem install scss_lint`.

CoffeScript code linting is handled by the node modules that are installed when you install the project. It should just work.

## Development Builds

A development build can be created with the `grunt dev` command. It will compile the site, and launch a localhost-based web server, with live reloading, using the [BrowserSync](http://www.browsersync.io/) tool. Once it's running, any changes to Jade, Sass, or Coffescript files will be compiled and then injected into the web page automagically.

## Distribution Builds

A distribution build is created with the `grunt production` command. It generates complete HTML, CSS, and JS files into the `dist` folder at the root of the project.
