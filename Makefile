# vars

INSTALL_DIR := ~/.user-env
BASH_ETC_DIR = $(INSTALL_DIR)/etc/bash
BASH_FILE_PREFIX := ~/.
SED_REPLACE_FROM := BASH_ETC_DIR
SED_REPLACE_WITH := $(BASH_ETC_DIR)
SED_COMMAND = s@$(SED_REPLACE_FROM)@$(SED_REPLACE_WITH)@g

# copy all files into the install dir
# install bash_login and bash_logout into there destinations
# then correct the paths inside the bash files 
install: copy_files copy_bash_files fix_bash_files

clean:
	rm -rf $(INSTALL_DIR)

copy_files:
	mkdir -p $(INSTALL_DIR)
	cp -r $(PWD)/* $(INSTALL_DIR)

copy_bash_files:
	cp $(BASH_ETC_DIR)/bash_login $(BASH_FILE_PREFIX)bash_login
	cp $(BASH_ETC_DIR)/bash_login $(BASH_FILE_PREFIX)bashrc
	cp $(BASH_ETC_DIR)/bash_logout $(BASH_FILE_PREFIX)bash_logout

fix_bash_files:
	sed -E -i.bak -e $(SED_COMMAND) $(BASH_FILE_PREFIX)bash_login
	rm $(BASH_FILE_PREFIX)bash_login.bak
	sed -E -i.bak -e $(SED_COMMAND) $(BASH_FILE_PREFIX)bashrc
	rm $(BASH_FILE_PREFIX)bashrc.bak
