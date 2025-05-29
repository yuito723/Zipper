# zipper.py

import sys
import shutil

args = sys.argv

print("Compressing...")

shutil.make_archive(args[1], format = "zip", root_dir = args[2])

print("Completed!")

sys.exit()
