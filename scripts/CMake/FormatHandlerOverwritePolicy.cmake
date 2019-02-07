cmake_minimum_required(VERSION 3.0.2)


# CMake options for overwritting. Three possibilities:
#   shouldOverwrite=true,
#   shouldOverwrite=false -> mustOverwriteOriginal = true | false
set(shouldOverwrite true CACHE BOOL
        "Whether trimAl and readAl should overwrite existant files or rename the output adding '.x' suffix where x is a integer.")

target_compile_definitions(trimal PUBLIC FormatHandlerOverwrites=${shouldOverwrite})

set(mustOverwriteOriginal true CACHE BOOL
        "Whether trimAl and readAl should overwrite the first (true) or the last(false) element if overwrite is needed.")

target_compile_definitions(trimal PUBLIC FormatHandlerOverwritesOriginal=${mustOverwriteOriginal})

message(STATUS "Will override original file if existent? ${shouldOverwrite}.")
if (NOT ${shouldOverwrite})
    message(STATUS "Will override original file if no alternatives found? ${mustOverwriteOriginal}.")
endif()