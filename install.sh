# Define variables for source and destination directories
SOURCE_DIR=$HOME/dotfiles
DESTINATION_DIR=$HOME

create_symlink() {
	local source=$1
	local target=$2

	# Check if target file already exists
	if [ ! -e "$target" ]; then
		# Create symbolic link
		ln -s "$source" "$target"
	fi
}

# Function to create symbolic links for files in a directory
create_symlinks_in_directory() {
    local source_dir=$1
    local target_dir=$2

    # Check if the source directory exists
    if [ -d "$source_dir" ]; then
        # Create target directory if it doesn't exist
        if [ ! -d "$target_dir" ]; then
            mkdir -p "$target_dir"
        fi

        # Iterate through files in source directory
        for file in "$source_dir"/*; do
            if [ -f "$file" ]; then
                # Get file name without path
                filename=$(basename "$file")
                # Check if target file already exists
                if [ ! -e "$target_dir/$filename" ]; then
                    # Create symbolic link for each file
                    create_symlink "$file" "$target_dir/$filename"
                fi
            elif [ -d "$file" ]; then
                # Recursively call the function for subdirectories
                subdir_target_dir="$target_dir/$(basename "$file")"
                create_symlinks_in_directory "$file" "$subdir_target_dir"
            fi
        done
    else
        echo "Source directory $source_dir does not exist."
    fi
}

# Create symbolic links for each file/folder

# kitty folder
create_symlinks_in_directory "$SOURCE_DIR/kitty" "$DESTINATION_DIR/.config/kitty"

# nvim folder
create_symlinks_in_directory "$SOURCE_DIR/nvim" "$DESTINATION_DIR/.config/nvim"

# tmux configuration file
create_symlinks_in_directory "$SOURCE_DIR/tmux" "$DESTINATION_DIR/.config/tmux"

# .spaceshiprc file
create_symlink "$SOURCE_DIR/env/spaceship.zsh" "$DESTINATION_DIR/.config/spaceship.zsh"

# .gitconfig file
create_symlink "$SOURCE_DIR/env/.gitconfig" "$DESTINATION_DIR/.gitconfig"

# .zshrc file
create_symlink "$SOURCE_DIR/env/.zshrc" "$DESTINATION_DIR/.zshrc"

echo "Installation completed."
