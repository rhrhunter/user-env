# vars
INSTALL_DIR := ~/.user-env
BASH_ETC_DIR := $(INSTALL_DIR)/etc/bash
BASH_FILE_PREFIX := ~/.
SED_REPLACE_FROM := BASH_ETC_DIR
SED_REPLACE_WITH := $(BASH_ETC_DIR)
SED_COMMAND := s@$(SED_REPLACE_FROM)@$(SED_REPLACE_WITH)@g
USER_ENV_BIN := $(INSTALL_DIR)/bin
SED_USER_ENV_BIN := s@USER_ENV_BIN@$(USER_ENV_BIN)@g

# copy all files into the install dir
# backup the original bash files
# install bash_login and bash_logout into there destinations
# then correct the paths inside the bash files 
install: copy_files backup_bash_files copy_bash_files fix_bash_files

# restore all bash files and cleanup the install dir
uninstall: restore_bash_files delete_install_dir

backup_bash_files:
	mkdir -p $(INSTALL_DIR)/backup
	touch $(BASH_FILE_PREFIX)bash_login
	touch $(BASH_FILE_PREFIX)bash_logout
	touch $(BASH_FILE_PREFIX)bashrc
	cp $(BASH_FILE_PREFIX)bash_login $(INSTALL_DIR)/backup/bash_login
	cp $(BASH_FILE_PREFIX)bash_logout $(INSTALL_DIR)/backup/bash_logout
	cp $(BASH_FILE_PREFIX)bashrc $(INSTALL_DIR)/backup/bashrc

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
	sed -E -i.bak $(SED_USER_ENV_BIN) $(BASH_ETC_DIR)/path.bash
	rm $(BASH_ETC_DIR)/path.bash.bak

restore_bash_files:
	cp $(INSTALL_DIR)/backup/bash_login $(BASH_FILE_PREFIX)bash_login
	cp $(INSTALL_DIR)/backup/bash_logout $(BASH_FILE_PREFIX)bash_logout
	cp $(INSTALL_DIR)/backup/bashrc $(BASH_FILE_PREFIX)bashrc

delete_install_dir:
	rm -rf $(INSTALL_DIR)

