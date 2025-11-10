#!/usr/bin/env python
import os
import sys

env = SConscript("godot-cpp/SConstruct")

# Include paths
env.Append(CPPPATH=["src/"])
sources = Glob("src/*.cpp")

# Set output base directory and name
output_dir = "godot/bin/"
output_name = "libwarlock"

# Platform-specific build rules
if env["platform"] == "macos":
    library = env.SharedLibrary(
        os.path.join(
            output_dir,
            "{}.{}.framework/{}".format(output_name, env["target"], output_name)
        ),
        source=sources,
    )

elif env["platform"] == "ios":
    if env["ios_simulator"]:
        library = env.StaticLibrary(
            os.path.join(output_dir, "{}.{}.simulator.a".format(output_name, env["target"])),
            source=sources,
        )
    else:
        library = env.StaticLibrary(
            os.path.join(output_dir, "{}.{}.a".format(output_name, env["target"])),
            source=sources,
        )

else:
    library = env.SharedLibrary(
        os.path.join(output_dir, "{}{}{}".format(output_name, env["suffix"], env["SHLIBSUFFIX"])),
        source=sources,
    )

Default(library)
