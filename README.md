# SWIFT VIPER GENERATOR aka SWIVIGEN

## Installation

Requirements:
* python3
* pip3
* XCode that supports recent versions of Swift

To install run 
`pip3 install SwiftViperGenerator`

## Usage

`swivigen [-h] [--init] project module` where
* `project` is XCode project that should be modified (specify with .xcodeproj extension)
* `module` is name for new VIPER module, for example, Login or Options
*  ` -h` or ` --help` will show help (actually this paragraph)
* `--init` will add base swivigen Swift files into project

swivigen expects file named `viper_settings.py` to be present in directory from which it was called. This file has next structure:

	def viper_settings():
		return {'project_dir': 'PROJECT_DIR',
			'templates_dir': 'TEMPLATES_DIR',
			'uikit_controllers_group': 'XCODEPROJ_GROUP',
			'author': 'AUTHOR'}` 

where
* PROJECT_DIR is a directory of project that should be used (useful in case it has different name with project itself)
* TEMPLATES_DIR is a directory with Swift templates; type `{TEMPLATES}` to use swivigen default templates
* XCODEPROJ_GROUP is project group under which generated ViewControllers should be stored
* AUTHOR is a name of project developer or maintainer to use in docucomments

### Note

Sometimes XCode project should be re-opened for changes to take place.

## License 

MIT License

## Contact

bogdanivanov at live.com
