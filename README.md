# QGIS Nextcloud Phonetrack Importer
This Plugin imports tracks from the [Nextcloud Phonetrack Plugin](https://apps.nextcloud.com/apps/phonetrack) into the geographic information system [QGIS](https://qgis.org/).

This Plugin is still experimental. Please report bugs via the Bugtracker.

## Installation
### ZIP
Download the released zip file and open it in the Plugin Manager which can be found in the menu Plugins -> Manage and Install Plugins. Choose in the Plugin Manager Install from ZIP and choose the ZIP file downloaded before.

### Manual installation
Create a directory named like the Plugin in the plugins directory of QGIS which is normally located in your home directory at:
* Linux: .local/share/QGIS/QGIS3/profiles/default/python/plugins/
* Mac OS X: Library/Application Support/QGIS/QGIS3/profiles/default/python/plugins
* Windows: AppData\Roaming\QGIS\QGIS3\profiles\default\python\plugins'
After adding the files open the Plugin Manager which can be found in the menu Plugins -> Manage and Install Plugins. Search in the list for this plugin and check the checkbox.

## Useage
After successfully installing the plugin there is a icon in the toolbar (![Import Nextcloud Phonetrack](/icon.png?raw=true "Import Nextcloud Phonetrack")) which opens a dialog. Add there the correspondging API-URL from Nextcloud Phonetrack. If the URL field is left empty the corresponding layer is not created. The intervall field gives the time between synchronisations, enter 0 to do only one initial import of the data without automatic updates. In order to disable an already running update process open the dialog box again and remove all URLS so that the field is empty, set the intervall field to 0 and press ok. There is also a possibilty to only import data which are newer than the given date. Please be aware, that the timestamps in the data might not be perfectly accurate, there might be problems with the timezone or a wrong time at a tracking device. The tool will only download a limited number of points, it is possible to enter the limit for the initial import and for updates separately.

## TODO:
* Fix Documentation and this readme file
* Translations (Plugin is currently german only)
