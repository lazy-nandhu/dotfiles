import os
import random
import subprocess
from os.path import join, expanduser

# 1. Define the wallpaper directory (relative path from script execution)
# Note: Using "~/.wallpapers" is generally safer than "./.wallpapers" 
# if you intend the path to always be in your home directory.
# We will construct the absolute path below.
relative_path = "/home/nandhu/.wallpapers"
wallpapers = []

print(f"Scanning directory: {relative_path}")

try:
    # Use os.scandir for efficiency
    with os.scandir(relative_path) as obj:
        for entry in obj:
            if entry.is_file():
                # Add the filename to the list
                wallpapers.append(entry.name)
    
except FileNotFoundError:
    print(f"Error: Directory '{relative_path}' not found.")
    exit(1)


print(f"Found {len(wallpapers)} files.")

if not wallpapers:
    print("No wallpaper files found in the directory. Exiting.")
    exit(1)

# 2. Select a random wallpaper
# Use len() to ensure the index is always within bounds
num = random.randrange(0, len(wallpapers))
selected_filename = wallpapers[num]
print(f"Selected file: {selected_filename}")

# 3. Construct the full, absolute path safely
# We need the path that 'matugen' can actually use, which should be absolute.
# We join the intended *base* path with the filename.
# The original used "~/.wallpapers", so let's construct a reliable path using join()
base_path = "~/.wallpapers"
wallpaper_path = join(base_path, selected_filename)

# Expand the '~' to the full home directory path, which is crucial 
# for subprocess to interpret the path correctly, even with spaces.
absolute_path = expanduser(wallpaper_path)

print(f"Absolute Path: {absolute_path}")


# 4. Prepare and run the command
command = ["matugen", "image", absolute_path]

print(f"Executing Command: {' '.join(command)}")

# subprocess.run handles spaces in the path correctly when the path is passed 
# as a separate element in the list.
try:
    result = subprocess.run(command, check=True, capture_output=True, text=True)
    print("Command successful.")
    # print("--- Output ---")
    # print(result.stdout)
except subprocess.CalledProcessError as e:
    print(f"Command failed with error code {e.returncode}.")
    print(f"Standard Error:\n{e.stderr}")
except FileNotFoundError:
    print("Error: 'matugen' command not found. Is it installed and in your PATH?")
