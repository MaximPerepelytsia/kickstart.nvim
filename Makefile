# Neovim Configuration Management Makefile
# This Makefile helps manage your Neovim configuration

.PHONY: help backup copy install clean

# Default target
help:
	@echo "Neovim Configuration Management"
	@echo "=============================="
	@echo ""
	@echo "Available tasks:"
	@echo "  help     - Show this help message"
	@echo "  backup   - Create a backup of current ~/.config/nvim folder"
	@echo "  copy     - Copy this config to ~/.config/nvim"
	@echo "  install  - Backup current config and install this one"
	@echo "  clean    - Remove backup files"
	@echo ""
	@echo "Usage examples:"
	@echo "  make backup    # Backup current config"
	@echo "  make install   # Full backup + install"
	@echo "  make copy      # Install without backup"

# Create backup of current Neovim config
backup:
	@echo "Creating backup of current Neovim configuration..."
	@if [ -d "$(HOME)/.config/nvim" ]; then \
		BACKUP_NAME="nvim_backup_$$(date +%Y%m%d_%H%M%S).zip"; \
		cd "$(HOME)/.config" && zip -r "$$BACKUP_NAME" nvim/; \
		echo "Backup created: $$BACKUP_NAME"; \
	else \
		echo "No existing Neovim config found at ~/.config/nvim"; \
	fi

# Copy this config to ~/.config/nvim
copy:
	@echo "Installing Neovim configuration..."
	@mkdir -p "$(HOME)/.config"
	@if [ -d "$(HOME)/.config/nvim" ]; then \
		echo "Removing existing Neovim config..."; \
		rm -rf "$(HOME)/.config/nvim"; \
	fi
	@cp -r . "$(HOME)/.config/nvim"
	@echo "Configuration installed to ~/.config/nvim"
	@echo "You may need to restart Neovim for changes to take effect"

# Full install: backup + copy
install: backup copy
	@echo ""
	@echo "Installation complete!"
	@echo "Your previous configuration has been backed up."
	@echo "New configuration is now active at ~/.config/nvim"

# Clean up backup files
clean:
	@echo "Cleaning up backup files..."
	@cd "$(HOME)/.config" && rm -f nvim_backup_*.zip
	@echo "Backup files removed"
