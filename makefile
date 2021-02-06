#/***************************************************************************
# NextcloudPhonetrack
#
# Nextcloud Phonetrack Link imports Points/ Lines from a Nextcloud instance.
#							 -------------------
#		begin				: 2021-01-16
#		git sha				: $Format:%H$
#		copyright			: (C) 2021 by Joachim Beerwerth
#		email				: joachim.beerwerth@tu-dortmund.de
# ***************************************************************************/
#
#/***************************************************************************
# *																		 *
# *   This program is free software; you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation; either version 3 of the License, or	 *
# *   (at your option) any later version.								   *
# *																		 *
# ***************************************************************************/

SOURCES = \
	__init__.py \
	NextcloudPhonetrack.py NextcloudPhonetrack_dialog.py

PLUGINNAME = NextcloudPhonetrack

PY_FILES = \
	__init__.py \
	NextcloudPhonetrack.py NextcloudPhonetrack_dialog.py

UI_FILES = NextcloudPhonetrack_dialog_base.ui

EXTRAS = metadata.txt icon.svg

#EXTRA_DIRS =

COMPILED_RESOURCE_FILES = resources.py

QGISDIR=$(HOME)/.local/share/QGIS/QGIS3/profiles/default/python/plugins/

compile: $(COMPILED_RESOURCE_FILES)

%.py : %.qrc $(RESOURCES_SRC)
	pyrcc5 -o $*.py  $<

deploy: compile
	@echo
	@echo "------------------------------------------"
	@echo "Deploying plugin to your QGIS3 directory."
	@echo "------------------------------------------"
	# The deploy  target only works on unix like operating system where
	# the Python plugin directory is located at $(QGISDIR)
	mkdir -p $(QGISDIR)$(PLUGINNAME)
	cp -vf $(PY_FILES) $(QGISDIR)$(PLUGINNAME)
	cp -vf $(UI_FILES) $(QGISDIR)$(PLUGINNAME)
	cp -vf $(COMPILED_RESOURCE_FILES) $(QGISDIR)$(PLUGINNAME)
	cp -vf $(EXTRAS) $(QGISDIR)$(PLUGINNAME)

zip: deploy
	@echo
	@echo "---------------------------"
	@echo "Creating plugin zip bundle."
	@echo "---------------------------"
	# The zip target deploys the plugin and creates a zip file with the deployed
	# content. You can then upload the zip file on http://plugins.qgis.org
	rm -f $(PLUGINNAME).zip
	cd $(QGISDIR); zip -9r "$(CURDIR)/$(PLUGINNAME).zip" "$(PLUGINNAME)" -x "$(PLUGINNAME)/__pycache__"

clean:
	@echo
	@echo "------------------------------------"
	@echo "Removing uic and rcc generated files"
	@echo "------------------------------------"
	rm $(COMPILED_RESOURCE_FILES)

remove:
	@echo
	@echo "------------------------------------------"
	@echo "Removing plugin from your QGIS3 directory."
	@echo "------------------------------------------"
	rm -rf $(QGISDIR)$(PLUGINNAME)
