#####################################################################
#### Please don't change this file. Use Makefile-user.mk instead ####
#####################################################################
# Including user Makefile.
# Should be used to set project-specific parameters
include ./Makefile-user.mk

# Important parameters check.
# We need to make sure SMING_HOME and ESP_HOME variables are set.
# You can use Makefile-user.mk in each project or use enviromental variables to set it globally.
 
ifndef SMING_HOME
$(error SMING_HOME is not set. Please configure it in Makefile-user.mk)
endif
ifndef ESP_HOME
$(error ESP_HOME is not set. Please configure it in Makefile-user.mk)
endif

# Include main Sming Makefile
ifeq ($(RBOOT_ENABLED), 1)
include $(SMING_HOME)/Makefile-rboot.mk
else
include $(SMING_HOME)/Makefile-project.mk
endif

upload: all
ifndef FTP_SERVER
	$(error FTP_SERVER not set. Please configure it in Makefile-user.mk)
endif
ifndef FTP_USER
	$(error FTP_USER not set. Please configure it in Makefile-user.mk)
endif
ifndef FTP_PASSWORD
	$(error FTP_PASSWORD not set. Please configure it in Makefile-user.mk)
endif
ifndef FTP_PATH
	$(error FTP_PATH not set. Please configure it in Makefile-user.mk)
endif
	@echo "\nUploading firmware..."
	@ncftpput -u $(FTP_USER) -p $(FTP_PASSWORD) $(FTP_SERVER) $(FTP_PATH) out/firmware/*

copy: all
	@sudo rm -f /var/www/firmware/*
	@sudo cp out/firmware/* /var/www/firmware/
