set(CLANG_VERSIONS 17 16 15 14)

set(LLVM_DIR "" CACHE PATH "Lookup path for the llvm installation.")

# Find clang
function(do_lookup program out)
    set(VERSION_NAMES "")
    foreach(version ${CLANG_VERSIONS})
        set(NEW_NAME "${program}-${version}")
        list(APPEND VERSION_NAMES ${NEW_NAME})
    endforeach()
    # Custom path, explicit versions
    find_program(${program}_NAME_MATCH NAMES ${VERSION_NAMES} PATHS ${LLVM_DIR}/bin/ NO_DEFAULT_PATH)
    IF(NOT ${program}_NAME_MATCH)
        # System path, explicit versions
        find_program(${program}_NAME_MATCH NAMES ${VERSION_NAMES})
        IF(NOT ${program}_NAME_MATCH)
            # Custom path, implicit version
            find_program(${program}_NAME_MATCH NAMES ${program} PATHS ${LLVM_DIR}/bin/ NO_DEFAULT_PATH)
            IF(NOT ${program}_NAME_MATCH)
                # System path, implicit version
                find_program(${program}_NAME_MATCH NAMES ${program})
            ENDIF()
        ENDIF()
    ENDIF()
    IF(NOT ${program}_NAME_MATCH)
        set(${out} ${program})  # Fallback (TODO: find out why failing does not work here)
        # MESSAGE(FATAL_ERROR "Unable to find ${program} executable")
    ELSE()
        set(${out} ${${program}_NAME_MATCH} PARENT_SCOPE)
    ENDIF()
endfunction()


do_lookup(clang CLANG_EXECUTABLE)
do_lookup(clang++ CLANG++_EXECUTABLE)
do_lookup(lld LLD_EXECUTABLE)
