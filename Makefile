.PHONY: help install backup

# Default target
.DEFAULT_GOAL := help

# Variables
NVIM_CONFIG_DIR := $(HOME)/.config/nvim
TIMESTAMP := $(shell date +%Y%m%d-%H%M%S)
BACKUP_NAME := nvim-config-backup-$(TIMESTAMP).tar.gz

help:
	@echo "Available targets:"
	@echo "  make install  - Install kickstart.nvim to ~/.config/nvim (backups and cleans first)"
	@echo "  make backup   - Create a timestamped tar archive backup of ~/.config/nvim"
	@echo "  make help     - Show this help message"

install: backup
	@echo "Installing kickstart.nvim to $(NVIM_CONFIG_DIR)..."
	@if [ -d "$(NVIM_CONFIG_DIR)" ] && [ -n "$$(ls -A $(NVIM_CONFIG_DIR) 2>/dev/null)" ]; then \
		echo "Cleaning $(NVIM_CONFIG_DIR)..."; \
		rm -rf $(NVIM_CONFIG_DIR)/* $(NVIM_CONFIG_DIR)/.[!.]* $(NVIM_CONFIG_DIR)/..?* 2>/dev/null || true; \
	fi
	@mkdir -p $(NVIM_CONFIG_DIR)
	@rsync -av --exclude='.git' --exclude='Makefile' --exclude='*.tar.gz' . $(NVIM_CONFIG_DIR)/
	@echo "Installation complete!"

backup:
	@if [ ! -d "$(NVIM_CONFIG_DIR)" ] || [ -z "$$(ls -A $(NVIM_CONFIG_DIR) 2>/dev/null)" ]; then \
		echo "Info: $(NVIM_CONFIG_DIR) does not exist or is empty. Nothing to backup."; \
	else \
		echo "Creating backup archive: $(BACKUP_NAME)..."; \
		tar -czf $(BACKUP_NAME) -C $(HOME)/.config nvim; \
		echo "Backup created: $(BACKUP_NAME)"; \
	fi

