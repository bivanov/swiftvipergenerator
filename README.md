# SWIFT VIPER GENERATOR aka SWIVIGEN

## Installation

Requirements:
* python3
* pip3
* XCode that supports recent versions of Swift

To install run `pip3 install SwiftViperGenerator`.

## Usage

swivigen provides two main commands to cooperate with XCode project. One command is `init` and another is `add`.

### `Init` command

`usage: swivigen init [-h] [-t TARGETS [TARGETS ...]] [-c CONFIG | -i] project`

```
positional arguments:
  project               XCode project that should be modified

optional arguments:
  -h, --help            show this help message and exit
  -t TARGETS [TARGETS ...], --targets TARGETS [TARGETS ...]
                        specify list of targets where created files will be
                        included; if not specified, all targets will include
                        new files OR targets from config file will be used if any
  -c CONFIG, --config CONFIG
                        path to YAML config file
  -i, --initfile        create default YAML config file
```

This command will copy and add to specified project all needed common VIPER files. Currently these are AbstractPresenter, AbstractRouter, TabBarRouter, ViperController and ViperTabBarController. It also can add default yml config file. 

Examples:

`swivigen init -i MyProject.xcodeproj -t Debug Release` - *note that `-t` argument should be specified after project and module name* \
`swivigen init -c /path/to/config.yml ViperProject.xcodeproj`

### `Add` command

```
usage: swivigen add [-h] [-c CONFIG] [-s STORYBOARD]
                    [-t TARGETS [TARGETS ...]]
                    project module
```

```
positional arguments:
  project               XCode project that should be modified
  module                name for new viper module

optional arguments:
  -h, --help            show this help message and exit
  -c CONFIG, --config CONFIG
                        path to YAML config file
  -s STORYBOARD, --storyboard STORYBOARD
                        specify name of storyboard where created controller
                        will be placed by user
  -t TARGETS [TARGETS ...], --targets TARGETS [TARGETS ...]
                        specify list of targets where created files will be
                        included; if not specified, all targets will include
                        new files OR targets from config file will be used if any
```

This command will create view, interactor, presenter and router with name specified with `module` argument.

Examples:

`swivigen add -c /path/to/config.yml ViperProject.xcodeproj Login` \
`swivigen add -s Profile MyProject.xcodeproj EditProfile` \
`swivigen add Application.xcodeproj Tutorial -t Application ApplicationDev` - *note that `-t` argument should be specified after project and module name as well*

### Config file

YAML config file has next structure:

	project_dir: PROJECT_DIR
	templates_dir: TEMPLATES_DIR
	uikit_controllers_group: XCODEPROJ_GROUP
	author: AUTHOR
	targets: [TARGETS_LIST]
	base_viewcontroller: UIViewController

where
* `project_dir` is a directory of project that should be used (useful in case it has different name than project itself); should be relative to project file e.g. `ProjectFolder` but not `./ProjectFolder`
* `templates_dir` is a directory with Swift templates; type `$TEMPLATES` to use swivigen default templates
* `uikit_controllers_group` is project group under which generated ViewControllers should be stored
* `author` is a name of project developer or maintainer to use in docucomments
* `targets` is a list of targets in which created files will be included; this value will be overwritten by list provided with `-t` cli option
* `base_viewcontroller` is a subclass of UIViewController or UIViewController itself; it is used only while initializing VIPER common sources: ViperController will be marked as subclass of this class

## Notes

Sometimes XCode project should be re-opened for changes to take place. \
It may take some time (around 10 seconds or so) for swivigen to finish on big projects with complicated structure.

Kudos to Ignacio Calderon who created awesome [mod-pbxproj](https://github.com/kronenthaler/mod-pbxproj).

## License 

MIT License

## Contact

bogdanivanov at live.com
